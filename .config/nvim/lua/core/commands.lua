vim.api.nvim_create_user_command('Glow', 'vert term glow %', {})

vim.api.nvim_create_user_command('ToggleColorscheme', function()
    if vim.opt.termguicolors:get() then
        vim.opt.termguicolors = false
        pcall(vim.cmd.colorscheme, "default")
    else
        vim.opt.termguicolors = true

        local colors = require('core.colors')
        require('monokai').setup({
            palette = colors.palette,
            custom_hlgroups = colors.hlgroups,
            italics = false,
        })
    end
end, {})
