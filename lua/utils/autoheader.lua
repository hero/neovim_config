vim.cmd([[
autocmd BufNewFile *.sh,*.py lua SetTitle()
]])

function SetTitle()
    if vim.fn.expand('%:e') == 'sh' then
        vim.fn.setline(1, '#!/bin/bash')
        vim.fn.setline(2, '#')
        vim.fn.setline(3, '#**************************************************')
        vim.fn.setline(4, '# Author:         WUKING                          *')
        vim.fn.setline(5, '# E-mail:         wuying283@hotmail.com           *')
        vim.fn.setline(6, '# Date:           ' .. os.date('%Y-%m-%d') .. '                      *')
        vim.fn.setline(7, '# Description:                                    *')
        vim.fn.setline(8, '# Copyright ' .. os.date('%Y') .. ' by WUKING.All Rights Reserved    *')
        vim.fn.setline(9, '#**************************************************')
        vim.fn.setline(10, '')
        vim.fn.setline(11, '')
    end
    if vim.fn.expand('%:e') == 'py' then
        -- vim.fn.setline(1, "\#!/usr/bin/env python")
        -- vim.fn.append(1, "\# encoding: utf-8")
        vim.fn.setline(1, '# -*- coding: utf-8 -*-')
        vim.cmd('normal! Goo')
    end
end
vim.cmd([[
autocmd BufNewFile * normal G
]])
