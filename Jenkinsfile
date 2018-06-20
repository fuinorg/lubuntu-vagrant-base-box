pipeline {
    agent any 
    environment {
        PACKET_PROJECT_NAME = 'lubuntu-vagrant-base-box'
        PACKET_PROJECT_ID = '2718bef8-9e5f-4660-b46a-5bfe5bee1685'
        PACKET_HOSTNAME = 'lubuntu-vagrant-base-box'
    }
    stages {
        stage('Setup Build') { 
            steps {
                sh "pip install --upgrade --user ansible"
                sh "pip install --user packet-python"
                sh "sudo /opt/jenkins/sbin/mount-webdav https://repository-fuin-org.forge.cloudbees.com/private fuin-org alert"
                sh "ansible --version"
                sh "git clone https://github.com/fuinorg/vagrant-packet-builder.git"
            }
        }
        stage('Build Images') { 
            steps {
                dir('vagrant-packet-builder') {
                    withCredentials( [ 
                            string(credentialsId: 'packet-lubuntu-vagrant-base-box-api-token', variable: 'PACKET_API_TOKEN'), 
                            string(credentialsId: 'vagrant-cloud-token', variable: 'CLOUD_TOKEN'), 
                            string(credentialsId: 'vmware_workstation_14_linux_serial_number', variable: 'VMWARE_SERIAL'),
                            string(credentialsId: 'vmware_workstation_14_linux_bundle_url', variable: 'VMWARE_URL') 
                                     ] ) {
                        script {
                            sh "ls"
                        }
                    }
                }
            }
        }
    }
}
