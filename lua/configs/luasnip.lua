local present, luasnip = pcall(require, "luasnip")

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

 -- options = load_override(options, "L3MON4D3/LuaSnip")
  --luasnip.config.set_config(options)
  --require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }
luasnip.snippets = {
    require("luasnip.loaders.from_vscode").lazy_load()
}

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })
