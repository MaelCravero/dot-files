" Iron

map cr ctr
luafile $HOME/.config/nvim/iron.lua
"
"lua << EOF
"local iron = require("iron")
"
"iron.core.set_config{
"  preferred = {
"    python = 'python3'
"  },
"  repl_open_cmd = open_repl
"}
"
"EOF
"
