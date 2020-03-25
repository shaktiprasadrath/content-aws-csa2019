#!/bin/bash
yum install -y httpd php git

cd /var/www/html



wget https://github.com/shaktiprasadrath/content-aws-csa2019/blob/master/lesson_files/07_hybrid_scaling/1_LBandASG/CLBandHealth/Surveen_Chawla.jpg
mv Surveen_Chawla.jpg model.jpg
wget https://github.com/shaktiprasadrath/content-aws-csa2019/blob/master/lesson_files/07_hybrid_scaling/1_LBandASG/CLBandHealth/index.php
mv /var/www/html/htaccess /var/www/html/.htaccess

mkdir /var/www/html/models
cp /var/www/html/model.jpg /var/www/html/models
cp /var/www/html/index.php /var/www/html/models
cp /var/www/html/.htaccess /var/www/html/models

sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
