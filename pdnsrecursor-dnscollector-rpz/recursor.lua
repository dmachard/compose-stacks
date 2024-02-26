rpzFile("/etc/powerdns/blackhole.rpz", {policyName="rpz_blackhole", includeSOA=true})
rpzFile("/etc/powerdns/threat.rpz", {policyName="rpz_threat", includeSOA=true})
rpzFile("/etc/powerdns/whitelist.rpz", {policyName="rpz_whitelist", includeSOA=true})

protobufServer("192.168.1.17:6000", {
    logQueries=true,
    logResponses=true,
    exportTypes={'A', 'AAAA', 'CNAME', 'MX', 'NS', 'PTR', 'SPF', 'SRV', 'TXT'}
})

outgoingProtobufServer("192.168.1.17:6000", {
    logQueries=true,
    logResponses=true,
    exportTypes={'A', 'AAAA', 'CNAME', 'MX', 'NS', 'PTR', 'SPF', 'SRV', 'TXT'}
})

