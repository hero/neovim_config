local o = vim.o
local fn = vim.fn
local cmd = vim.cmd
--[[
Deletes all trailing whitespaces in a file if it's not binary nor a diff.
]]
--
function _G.trim_trailing_whitespaces()
    if not o.binary and o.filetype ~= 'diff' then
        local current_view = fn.winsaveview()
        cmd([[keeppatterns %s/\s\+$//e]])
        fn.winrestview(current_view)
    end
end

-- Hard mode toggle
HardMode = false
function ToggleHardMode()
    local modes = { 'n' }
    local movement_keys = { 'h', 'l' }
    if HardMode then
        for _, mode in pairs(modes) do
            for _, m_key in pairs(movement_keys) do
                vim.api.nvim_del_keymap(mode, m_key)
            end
        end
        vim.notify('Hard mode OFF')
    else
        vim.notify('Hard mode ON')
    end
    HardMode = not HardMode
end

ToggleHardMode()
vim.api.nvim_set_keymap(
    'n',
    '<leader>th',
    ':lua ToggleHardMode()<CR>',
    { noremap = true, silent = true }
)
