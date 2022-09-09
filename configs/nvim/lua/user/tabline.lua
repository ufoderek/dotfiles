function _G.nvim_tabline()
    local s = ''
    for index = 1, vim.fn.tabpagenr('$') do
        local win_nr = vim.fn.tabpagewinnr(index)
        local buf_list = vim.fn.tabpagebuflist(index)
        local buf_nr = buf_list[win_nr]
        local buf_name = vim.fn.bufname(buf_nr)
        local active = index == vim.fn.tabpagenr()
        local modified = vim.fn.getbufvar(buf_nr, '&mod')

        s = s .. '%' .. index .. 'T'
        if active then
            s = s .. '%#TabLineSel#' --high light color of current tab
        else
            s = s .. '%#TabLine#'
        end
        -- index
        s = s .. index .. ':'
        -- buf name
        if buf_name ~= '' then
            s = s .. '[' .. vim.fn.fnamemodify(buf_name, ':t') .. ']'
        else
            s = s .. '[No Name]'
        end
        -- modify indicator
        if modified == 1 then
            s = s .. '+'
        end
        -- separator
        s = s .. '  '
    end

    s = s .. '%#TabLineFill#'
    return s
end

vim.opt.showtabline = 1
vim.opt.tabline = '%!v:lua.nvim_tabline()'
