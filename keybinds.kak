## User Modes
declare-user-mode main
declare-user-mode git
declare-user-mode gitdiff

## Keybinds

# Main
map global normal <space> ':enter-user-mode main<ret>'
map -docstring "Fuzzy Finder" global main f ':fzf-mode<ret>'
map -docstring "LSP" global main l ':enter-user-mode lsp<ret>'
map -docstring "Git" global main g ':enter-user-mode git<ret>'
map -docstring "New Client" global main n ':new<ret>'
map -docstring "Kill Buffer" global main k ':delete-buffer<ret>'
map -docstring "Scratch Buffer" global main s ':e -scratch<ret>'
map -docstring "Ranger" global main r ':terminal ranger<ret>'
map -docstring "Prompt" global main <space> ':'
map -docstring "Command" global main c '!'

# Git
map -docstring "Git Status" global git s ':git status<ret>'
map -docstring "Git Diff" global git d ':enter-user-mode gitdiff<ret>'
map -docstring "Git Diff All" global git D ':git diff<ret>'
map -docstring "Git Add" global git a ':git add '
map -docstring "Git Add All" global git A ':git add .'

# Git Diff
map -docstring "Diff All" global gitdiff a ':git diff<ret>'
map -docstring "Diff File" global gitdiff f ':git diff %val{buffile}<ret>'
map -docstring "Diff Selection" global gitdiff s '"/y:git diff %val{buffile}<ret>/'

# Normal
map global normal <c-s> ':write; echo saved<ret>'
map global normal <c-l> ':bn<ret>'
map global normal <c-h> ':bp<ret>'
map global normal <c-r> ':lsp-references<ret>'
map global normal <c-i> ':lsp-implementation<ret>'
map global normal <c-d> ':lsp-definition<ret>'
map global normal <c-b> ':info-buffers<ret>'

# Insert
map global insert <c-s> '<esc>:write; echo saved<ret>'
map global insert <c-e> <esc>
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
