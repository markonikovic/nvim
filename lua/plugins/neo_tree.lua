return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-n>", function()
      local ft = vim.bo.filetype
      if ft == "neo-tree" then
        -- Toggle Neo-tree (close it)
        vim.cmd("Neotree toggle")
      else
        --  Neo-tree (open it if not already)
        vim.cmd("Neotree reveal")
      end
    end, { silent = true })
  end
}
