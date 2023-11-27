# GrandScheme 
A Neovim color scheme written in Lua that is designed to reduce
eye-strain, supports TreeSitter and LSP Diagnostics AND load very fast.

## Installation and configuration  
Install and configure with [lazy.nvim](https://github.com/folke/lazy.nvim) 

To use the default (dark) color scheme:
```lua 
 {
 "drgo/grandscheme",
    priority = 1000,
    lazy = false,
    config= true 
  },
```

To use the light scheme:
```lua 
 {
 "drgo/grandscheme",
    priority = 1000,
    lazy = false,
    opts = {
      style ="light"
    }
  },
```

None of the options is mandatory. 

## Usage 
### Command `GScheme  arg` 
	to switch to a `dark` or `light` scheme
# GrandScheme
