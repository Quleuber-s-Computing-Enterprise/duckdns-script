# duckdns-script

Updates DuckDNS records. Auto detects IPv6 with seeip.org.

---

```
Usage:
   ./duckdns-script --help
   ./duckdns-script --clear [--domains]
   ./duckdns-script [--domains]
                    [--ipv4 IPV4] [--ipv6 IPV6]
                    [--ipv6-auto] [--ipv6-auto]

Help:
    -h,--help         Shows this text.
    -d,--domains      Comma separated list of the subnames you
                      want to update.
    -c,--clear        Clear all records. Ignores IP options below.
    -4,--ipv4 IPV4    Sets IPv4 to given IP.
    -6,--ipv6 IPV6    Sets IPv6 to given IP.
    -4a,--ipv6-auto   Sets IPv4 to automatically detected IP.
    -6a,--ipv6-auto   Sets IPv6 to automatically detected IP.
```

## Requirements

- curl
