vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local comment_set = {
    ['/*'] = true, ['*/'] = true, ['//'] = true, ['#'] = true, ['""" """'] = true,
    ["''' '''"] = true, ['(*)'] = true, ['--'] = true, ['--[['] = true, [']]'] = true,
    ['--[='] = true, ['=-]'] = true, ['--[==['] = true, ['==]'] = true, ['--<'] = true,
    ['>'] = true, ['<!--'] = true, ['-->'] = true,
}

local variables_set = {
    ['global'] = true, ['nonlocal'] = true, ['int'] = true, ['byte'] = true, ['short'] = true,
    ['long'] = true, ['float'] = true, ['double'] = true, ['char'] = true, ['boolean'] = true,
    ['var'] = true, ['final'] = true, ['volatile'] = true, ['transient'] = true, ['let'] = true,
    ['const'] = true, ['mut'] = true, ['static'] = true, ['$'] = true, ['<-'] = true,
    ['auto'] = true, [':='] = true,
}

local function_names_set = {
    ['def'] = true, ['lambda'] = true, ['async'] = true, ['await'] = true, ['public'] = true,
    ['private'] = true, ['protected'] = true, ['static'] = true, ['abstract'] = true,
    ['synchronized'] = true, ['native'] = true, ['strictfp'] = true, ['func'] = true,
    ['function'] = true, ['fn'] = true, ['move'] = true, ['unsafe'] = true, ['void'] = true,
    ['auto'] = true, ['delegate'] = true, ['sync'] = true,
}

local class_names_set = {
    ['class'] = true, ['struct'] = true, ['interface'] = true, ['enum'] = true,
    ['newtype'] = true, ['module'] = true, ['object'] = true,
    ['trait'] = true, ['impl'] = true, ['extension'] = true, ['protocol'] = true, ['record'] = true,
    ['union'] = true, ['sealed'] = true, ['abstract'] = true, ['final'] = true, ['data'] = true,
    ['type'] = true, ['typename'] = true, ['typedef'] = true,
}


local function check_syntax(tokens, keywords)
    for _, token in ipairs(tokens) do
        if keywords[token[1]] then
            return true
        elseif comment_set[token[1]] then
            return false
        end
    end
    return false
end


local handler = function(virtText, lnum, endLnum, width, truncate, allText)
    local newVirtText = {}
    local suffix = (' 󰁂 %d lines'):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        -- add chunkText to suffix: 
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end

    local function_total = 0
    local variables_total = 0
    local class_total = 0

    -- iterate over all lines of the fold:
    for i = lnum + 1, endLnum do
        local line = allText.get_fold_virt_text(i)
        if check_syntax(line, function_names_set) then
            function_total = function_total + 1
        end
        if check_syntax(line, variables_set) then
            variables_total = variables_total + 1
        end
        if check_syntax(line, class_names_set) then
            class_total = class_total + 1
        end
    end

    if class_total > 0 then
        suffix = suffix .. (' | %d cls'):format(class_total)
    end

    if function_total > 0 then
        suffix = suffix .. (' | %d fn'):format(function_total)
    end

    if variables_total > 0 then
        suffix = suffix .. (' | %d var'):format(variables_total)
    end

    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
    fold_virt_text_handler = handler,
    open_fold_hl_timeout = 0,
    enable_get_fold_virt_text = true,
})

-- Configuración personalizada para UfoCursorFoldedLine
local diffAddColor = vim.fn.synIDattr(vim.fn.hlID("DiffAdd"), "bg")
vim.cmd("hi Folded guibg=" .. diffAddColor)



