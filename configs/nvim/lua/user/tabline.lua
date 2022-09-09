function _G.nvim_tabline()
    local s = ''
    for index = 1, vim.fn.tabpagenr('$') do
        local win_nr = vim.fn.tabpagewinnr(index)
        local buf_list = vim.fn.tabpagebuflist(index)
        local buf_nr = buf_list[win_nr]
        local buf_name = vim.fn.bufname(buf_nr)
        local active = index == vim.fn.tabpagenr()

        -- highlight current tab
        if active then
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end

        -- index
        s = s .. index .. ':'

        -- start of tab page N label
        s = s .. '[%' .. index .. 'T'
        -- buf name with modified indicator
        if buf_name ~= '' then
            s = s .. vim.fn.fnamemodify(buf_name, ':t') .. '%M'
        else
            s = s .. 'No Name%M'
        end
        -- end of tab page N label
        s = s ..']%T'

        -- start and end of close button
        if active then
            s = s .. '[%' .. '999' .. 'Xx%X]'
        else
            s = s .. '[%' .. index .. 'Xx%X]'
        end

        -- separator
        s = s .. '  '
    end

    s = s .. '%#TabLineFill#'
    return s
end

vim.opt.showtabline = 1
vim.opt.tabline = '%!v:lua.nvim_tabline()'
