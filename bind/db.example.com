$TTL 86400
@   IN  SOA     ns.example.com. admin.example.com. (
                      1       ; Serial
                 604800       ; Refresh
                  86400       ; Retry
                2419200       ; Expire
                 604800 )     ; Negative Cache TTL

             IN  NS      ns.example.com.
@            IN  A       10.173.75.2
ns           IN  A       10.173.75.2
