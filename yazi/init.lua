require("full-border"):setup()

require("smart-enter"):setup {
  open_multi = true,
}

require("git"):setup {
	-- Order of status signs showing in the linemode
	order = 1500,
}

-- ~/.config/yazi/init.lua
th.git = th.git or {}
th.git.unknown_sign = " "
th.git.modified_sign = "M"
th.git.deleted_sign = "D"
th.git.clean_sign = "✔"
