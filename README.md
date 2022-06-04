## Table of Contents

1. [Contents](#Contents)
2. [NeoVim plugins](#NeoVim-plugins)
    - [42](#42)
    - [LSP](#LSP)
    - [Completion](#Completion)
    - [Snippets](#Snippets)
    - [Telescope](#Telescope)
    - [Treesitter](#Treesitter)
    - [NvimTree](#NvimTree)
    - [Git](#Git)
    - [Doge](#Doge)
    - [Markdown](#Markdown)
    - [Themes](#Themes)
    - [Others](#Others)
3. [Tmux plugins](#Tmux-plugins)
4. [Shell setup](#Shell-setup)

---

## Contents

- [git](https://git-scm.com) config - Version control system.
- [vim (NeoVim)](https://github.com/neovim/neovim/wiki/Installing-Neovim) config - Vim-fork focused on extensibility and usability.
	- Plugins are managed with [packer](https://github.com/wbthomason/packer.nvim).
- [tmux](https://github.com/tmux/tmux) config - Terminal multiplexer.
	- Plugins are managed with [tmux-plugins/tpm](https:/github.com/tmux-plugins/tpm).
- [zsh](https://www.zsh.org) config - Interactive use designed shell.

## NeoVim plugins

### 42

- [42Paris/42header](https://github.com/42Paris/42header) - 42 mandatory header.

### LSP

- [NeoVim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the neovim LSP client.
- [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) Plugin to manage LSP servers.

### Completion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin for NeoVim coded in Lua.
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Source for buffer completions.
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - Source for path completions.
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Source for command line completions.
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Source for NeoVim builtin LSP client.
- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - Source for NeoVim lua completions.
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Source for LuaSnip completions.

### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine for NeoVim.
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages.

### Telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder for NeoVim.
- [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim) - Telescope extension to preview media files.

### Treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations and abstraction layer.
- [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) - Rainbow parentheses for NeoVim using tree-sitter.
- [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Treesitter plugin for setting the commentstring based on the cursor location in a file.

### NvimTree

- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - File explorer tree for NeoVim.
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Adds file type icons to the file explorer.

### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers.

### Doge

- [kkoomen/vim-doge](https://github.com/kkoomen/vim-doge) - Documentation generator, generate proper code documentation skeletons with a single keypress.

### Markdown

- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown previewer (browser).
- [ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim) - Markdown preview (builtin).

### Themes

- [wojciechkepka/vim-github-dark](https://github.com/wojciechkepka/vim-github-dark) - A dark GitHub theme for Vim and NeoVim.

### Others

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager for NeoVim.
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim) - An implementation of the Popup API from vim in NeoVim.
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Useful lua functions used by a lots of plugins.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Easily comment lines and blocks.
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs, integrates with both cmp and treesitter.
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Nice bufferline.
- [moll/vim-bbye](https://github.com/moll/vim-bbye) - Plugin preventig from quitting after closing last buffer.
- [andweeb/presence.nvim](https://github.com/andweeb/presence.nvim) - Discord rich presence integration.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Fast and easy to configure NeoVim statusline plugin.

## Tmux plugins

- [tmux-plugins/tpm](https:/github.com/tmux-plugins/tpm) - Tmux Plugin Manager.
- [tmux-plugins/tmux-resurrect](https:/github.com/tmux-plugins/tmux-resurrect) - Plugin to persists tmux environment across system restarts. 
- [tmux-plugins/tmux-continuum](https:/github.com/tmux-plugins/tmux-continuum) - Continuous saving of tmux environment and automatic restore when tmux is started.  

## Shell setup

- [Exa](https://the.exa.website/install/linux) - `ls` replacement.
- [z](https://the.exa.website/agkozak/zsh-z) - Jump quickly to directories that you have visited "frecently".
- [bat](https://github.com/sharkdp/bat) - A cat(1) clone with wings.
- [btop](https://github.com/aristocratos/btop) - A nice monitor of resources.
- [rmlint](https://github.com/sahib/rmlint) - Extremely fast tool to remove duplicates and other lint from your filesystem.
- [HUB](https://github.com/github/hub) - A command-line tool that makes git easier to use with GitHub.
- [Commitizen](https://github.com/commitizen/cz-cli) - Better commit forms.
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) - A powerline theme for zsh.
