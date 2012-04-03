" Vim color file
" Name: liuer.vim
" Author: liuerfire wang <liuerfire@gmail.com>
"
hi clear

set background=dark

if exists("syntax_on")
    syntax reset
end

let g:colors_name="liuer"

hi Cursor       guifg=NONE      guibg=#0d0d0d
hi Normal       guifg=#ffebcd  guibg=#242424
hi NonText      guifg=#e22fd7   guibg=#242424
hi LineNr       guifg=#f1de88   guibg=#000000
hi StatusLine   guifg=#4f4ce8   guibg=#d8f6f8
hi StatusLineNC guifg=#9fe3ef   guibg=#d8f6f8
hi VertSplit    guifg=#ff0000   guibg=#ff0000
hi Folded       guifg=#384048   guibg=#1f252c
hi Title        guifg=#7a0bf8   guibg=#af71f4
hi Visual       guifg=#e0f471   guibg=#edf8af
hi SpecialKey   guifg=#afc9f8   guibg=#798fb8

hi Comment      guifg=#99968b   gui=italic
hi Todo         guifg=#940404   gui=italic
hi Constant     guifg=#189404 
hi String       guifg=#946004   gui=italic
hi Identifier   guifg=#d49528
hi Function     guifg=#d4286d
hi Type         guifg=#2828d4
hi Statement    guifg=#2cd428
hi Keyword      guifg=#2875d4
hi PreProc      guifg=#65d428
hi Number       guifg=#f4fdef
hi Special      guifg=#333830


if &t_Co > 255
    hi Cursor       guifg=NONE      guibg=#0d0d0d
    hi Normal       guifg=#0000ff   guibg=#242424
    hi NonText      guifg=#e22fd7   guibg=#242424
    hi LineNr       guifg=#f1de88   guibg=#000000
    hi StatusLine   guifg=#4f4ce8   guibg=#d8f6f8
    hi StatusLineNC guifg=#9fe3ef   guibg=#d8f6f8
    hi VertSplit    guifg=#ff0000   guibg=#ff0000
    hi Folded       guifg=#384048   guibg=#1f252c
    hi Title        guifg=#7a0bf8   guibg=#af71f4
    hi Visual       guifg=#e0f471   guibg=#edf8af
    hi SpecialKey   guifg=#afc9f8   guibg=#798fb8

    hi Comment      guifg=#99968b   gui=italic
    hi Todo         guifg=#940404   gui=italic
    hi Constant     guifg=#189404 
    hi String       guifg=#946004   gui=italic
    hi Identifier   guifg=#d49528
    hi Function     guifg=#d4286d
    hi Type         guifg=#2828d4
    hi Statement    guifg=#2cd428
    hi Keyword      guifg=#2875d4
    hi PreProc      guifg=#65d428
    hi Number       guifg=#f4fdef
    hi Special      guifg=#333830
end
