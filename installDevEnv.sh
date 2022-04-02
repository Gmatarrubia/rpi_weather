#!/bin/bash

function check_ansible(){
    if [ -n "$(which ansible-playbook)" ]
    then
        echo "Ansible already installed"
    else
        echo "Installing ansible..."
        sudo apt install -y ansible
    fi
}

function check_vscode(){
    if [ -n "$(which code)" ]
    then
        echo "VS Code already installed"
    else
        echo "Installing ansible..."
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt install -y code
        code --install-extension Dart-Code.dart-code Dart-Code.flutter mhutchie.git-graph ms-vscode-remote.remote-containers ms-vscode-remote.remote-wsl
        code --install-extension ms-vscode-remote.vscode-remote-extensionpack timonwong.shellcheck
    fi
}

## Script entry
check_vscode
check_ansible

sudo ansible-playbook installDevEnv.yml
ansible-playbook installFlutter.yml
