local status, bufferline = pcall(require, 'bufferline')
if status then
    bufferline.setup({
    options = {
        separator_style = 'slant'
    }
})
end
