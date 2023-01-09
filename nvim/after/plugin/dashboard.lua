local db = require("dashboard")
db.custom_header = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗     ",
    "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║     ",
    "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║     ",
    "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║     ",
    "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║     ",
    "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝     ",
    "",
    "",
    "",
}

db.custom_center = {
    {
        icon = " ",
        desc = "New File            ",
        action = "DashboardNewFile",
        shortcut = "New no-name file",
    },
    {
        icon = " ",
        desc = "Browse Files        ",
        action = "Telescope file_browser",
        shortcut = "<leader>ff",
    },
    {
        icon = "� ",
        desc = "Find File           ",
        action = "Telescope find_files",
        shortcut = "SPC f",
    },
    {
        icon = " ",
        desc = "Configure Neovim    ",
        action = "edit ~/.config/nvim/init.lua",
        shortcut = "luaConfg",
    },
    {
        icon = " ",
        desc = "Exit Neovim              ",
        action = "ZQ",
    },
}
