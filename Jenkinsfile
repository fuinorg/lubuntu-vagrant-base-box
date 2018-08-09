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
                sh "ansible --version"
                sh "if [ -d vagrant-packet-builder ]; then rm -Rf vagrant-packet-builder; fi"
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
                            sh """
                            ansible-playbook playbook-create-bb.yaml ${params.SKIP_TAGS} --extra-vars '{ "git_project_url": "https://github.com/fuinorg/lubuntu-vagrant-base-box.git", "git_project_key": "None", "cloud_token": "${CLOUD_TOKEN}", "packet_project_name": "${PACKET_PROJECT_NAME}", "packet_project_id": "${PACKET_PROJECT_ID}", "packet_plan": "baremetal_0", "packet_facility": "ams1", "packet_operating_system": "ubuntu_18_04", "packet_hostname": "${PACKET_HOSTNAME}-${env.BUILD_NUMBER}", "packet_api_token": "${PACKET_API_TOKEN}", "ansible_ssh_private_key_file": "/private/fuin-org/vagrant-base-box-builder_id_rsa", "packet_key_file": "/private/fuin-org/vagrant-base-box-builder_id_rsa.pub", "vmware_serialNumber": "${VMWARE_SERIAL}", "vmware_url": "${VMWARE_URL}", "bb_no_release": "${BB_NO_RELEASE}", "artifact_version": "${BB_VERSION}", "artifact_description": "${BB_DESCRIPTION}" }'
                            """
                        }
                    }
                }
            }
        }
    }
}
