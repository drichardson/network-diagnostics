#
# Network Diagnostics
#

Network diagnostic suite that runs the following tests against a list of addresses:

- traceroute
- ping
- iperf3, in normal and reverse mode

iperf3 needs to be installed on the target hosts and be running as:

    iperf3 --server

The following should be reachable on each of the target addresses:

- ICMP
- UDP port 5201 (iperf3)

