##General settings

set global scrolloff 30,30
set global tabstop 4
set global indentwidth 4
hook global BufOpenFile .* noexpandtab
hook global BufNewFile .* noexpandtab
eval %sh{ kak-tree-sitter -dkms --session $kak_session }
