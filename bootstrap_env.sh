#!/usr/bin/env bash

echo ==== Creating temporary installation folder ====
mkdir /usr/local/temp

echo ==== Installing dependencies, curl, wget, unzip ====
apt-get -qy update > /dev/null 2>&1
apt-get -q -y install wget > /dev/null 2>&1
apt-get -q -y install curl > /dev/null 2>&1
apt-get -q -y install unzip > /dev/null 2>&1
apt-get -q -y install lsb-base > /dev/null 2>&1
apt-get -q -y install tofrodos > /dev/null 2>&1
echo ==== Installing Java OpenJDK ====
apt-get -q -y install openjdk-7-jre > /dev/null 2>&1
apt-get -q -y install openjdk-7-jdk > /dev/null 2>&1
apt-get -q -y install ant > /dev/null 2>&1
echo ==== Installing Oracle Sun Java ====
add-apt-repository ppa:webupd8team/java -y > /dev/null 2>&1
apt-get -qy update > /dev/null 2>&1
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -q -y install oracle-java7-installer > /dev/null 2>&1
update-java-alternatives -s java-7-oracle > /dev/null 2>&1
apt-get -q -y install oracle-java7-set-default > /dev/null 2>&1
echo ==== Installing firefox ====
apt-get install firefox -y > /dev/null 2>&1
echo ==== Installing chrome ====
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
mv *.deb /usr/local/temp
dpkg -i /usr/local/temp/google-chrome*; sudo apt-get -f install -y > /dev/null 2>&1
echo ==== Installing Intellij ====
wget -O /usr/local/temp/intellij.tar.gz http://download-cf.jetbrains.com/idea/ideaIC-14.0.1.tar.gz  > /dev/null &&
cd /usr/local/temp &&
tar xfz intellij.tar.gz &&
mkdir /opt/intellij &&
mv /usr/local/temp/* /opt/intellij/ &&
chmod 777 /opt/intellij/*/bin/idea.sh && chmod +x /opt/intellij/*/bin/idea.sh
fromdos /vagrant/proteus_add_site
chmod 777 /vagrant/proteus_add_site && chmod +x /vagrant/proteus_add_site
ln -s /vagrant/proteus_add_site /usr/bin/proteus_add_site