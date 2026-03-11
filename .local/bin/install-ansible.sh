#!/bin/bash

which pipx || { echo "pipx need to be installed"; exit 1 } 

pipx ensurepath &&
  pipx install ansible-core &&
  pipx inject --include-apps ansible-core ansible-lint &&
  pipx inject ansible-core argcomplete &&
  sudo activate-global-python-argcomplete

register-python-argcomplete --shell bash pipx | sudo tee /etc/bash_completion.d/pipx
echo "export ANSIBLE_VAULT_PASSWORD_FILE=~/.vlt" >> ~/.bashrc

which codium || exit 0

CODIUM_EXTENSIONS=(
	redhat.vscode-yaml
	redhat.ansible
)

CODIUM_EXTERNAL_EXTENSIONS=(
	https://github.com/ipierre1/ansible-vault-vscode/releases/download/v1.0.12/ansible-vault-vscode-1.0.12.vsix
)

for ext in ${CODIUM_EXTENSIONS[@]}; do
	codium --install-extension $ext
done

for ext_url in ${CODIUM_EXTERNAL_EXTENSIONS[@]}; do
	[ ! -f "/tmp/$(basename $ext_url)" ] && curl --location $ext_url --output /tmp/$(basename $ext_url)
	codium --install-extension /tmp/$(basename $ext_url)
done
