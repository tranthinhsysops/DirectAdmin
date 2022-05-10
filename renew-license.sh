#/bin/bash
/usr/sbin/ifdown lo:100
rm -f /tmp/license.key
rm -f /usr/local/directadmin/conf/license.key
/usr/bin/wget -O /tmp/license.key.gz https://github.com/tranthinhsysops/DirectAdmin/blob/main/license.key.gz
/usr/bin/gunzip /tmp/license.key.gz
mv /tmp/license.key /usr/local/directadmin/conf/
chmod 600 /usr/local/directadmin/conf/license.key
chown diradmin:diradmin /usr/local/directadmin/conf/license.key
/usr/sbin/ifup lo:100
/bin/systemctl restart directadmin.service
