return {
  "3rd/image.nvim",
  dependencies = { "luarocks.nvim" },
  config = function()
    local image = require("image")

    image.setup({
      backend = "ueberzug",
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
    })

    local zoom_factor = 1.0
    local orig_cols = nil
    local orig_rows = nil

    local function manual_zoom(multiplier)
      local bufnr = vim.api.nvim_get_current_buf()
      local current_images = image.get_images({ buffer = bufnr })

      if #current_images > 0 then
        local img = current_images[1]

        if not orig_cols or not orig_rows then
          orig_cols = img.geometry.width or 40
          orig_rows = img.geometry.height or 20
        end

        zoom_factor = zoom_factor * multiplier
        if zoom_factor < 0.1 then zoom_factor = 0.1 end
        if zoom_factor > 4.0 then zoom_factor = 4.0 end

        local new_width = math.max(2, math.floor(orig_cols * zoom_factor))
        local new_height = math.max(1, math.floor(orig_rows * zoom_factor))

        img.geometry.width = new_width
        img.geometry.height = new_height

        img:move(img.geometry.x or 0, img.geometry.y or 0, new_width, new_height)
        img:render()

        vim.api.nvim_echo({{ string.format("Scale: %.2fx", zoom_factor), "Normal" }}, false, {})
      end
    end

    vim.keymap.set("n", "zi", function() manual_zoom(1.2) end, { silent = true, desc = "Zoom In Image" })
    vim.keymap.set("n", "zo", function() manual_zoom(0.8) end, { silent = true, desc = "Zoom Out Image" })
  end
}
