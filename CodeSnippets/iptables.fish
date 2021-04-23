echo This is not a script
exit 10


### Simple NAT
set OUTERDEV eth0
set INNERIP 10.12.34.0/24
set IPTABLES sudo iptables

eval $IPTABLES -t nat -A POSTROUTING -o $OUTERDEV -j MASQUERADE
eval $IPTABLES -A FORWARD -i $OUTERDEV -d $INNERIP -m state --state RELATED,ESTABLISHED -j ACCEPT
eval $IPTABLES -A FORWARD -o $OUTERDEV -m state --state RELATED,ESTABLISHED -j ACCEPT


### Add/remove routes on Windows (Powershell)
$gateway = "10.12.34.1"
route add 0.0.0.0/1 $gateway
route add 128.0.0.0/1 $gateway

$gateway = "10.12.34.1"
route delete 0.0.0.0/0 $gateway
route delete 0.0.0.0/1 $gateway
route delete 128.0.0.0/1 $gateway
