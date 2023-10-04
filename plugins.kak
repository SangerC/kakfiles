###Install and configure plugins

source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload

plug 'delapouite/kakoune-buffers'

plug "andreyorst/smarttab.kak" defer smarttab %{
    # when `backspace' is pressed, 4 spaces are deleted at once
    set-option global softtabstop 4
} config %{
    # these languages will use `expandtab' behavior
    #hook global WinSetOption filetype=(rust|markdown|kak|lisp|scheme|sh|perl) expandtab
    # these languages will use `noexpandtab' behavior
    #hook global WinSetOption filetype=(makefile|gas) noexpandtab
    # these languages will use `smarttab' behavior
    #hook global WinSetOption filetype=(c|cpp) smarttab
}

plug "kak-lsp/kak-lsp" do %{
        cargo install --locked --force --path .
}config %{

    # uncomment to enable debugging
    # eval %sh{echo ${kak_opt_lsp_cmd} >> /tmp/kak-lsp.log}
    # set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"

    # this is not necessary; the `lsp-enable-window` will take care of it
    # eval %sh{${kak_opt_lsp_cmd} --kakoune -s $kak_session}

    set global lsp_diagnostic_line_error_sign '║'
    set global lsp_diagnostic_line_warning_sign '┊'

    define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
    define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
    define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

    define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
    hook global WinSetOption filetype=(c|cpp|cc|rust|javascript|typescript) %{
        set-option window lsp_auto_highlight_references true
        set-option window lsp_hover_anchor false
        lsp-auto-hover-enable
        echo -debug "Enabling LSP for filtetype %opt{filetype}"
        lsp-enable-window
    }

    hook global WinSetOption filetype=(rust) %{
        set window lsp_server_configuration rust.clippy_preference="on"
    }

    hook global WinSetOption filetype=rust %{
        hook window BufWritePre .* %{
            evaluate-commands %sh{
                test -f rustfmt.toml && printf lsp-formatting-sync
            }
        }
    }

    hook global KakEnd .* lsp-exit
}


plug "andreyorst/fzf.kak"


plug "lePerdu/kakboard" %{
        hook global WinCreate .* %{ kakboard-enable }
}



plug "andreyorst/kaktree" defer kaktree %{
    set-option global kaktree_double_click_duration '0.5'
    set-option global kaktree_indentation 1
    set-option global kaktree_dir_icon_open  '▾ 🗁 '
    set-option global kaktree_dir_icon_close '▸ 🗀 '
    set-option global kaktree_file_icon      '⠀⠀🖺'
}config %{
        hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
        }
	kaktree-enable
}





plug "andreyorst/powerline.kak" defer powerline_tomorrow_night %{
	powerline-theme tomorrow-night
} defer powerline-separator %{
	powerline-separator global triangle-inverted
} config %{
    powerline-start
} 
