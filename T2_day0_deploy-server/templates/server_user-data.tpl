#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;