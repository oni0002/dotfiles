-- Bubbly {{{
-- vim.g.bubbly_characters = { left = '▐', right = '▌' }
-- vim.g.bubbly_characters = { left = '█', right = '█' }
vim.g.bubbly_statusline = {
    'mode',
    'truncate',
    'path',
    'branch',
    'coc',
    'divisor',
    'filetype',
    'progress'}
vim.g.bubbly_palette = {
    background = "#000000",
    foreground = "#999999",
    black = "#000000",
    red = "#997a7a",
    green = "#85997a",
    yellow = "#99997a",
    blue = "#7a8599",
    purple = "#997a99",
    cyan = "#7a9999",
    white = "#cccccc",
    lightgrey = "#4d4d4d",
    darkgrey = "#1a1a1a",
}
vim.g.bubbly_colors = {
    path = {
        readonly = { background = 'white', foreground = 'black' },
        unmodifiable = { background = 'white', foreground = 'black' },
        path = { background = 'white', foreground = 'black' },
        modified = { background = 'white', foreground = 'black' },
    },
    branch = { background = 'background', foreground = 'foreground' },
    filetype = { background = 'background', foreground = 'foreground' },
    progress = { 
        rowandcol = { background = 'black', foreground = 'foreground' },
        percentage = { background = 'black', foreground = 'foreground' },
    },
    tabline = {
    active = { background = 'white', foreground = 'black' },
    inactive = { background = 'background', foreground = 'foreground' }
    }
}
vim.g.bubbly_inactive_color = {
    background = 'background',
    foreground = 'foreground'
}
vim.g.bubbly_styles = {
    path = {
        path = 'bold'
    },
    tabline = {
        inactive = 'bold'
    }
}
-- }}}

-- Express_line {{{
--[[ local bui = require('el.builtin')
local ext = require('el.extensions')
local sec = require('el.sections')
local sub = require('el.subscribe')
local hi = sec.highlight
local col = sec.collapse_builtin
local space = " "
local mode = ext.gen_mode({format_string = " [%s] "})
local file = bui.shortened_file
local ft = space .. bui.filetype_list .. space
local ro = col{space, bui.readonly_list}
local mod = col{space, bui.modified}
-- local lines = space .. bui.line_with_width(3) .. ":" .. bui.column_with_width(3) .. space
local lines = space .. bui.line .. ":" .. bui.column .. space
local split = sec.split
local gbranch = sub.buf_autocmd('el_git_branch', 'BufEnter', function (win, buf)
    local branch = ext.git_branch(win, buf)
    if branch then
        return space .. "".. space .. branch .. space
    end
end)
local coc_count = function(_, buf, severity)
    local ok, res = pcall(vim.api.nvim_buf_get_var, buf.bufnr, 'coc_diagnostic_info') -- {'information': 0, 'hint': 0, 'lnums': [29, 13, 0, 0], 'warning': 15, 'error': 2}
    if ok then
        local count = res[severity]
        if count > 0 then
            return string.format("%s%s", severity:sub(1,1):upper(), count)
        end
        return ""
    end
end
local coc_diag = function(win, buf)
    local diags = {
        coc_count(win, buf, "warning"),
        coc_count(win, buf, "error"),
    }
    return space .. table.concat(diags, " ") .. space
end
local coc_status = vim.g.coc_status

require('el').setup {
    generator = function(_, _)
        return {
            mode,
            gbranch,
            coc_diag,
            coc_status,
            split,
            file,
            ro,
            mod,
            split,
            ft,
            lines,
        }
    end
} ]]
-- }}}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
