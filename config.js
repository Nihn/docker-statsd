{
    "backends": ["./backends/graphite"],
    "flushInterval": 10000,
    "graphiteHost": "localhost",
    "graphitePort": 2003,
    "percentThreshold": [90, 99],
    "servers": [
        {
            "server": "./servers/udp",
            "port": 8125
        }
    ]
}
