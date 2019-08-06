echo ""************ Setting Up Que Enterprise Server ************"
echo "Powered by Cloudloom Labs"
echo "Que Enterprise v0.0.5"
echo "Mysql v5.7"
echo "Rabbitmq v3-management"
echo "Pentaho v8.0CE-FULL"
echo "PDI Kettle v8.0CE-FULL"
echo "Updating Linux Packages"
sudo yum upgrade and yum update
echo "Installing Wget"
sudo yum -y install wget
#Install Docker
echo "Installing Docker"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker.service
sudo systemctl start docker.service
echo "Successfully Installed Docker"
#Install Docker-Compose
echo "Installing Docker-Compose"
sudo yum install epel-release
sudo yum install -y python-pip
sudo pip install docker-compose
sudo yum -y upgrade python*
docker-compose version
echo "Successfully Installed Docker-Compose"
#Login to Cloudloom Docker Registry
echo "Please enter Docker username and Password"
docker login docker.cloudloom.io
#Create Docker-Compose Que Enterprise App
echo "Installing Que Enterprise App"
cd
mkdir que-ent
cd que-ent
wget -O -q https://cloudloom.github.io/que-enterprise-delivery/app/v0.2/docker-compose.yml
docker-compose up -d
echo "Successfully Installed Que Enterprise App"
#Create Docker-Compose Que Enterprise Reporting
echo "Installing Que Enterprise Reporting"
cd
mkdir que-ent-reporting
cd que-ent-reporting
wget -O -q https://cloudloom.github.io/que-enterprise-delivery/reporting/v0.2/docker-compose.yml
wget -O -q https://cloudloom.github.io/que-enterprise-delivery/reporting/v0.2/license.lic -P license/
docker-compose up -d
echo "Successfully Installed Que Enterprise App"
echo "Contact support@cloudloom.io for any assistance"
echo "************ Successfully Setup Que Enterprise Server ************"
