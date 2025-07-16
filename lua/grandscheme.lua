-- grandscheme.lua: Minimal loader for Vim/Neovim colorschemes

local M = {}
M.opts = {} -- Cache for user settings, needed by Gscheme command
local sname = 'grandscheme_'

--- Try requiring both bare and prefixed module names.
-- This version clears the module cache to allow for reloading themes.
-- @param name string: The name of the theme module to load (e.g., 'light').
-- @return table|nil: The loaded scheme table, or nil on failure.
local function mod_load(name)
  local candidates = { name, sname .. name }
  local errors = {}
  for _, modname in ipairs(candidates) do
    -- Invalidate the cache for this module to ensure it's re-read from the file.
    -- This is the key fix for the :Gscheme command.
    package.loaded[modname] = nil
    local ok, mod_or_err = pcall(require, modname)
    if ok and type(mod_or_err) == 'table' then
      return mod_or_err
    elseif not ok then
      -- Store the actual error message for better debugging.
      table.insert(errors, string.format("  - Tried '%s': %s", modname, tostring(mod_or_err)))
    end
  end
  -- If we get here, all attempts failed.
  local err_msg = "Could not load colorscheme module: '" .. name .. "'\n" .. table.concat(errors, "\n")
  vim.notify(err_msg, vim.log.levels.ERROR)
  return nil
end

--- Setup the colorscheme loader
-- @param opts table: options
function M.setup(opts)
  opts = opts or {}
  vim.validate { opts = { opts, 'table' } }

  if opts.style ~= nil then
    vim.validate { style = { opts.style, 'string' } }
  end
  if opts.scheme ~= nil then
    vim.validate { scheme = { opts.scheme, 'table' } }
  end
  if opts.statusline ~= nil then
    vim.validate { statusline = { opts.statusline, 'boolean' } }
  end

  local style = opts.style
  if not style or style == '' then
    style = os.getenv('VIMGSCOLOR') or vim.o.background
    if not style or style == '' then
      style = 'dark'
    end
  end
  style = style:lower():gsub('%.lua$', '')
  opts.style = style

  opts.scheme = opts.scheme or mod_load(style)
  if not opts.scheme then return end -- Stop if scheme failed to load

  opts.statusline = opts.statusline == true
  M.opts = opts -- Cache the validated options for the :Gscheme command
  M.setStyle(opts)
end

--- Apply a style table and configure environment
-- @param opts table: validated options from setup
function M.setStyle(opts)
  local scheme = opts.scheme
  if type(scheme) ~= 'table' then
    vim.notify('Invalid scheme table for style: ' .. tostring(opts.style), vim.log.levels.ERROR)
    return
  end

  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  vim.g.colors_name = sname .. opts.style
  vim.o.termguicolors = true

  for group, styles in pairs(scheme) do
    vim.api.nvim_set_hl(0, group, styles)
  end

  if opts.statusline then
    local ok, st = pcall(require, 'stline')
    if ok and type(st.setup) == 'function' then
      st.setup()
    else
      vim.notify("Could not load statusline module 'stline'", vim.log.levels.WARN)
    end
  end
end

-----------------------------------------------------------------------------
-- User Commands
-----------------------------------------------------------------------------

vim.api.nvim_create_user_command("Gscheme", function(opts)
  if #opts.fargs ~= 1 then
    vim.notify("Usage: Gscheme <style_name>", vim.log.levels.ERROR)
    return
  end

  local style_name = opts.fargs[1]
  local scheme = mod_load(style_name)

  if not scheme then return end

  local new_opts = {
    style = style_name,
    scheme = scheme,
    statusline = M.opts and M.opts.statusline or false,
  }
  M.setStyle(new_opts)
  vim.notify("Colorscheme set to " .. style_name)
end, {
  nargs = 1,
  complete = function()
    return { "dark", "light" }
  end,
  desc = "Set the grandscheme colorscheme.",
})

local lsp_hl_cache = {}
local lsp_hl_disabled = false

vim.api.nvim_create_user_command("LspHighlightToggle", function()
  lsp_hl_disabled = not lsp_hl_disabled

  if lsp_hl_disabled then
    lsp_hl_cache = {}
    local lsp_groups = vim.fn.getcompletion("@lsp", "highlight")
    for _, group in ipairs(lsp_groups) do
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if ok and hl and next(hl) ~= nil then
        lsp_hl_cache[group] = hl
        vim.api.nvim_set_hl(0, group, {})
      end
    end
    vim.notify("LSP highlights disabled.")
  else
    if next(lsp_hl_cache) == nil then
      vim.notify("No cached LSP highlights to restore.", vim.log.levels.WARN)
      return
    end
    for group, styles in pairs(lsp_hl_cache) do
      vim.api.nvim_set_hl(0, group, styles)
    end
    lsp_hl_cache = {}
    vim.notify("LSP highlights restored.")
  end
end, {
  nargs = 0,
  desc = "Toggle LSP semantic highlighting.",
})

return M

