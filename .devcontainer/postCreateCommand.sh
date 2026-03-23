#!/bin/bash

# Install uv and project dependencies
pip install uv
uv venv .venv
uv sync

# Install Quarto
QUARTO_VERSION="1.6.43"
wget -qO /tmp/quarto.deb "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb"
sudo dpkg -i /tmp/quarto.deb
rm /tmp/quarto.deb

echo "source /workspaces/${PWD##*/}/.venv/bin/activate" >> ~/.zshrc
