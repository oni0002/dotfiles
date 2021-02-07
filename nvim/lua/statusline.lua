local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui'}

-- moonfly color
local colors = {
  bg = '#262626',
  fg = '#c6c6c6',
  yellow = '#e3c78a',
  cyan = '#79dac8',
  green = '#8cc85f',
  orange = '#de935f',
  magenta = '#d183e8',
  blue = '#80a0ff',
  red = '#ff5454',
}

local mode_alias = {
    n = 'NORMAL',
    i = 'INSERT',
    v ='VISUAL',
    [''] = 'VISUAL',
    V = 'VISUAL',
    c = 'COMMAND',
    R  = 'REPLACE',
    s  = 'SELECT',
    [''] = 'SELECT',
    S  = 'SELECT',
    t  = 'TERM',
    ['!']  = 'SHELL',
}

local mode_color = {
    n = colors.blue,
    i = colors.green,
    v=colors.magenta,
    [''] = colors.magenta,
    V=colors.magenta,
    c = colors.red,
    R = colors.red,
    s = colors.orange,
    [''] = colors.orange,
    S=colors.orange,
    t = colors.cyan,
    ['!']  = colors.cyan,
}


local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end

local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

CocStatus = get_diagnostic_info

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

-- left

--table.insert(gls.left, {
--  FirstElement = {
--    provider = function() return '[ ' end,
--    highlight = {colors.fg,colors.bg,'bold'}
--  },
--})

table.insert(gls.left, {
    ViMode = {
    provider = function()
        -- auto change color according the vim mode
        local vim_mode = vim.fn.mode()
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
        return mode_alias[vim_mode]..' '
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {'NONE',colors.bg,'bold'},
    },
})

table.insert(gls.left, {
  FileName = {
    provider = {'FileName'},
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
})

table.insert(gls.left, {
  GitIcon = {
    provider = function() return ' ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.yellow,colors.bg, 'bold'},
  }
})

table.insert(gls.left, {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.yellow,colors.bg,'bold'},
  }
})

table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '+',
    highlight = {colors.orange,colors.bg},
  }
})

table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '~',
    highlight = {colors.orange,colors.bg},
  }
})

table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '-',
    highlight = {colors.orange,colors.bg},
  }
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.red,colors.bg}
  }
})

table.insert(gls.left, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.yellow,colors.bg},
  }
})

table.insert(gls.left, {
    CocStatus = {
        provider = CocStatus,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        condition = checkwidth,
        highlight = {colors.green,colors.bg},
    }
})

table.insert(gls.left, {
    Space = {
        provider = function() return ' ' end,
        highlight = {'NONE', 'NONE'}
    }
})

-- right

table.insert(gls.right, {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
})

table.insert(gls.right, {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg},
  },
})

table.insert(gls.right, {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'},
  }
})

table.insert(gls.right, {
    FileSize = {
        provider = 'FileSize',
        separator = ' | ',
        separator_highlight = {colors.darkblue,colors.bg},
        condition = buffer_not_empty,
        highlight = {colors.fg,colors.bg,'bold'},
    }
})

-- short line

table.insert(gls.short_line_left, {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE','NONE'},
    highlight = {colors.fg,'NONE','bold'}
  }
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg,'NONE','bold'}
  }
})

table.insert(gls.short_line_right, {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,'NONE'}
  }
})

