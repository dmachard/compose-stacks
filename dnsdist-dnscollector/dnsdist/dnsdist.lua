---------------------------------------------------
-- Administration
---------------------------------------------------

-- cli
setKey("rxPEivJozPHSNQPUu7ufq8SYwrWSpuavHQ2U0TFhaZc=")
controlSocket("127.0.0.1:5199")
addConsoleACL("127.0.0.1/8, ::1/128")

-- api
webserver("0.0.0.0:8083")
setWebserverConfig({
  apiKey = "cApojXpQY-ihXcJGzVojSg",
  password = "FJnviVxndeSOVss4BBl3YA",
  acl = "0.0.0.0/0",
})

---------------------------------------------------
-- Dns services
---------------------------------------------------

-- udp/tcp dns listening
setLocal("0.0.0.0:53", {})
addLocal("::")

-- dns caching
pc = newPacketCache(10000, {})

-----------
-- Logs ---
-----------
local f = assert(io.popen('getent hosts dnscollector | cut -d " " -f 1', 'r'))
local dnscollector = f:read('*a') or "127.0.0.1"
f:close()
dnscollector = string.gsub(dnscollector, "\n$", "")
infolog("collector="..dnscollector)

local f = io.popen ("/bin/hostname")
local hostname = f:read("*a") or "dnsdist"
f:close()
hostname = string.gsub(hostname, "\n$", "")
infolog("hostname="..hostname)

fstl = newFrameStreamTcpLogger(dnscollector.. ":6000")
addAction(AllRule(), DnstapLogAction(hostname, fstl))
addResponseAction(AllRule(), DnstapLogResponseAction(hostname, fstl))
addCacheHitResponseAction(AllRule(), DnstapLogResponseAction(hostname, fstl))

---------------------------------------------------
-- Pools
---------------------------------------------------

pool_resolv = "resolvers"

-- members definitions
newServer({
  address = "8.8.8.8",
  pool = pool_resolv,
})

newServer({
  address = "1.1.1.1",
  pool = pool_resolv,
})

-- set the load balacing policy to use
setPoolServerPolicy(roundrobin, pool_resolv)

-- enable cache
getPool(pool_resolv):setCache(pc)


---------------------------------------------------
-- Rules
---------------------------------------------------

-- matches all incoming traffic and send-it to the pool of resolvers
addAction(
  AllRule(),
  PoolAction(pool_resolv)
)

