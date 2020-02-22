#!/bin/bash

declare -A ADDRESSES=(
[api.protonmail.ch]='Proton Mail'
[34.65.23.66]='GCP europe-west6-a (Zurich) premium network'
[35.216.222.211]='GCP europe-west6-a (Zurich) standard network'
[3.127.36.12]='AWS Frankfurt'
)

for addr in ${!ADDRESSES[@]}; do
	echo '#'
	echo "# Testing $addr - ${ADDRESSES[$addr]}"
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
	echo iperf3 --connect-timeout 1000 --udp --omit 2 --bitrate 500M --client $addr
	iperf3 --connect-timeout 1000 --udp --omit 2 --bitrate 500M --client $addr
	echo "iperf3 exited with $?"
	echo iperf3 --connect-timeout 1000 --udp --omit 2 --bitrate 500M --client $addr --reverse
	iperf3 --connect-timeout 1000 --udp --omit 2 --bitrate 500M --client $addr --reverse
	echo "iperf3 exited with $?"
done

