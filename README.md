# Aurora Dotfiles

![thumbnail](./assets/img_2.webp)

Welcome to the Aurora Dotfiles repository! 🌌✨

Embrace the beauty of the Aurora Lights in your digital realm. Let your configurations shine bright with Aurora Dotfiles!

## Introduction

This repository houses all the configurations for dotfiles, system files, and program setups. Harnessing the power of [Chezmoi](https://www.chezmoi.io/), a dotfile manager, this repository ensures seamless management and synchronization across your devices, bringing the enchanting beauty of the Aurora Lights to your digital realm. Explore, customize, and let your computing experience shine with the brilliance of this meticulously crafted collection.

## Features

- **Aurora-inspired Themes**: Dive into a world of vibrant colors and enchanting hues with our Aurora-inspired themes for your system and applications.
- **Chezmoi Integration**: Managed with Chezmoi, a powerful dotfile manager, ensuring effortless synchronization and management across devices.
- **Customization**: Tailor your computing environment to your preferences with customizable configurations for various programs and utilities.

## Getting Started

### Quick Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply https://github.com/bayou-brogrammer/aurora-dots
```

### Manual Installation

1. Install Chezmoi if you haven't already and clone the dotfiles:
   ```bash
   chezmoi init https://github.com/bayou-brogrammer/aurora-dots.git
   ```

2. Customize the configurations to suit your preferences. You can edit with any editor or use `chezmoi edit <file>`

3. Apply the configurations to your system:
   ```bash
   chezmoi apply
   ```

## Contribution

Contributions are welcome! Whether you have improvements, bug fixes, or new features to suggest, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE), allowing you to modify and distribute the code as you see fit.

## Acknowledgements

Special thanks to the developers of Chezmoi for providing a robust solution for managing dotfiles.
