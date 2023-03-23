# NeoVim Configuration

## How to setup

### Linux/MacOS

1. Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart) on your machine
2. Clone this repository in `~/.config`
3. Rename the repository to `nvim` (with `mv ./nvim.config ./nvim` for example)
4. Open the repository in netrw with `nvim .`
5. Go to `nvim/lua/packer.lua` through the netrw interface
6. Run the command `:so` and then the command `:PackerSync`
7. To setup Copilot, run the command `:Copilot setup` (you also need Node.js installed)
8. Follow the instructions
9. Be happy

### Windows

1. Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart) on your machine
2. Install the MinGW toolchain with `choco install mingw`
3. Clone this repository in `%USERPROFILE%\AppData\Local`
4. Rename the repository to `nvim` (with `mv ./nvim.config ./nvim` for example)
5. Open the repository in netrw with `nvim .`
6. Go to `nvim/lua/packer.lua` through the netrw interface
7. Run the command `:so` and then the command `:PackerSync`
8. To setup Copilot, run the command `:Copilot setup` (you also need Node.js installed)
9. Follow the instructions
10. Be happy


