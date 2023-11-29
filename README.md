# GrandScheme 
A Neovim color scheme written in Lua that is designed to reduce
eye-strain, have a built-in minimal but useful status line
support TreeSitter and LSP Diagnostics, be easily configurable, 
AND load very fast.

## Installation and configuration  
Install and configure with [lazy.nvim](https://github.com/folke/lazy.nvim): 

```lua 
 {
 "drgo/grandscheme",
    priority = 1000,
    lazy = false,
    config= true 
  },
```
Because `config.style` is not specified, a color scheme will be picked in this order:
- the value of the environmental variable `VIMGSCOLOR` ('dark', 'light' or name of a custom scheme)
- the value of vim.o.background.
- default scheme = `dark`


To use the light scheme or change other options:
```lua 
 {
 "drgo/grandscheme",
    priority = 1000,
    lazy = false,
    opts = {
      style ="light",
	  statusline = true, 
    }
  },
```

- set `statusline` to true to enable the built-in statusline, which shows
full file path (truncated to 34 chars; red background means file changed, green
otherwise), LSP diagnostics, decimal/hexadecimal value of the char under the
cursor, file type, file encoding and current line number/total number of lines.  

-none of the options is mandatory. 

## Usage 
### Command `GScheme  arg` 
	to switch to a `dark` or `light` scheme
# GrandScheme
