echo This is not a script
exit 10


### Simple NAT
set OUTERDEV enp0s31f6
set INNERIP 10.1.0.0/24
set IPTABLES "sudo iptables"

$IPTABLES -t nat -A POSTROUTING -o $OUTERDEV -j MASQUERADE
$IPTABLES -A FORWARD -i $OUTERDEV -d $INNERIP -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A FORWARD -s $INNERIP -o $OUTERDEV -j ACCEPT
