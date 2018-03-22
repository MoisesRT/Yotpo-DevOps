NOMAD_VERSION="1.0.6"

echo "Installing dependencies ..."
sudo apt-get update
sudo apt-get install -y unzip curl
echo "Determining Consul version to install ..."
CHECKPOINT_URL="https://checkpoint-api.hashicorp.com/v1/check"
echo "Fetching Consul version ${NOMAD_VERSION} ..."
cd /tmp/
curl -s https://releases.hashicorp.com/consul/${NOMAD_VERSION}/consul_${NOMAD_VERSION}_linux_amd64.zip -o consul.zip
echo "Installing Consul version ${NOMAD_VERSION} ..."
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d
echo "Starting Consul ..."
sudo mv /home/vagrant/consul.service /etc/systemd/system/consul.service
sudo systemctl daemon-reload
sudo systemctl start consul