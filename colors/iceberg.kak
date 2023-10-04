
evaluate-commands %sh{
    foreground="rgb:c5cbd6" # gui05
    background="rgb:161821" # gui00
    selection="rgb:272c42"  # gui02
    window="rgb:272c42"     # gui01
    comment="rgb:6b7089"    # gui03
	keyword="rgb:7c96ba"
    red="rgb:cc6666"        # gui08
    orange="rgb:de935f"     # gui09
    yellow="rgb:f0c674"     # gui0A
    green="rgb:b5bd68"      # gui0B
    blue="rgb:81a2be"       # gui0D
    aqua="rgb:8abeb7"       # gui0C
    purple="rgb:b294bb"     # gui0E
    ## code
    echo "
        face global value rgb:a093c7
        face global type ${keyword}
        face global variable ${red}
        face global module ${blue}
        face global function ${blue}
        face global string rgb:89b8c2
        face global keyword ${keyword} 
        face global operator ${aqua}
        face global attribute ${keyword}
        face global comment ${comment}
        face global documentation comment
        face global meta ${keyword}
        face global builtin ${yellow}
    "
    ## markup
    echo "
        face global title ${blue}
        face global header ${aqua}
        face global mono ${green}
        face global block ${orange}
        face global link ${blue}
        face global bullet ${red}
        face global list ${red}
    "
    ## builtin
    echo "
        face global Default ${foreground},${background}
        face global PrimarySelection ${foreground},${selection}+fg
        face global SecondarySelection ${foreground},${window}+fg
        face global PrimaryCursor ${background},${foreground}+fg
        face global SecondaryCursor ${background},${aqua}+fg
        face global PrimaryCursorEol ${background},${green}+fg
        face global SecondaryCursorEol ${background},${green}+fg
        face global LineNumbers ${comment},${window}
        face global LineNumberCursor ${yellow},${window}+b
        face global MenuForeground ${window},${foreground}
        face global MenuBackground ${foreground},${window}
        face global MenuInfo ${red}
        face global Information ${foreground},${window}
        face global Error ${foreground},${red}
        face global StatusLine ${foreground},${selection}
        face global StatusLineMode ${yellow}+b
        face global StatusLineInfo ${aqua}
        face global StatusLineValue ${green}
        face global StatusCursor ${window},${aqua}
        face global Prompt ${background},${aqua}
        face global MatchingChar ${yellow},${background}+b
        face global BufferPadding ${aqua},${background}
        face global Whitespace ${comment}+f
    "
}
