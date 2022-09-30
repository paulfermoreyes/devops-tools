# DevOps Tools
This repo includes scripts, tools, processes used in DevOps

## Todo
- Jenkins Server
- Jenkins Workflow Example
- Github Actions Template
- Terraform AWS Template

## Install tools
### Python
```
# Optional
sudo apt-get install build-essential

# Install Python environment switcher
curl https://pyenv.run | bash

# Setup pyenv for zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
exec zsh

# To identify available Python versions
# pyenv install --list

# Install Python 3.9
pyenv install pypy3.9-7.3.9

# Set virtualenv
NEW_VIRTUALENV_NAME=your_virtualenv
pyenv virtualenv $(NEW_VIRTUALENV_NAME)
pyenv activate $(NEW_VIRTUALENV_NAME)
