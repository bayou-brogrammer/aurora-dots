
function install-astro {

    echo cloning atomicnvim repo to ~/.config/nvim
    gh repo clone bayou-brogrammer/AtomicNvim ~/.config/nvim
}
function install-starship-prompt {

    if [ ! -f $HOME/.config/starship.toml ]
    then
    curl -fsSL https://devbox.getfleek.dev/config/starship/starship.toml > $HOME/.config/starship.toml
    fi
}
function npm-global {

    grep -qF '.npm-packages' ~/.npmrc || echo 'prefix=~/.npm-packages' >> ~/.npmrc
    grep -qF '.npm-packages' ~/.zshrc || echo 'export PATH=$PATH:~/.npm-packages/bin' >> ~/.zshrc
    grep -qF '.npm-packages' ~/.bashrc || echo 'export PATH=$PATH:~/.npm-packages/bin' >> ~/.bashrc
    mkdir -p ~/.npm-packages
}
