#!/bin/bash

ADDRESSES=(
api.protonmail.ch
34.65.23.66
35.216.222.211
)

for addr in ${ADDRESSES[@]}; do
	echo '#'
	echo "# Testing $addr"
	echo '#'
	echo
	echo "# traceroute $addr"
	traceroute $addr
	echo "traceroute exited with $?"
	echo
	echo "# ping -c 10 -i 0.2 $addr"
	ping -c 10 -i 0.2 $addr
	echo "ping exited with $?"
	echo
	echo "iperf3 --udp --omit 2 --bitrate 500M --client $addr"
	iperf3 --udp --omit 2 --bitrate 500M --client $addr
	echo "iperf3 exited with $?"
	echo "iperf3 --udp --omit 2 --bitrate 500M --client $addr --reverse"
	iperf3 --udp --omit 2 --bitrate 500M --client $addr --reverse
	echo "iperf3 exited with $?"
done

