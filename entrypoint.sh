#!/bin/zsh

export ZSH_CUSTOM=/root/.oh-my-zsh/custom

# Install Oh My Zsh only if not already installed
if [ ! -d /root/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
    exit 1
  }
else
  echo "Oh My Zsh already installed, skipping."
fi

rsync -a /dotfiles/ /root/

if [ ! -d /root/.zsh_autorun ]; then
  mkdir -p /root/.zsh_autorun
  echo "Created /root/.zsh_autorun"
else
  echo "/root/.zsh_autorun already exists, skipping."
fi

chmod +x -R /root/.zsh_autorun

# Run all .sh scripts in /root/.zsh_autorun at shell startup
for script in /root/.zsh_autorun/*.sh(N); do
  if [ -f "$script" ] && [ -x "$script" ]; then
    "$script" >> /root/autorun.log 2>&1
  fi
done