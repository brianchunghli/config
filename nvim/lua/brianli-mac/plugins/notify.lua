if not vim.g.vscode then
    return {
        'rcarriga/nvim-notify',
        config = function()
            local status, notify = pcall(require, 'notify')
            if status then
                local config = {
                    max_width = 50,
                    max_height = 100,
                    timeout = 1000,

                }
                notify.setup(config)
            end
        end
    }
end
