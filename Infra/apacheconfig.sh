#!/bin/bash
#Install Apache
sudo /usr/bin/apt-get update
sudo /usr/bin/apt-get install apache2 -y
#Mount File system
sudo /sbin/mkfs.xfs /dev/xvdm
sudo /bin/mkdir /data
sudo /bin/mount /dev/xvdm /data
sudo /bin/mkdir -p /data/var/www/html
blockid=`/sbin/blkid|grep xvdm|awk -F'"' '{print $2}'`
sudo /bin/cp /etc/fstab /etc/fstab.orig
sudo echo "UUID=$blockid  /data  xfs  defaults,nofail  0  2" >> /etc/fstab
#Change apache conf
sudo chmod 644 /etc/apache2/sites-enabled/000-default.conf
echo > /etc/apache2/sites-enabled/000-default.conf
sudo echo "<VirtualHost *:80>
ServerAdmin webmaster@localhost
        DocumentRoot /data/var/www/html
        <Directory />
                Options FollowSymLinks
                AllowOverride None
       </Directory>
      <Directory /data/var/www/html/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Require all granted
        </Directory>
                    ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >/etc/apache2/sites-enabled/000-default.conf

#Change html file
sudo chmod 644 /data/var/www/html/index.html
sudo echo "<html>
    <head>
        <title>Linux Server</title>
    </head>
    <body>
        <h1> Hello AWS World - running on Linux - on port 80 </h1>
        <img src= "https://s3-ap-southeast-1.amazonaws.com/testwebserverscreenshots/linux/screen-shot1.JPG" \n /> <br /><br /><br />
        <img src= "https://s3-ap-southeast-1.amazonaws.com/testwebserverscreenshots/linux/screen-shot2.JPG" \n /> <br /><br /><br />
        <img src= "https://s3-ap-southeast-1.amazonaws.com/testwebserverscreenshots/linux/screen-shot3.JPG" /> <br /><br /><br /><br /><br /><br />

        <h2> This Infrastructure is created by Terraform and all code is available in public repo for reference - "https://github.com/mnjdby/Assignment1" </h2> <br /><br /><br />


    </body>
</html>" > /data/var/www/html/index.html
sudo systemctl restart apache2
