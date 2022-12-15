local i = require('vue-utils/i')
local q = require"vim.treesitter.query"
local window = require"window"
local api = vim.api
local get_var = require('vue-utils/get-var')
local get_script = require('vue-utils/get-script')
local utils = require('vue-utils/utils')
local set_keymap = utils.set_keymap 
local pop_win
local var_map = nil
local script_data = {}

local set_content = function(bufwin, table)
    api.nvim_buf_set_lines(bufwin['buf'], 0, 0, false, table)
end


local get_pop_content = function(vueBuf) 
    script_data = get_script(vueBuf)
    local vars = get_var(script_data['script'])
    var_map = vars
    local result = {}
    for k,v in ipairs(vars) do
        table.insert(result, v['name'])
    end
    return result
end

local M = {}

M.pop = function()
    local vueBuf = api.nvim_win_get_buf(0)
    content = get_pop_content(vueBuf)
    local bufwin = window.create_pop()
    local buf = bufwin['buf']
    pop_win = bufwin['win']
    
    set_content(bufwin, content)
    
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    set_keymap(buf, 'q',  ':lua require"vue-utils/init".close()<cr>')
    set_keymap(buf, '<cr>', ':lua require"vue-utils/init".select()<cr>' )
end

M.select = function()
    local str = api.nvim_get_current_line()
    local loc = {}
    for key,value in ipairs(var_map) do
        if value['name'] == str then
            loc.row = value.row + script_data['loc']['start_row'] + 1
            loc.col = value.col + script_data['loc']['start_col']
        end
    end
    M.close()
    vim.api.nvim_win_set_cursor(0, { loc.row, loc.col  })
end


M.close = function()
    vim.api.nvim_win_close(pop_win, true)
end



return M
