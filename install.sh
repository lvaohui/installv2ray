wget https://github.com/v2ray/v2ray-core/releases/download/v4.26.0/v2ray-linux-64.zip
yum install unzip -y
unzip v2ray-linux-64.zip -d v2ray-4.26
cd v2ray-4.26
mkdir /usr/bin/v2ray
cp v2ray /usr/bin/v2ray/v2ray
cp v2ctl /usr/bin/v2ray/v2ctl
cp geoip.dat /usr/bin/v2ray/geoip.dat
cp geosite.dat /usr/bin/v2ray/geosite.dat
mkdir /etc/v2ray/
cp vpoint_vmess_freedom.json /etc/v2ray/config.json
cd ..
rm -rf v2ray-4.26
echo "install v2ray done"

mv v2ray /etc/init.d/v2ray
chmod a+x /etc/init.d/v2ray
chkconfig v2ray on
mv v2ray_config.json /etc/v2ray/config.json
service v2ray start

#### nginx ####
yum install epel-release
yum install nginx -y

mv nginx.conf /etc/nginx/conf.d/v2ray.conf
service nginx restart
yum install certbot -y
mkdir /ssl
echo "run this command to open ssl"
echo "certbot certonly -m test@163.com --webroot -w /ssl -d test.com"
