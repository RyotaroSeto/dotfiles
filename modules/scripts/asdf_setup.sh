#!/bin/zsh

# asdfがなければインストール
if [ ! -e "$HOME/.asdf" ]; then
  echo "installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.14.0
  echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
  exec $SHELL -l
  source ~/.zshrc
fi

PLUGS=$(
  cat <<EOF
golang
nodejs
pnpm
kubectl
kind
awscli
jq
lazygit
task
helm
argocd
EOF
)

asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add pnpm
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf plugin-add kind https://github.com/reegnz/asdf-kind.git
asdf plugin add awscli
asdf plugin-add jq https://github.com/lsanwick/asdf-jq.git
asdf plugin add lazygit
asdf plugin-add task https://github.com/particledecay/asdf-task.git
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf plugin-add argocd https://github.com/beardix/asdf-argocd.git

echo "$PLUGS" | xargs -L 1 -I{} asdf install {} latest
echo "$PLUGS" | xargs -L 1 -I{} asdf global {} latest
