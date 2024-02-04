rpzFile("/etc/powerdns/basic.rpz", {policyName="rpzbasic"})

--protobufServer("192.168.1.17:6001", {
--    logQueries=true,
--    logResponses=true,
--    exportTypes={'A', 'AAAA', 'CNAME', 'MX', 'NS', 'PTR', 'SPF', 'SRV', 'TXT'}
--})

dnstapFrameStreamServer("192.168.1.17:6000", {
	logQueries=true,
	logResponses=true
})