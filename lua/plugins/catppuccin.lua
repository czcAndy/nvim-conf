return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      transparent_background = false,
      background = {
        light = "latte",
        dark = "mocha",
      },
    })
  end,
}
