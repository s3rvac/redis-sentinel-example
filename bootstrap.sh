#!/usr/bin/sh

echo "net.core.somaxconn = 4096" >> /etc/sysctl.conf
echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
sysctl --system

# Prevent the installation process from automatically starting the services (we
# want to use a custom config and start them manually afterwards).
# https://jpetazzo.github.io/2013/10/06/policy-rc-d-do-not-start-services-automatically/
echo exit 101 > /usr/sbin/policy-rc.d
chmod +x /usr/sbin/policy-rc.d

apt update
apt install -y vim redis-server redis-sentinel

rm /usr/sbin/policy-rc.d

cp /vagrant/configs/$(hostname)/redis.conf /etc/redis/redis.conf
chown redis:redis /etc/redis/redis.conf
chmod 0600 /etc/redis/redis.conf

cp /vagrant/configs/$(hostname)/sentinel.conf /etc/redis/sentinel.conf
chown redis:redis /etc/redis/sentinel.conf
chmod 0600 /etc/redis/sentinel.conf

systemctl start redis-server
systemctl start redis-sentinel
