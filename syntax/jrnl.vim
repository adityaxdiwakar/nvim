setlocal syntax=markdown
setlocal textwidth=80
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

syntax match JrnlTagInBoxDone "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxImportant "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxActive "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxEmpty "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxSkipped "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxQuestion "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxInfo "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxStar "\ @\w\+\(-\w\+\)*"
syntax match JrnlTag "\ @\w\+\(-\w\+\)*"

syntax match jseasoneptitle /s\d\de\d\d/ contains=@NoSpell contained display
syntax match jseasonepbody /s\d\de\d\d/ contains=@NoSpell display
syntax match jNumByNum /\v<\d+x\d+>/ contains=@NoSpell display
syntax match jbracket /\v[\[\]]/ contained conceal display
syntax match JrnlDate /\v\[\d{4}(-\d\d){2} \d\d(:\d\d){1,2}( [aApP][mM])?\] / contained conceal display
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match jLeadingWhiteSpace /\v^.{-}\] +/ contained

syntax region JrnlBoxEmpty start=/^\v\s*\[ \]\s+/ end=/$/ contains=JrnlTagInBoxEmpty
syntax region JrnlBoxActive start=/^\v\s*\[\.\]\s+/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxActive
syntax region JrnlBoxQuestion start=/^\v\s*\[\?\]\s+/ end=/$/ contains=JrnlTagInBoxQuestion
syntax region JrnlBoxSkipped start=/^\v\s*\[\-\]\s+/ end=/$/ contains=JrnlTagInBoxSkipped
syntax region JrnlBoxInfo start=/^\v\s*\[i\]\s+/ end=/$/ contains=JrnlTagInBoxInfo
syntax region JrnlBoxImportant start=/\v^\s*\[!\]\s+/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxImportant
syntax region JrnlBoxStar start=/\v^\s*\[\*\]/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxStar
syntax region JrnlBoxDone start=/^\v\z(\s+)*\[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/ contains=JrnlTagInBoxDone
syntax region JrnlSpoilers matchgroup=jspoilers start=/||/ end=/||/ concealends contains=@Spell,jseasonepbody

highlight JrnlEntryLine guifg=#66C9FF guibg=none gui=bold,underline
highlight JrnlDate guifg=#545454 guibg=none
highlight JrnlNope guifg=none guibg=none gui=none
highlight JrnlSpoilers guibg=#000000
highlight JrnlBoxActive guifg=#CBE697 gui=reverse
highlight JrnlBoxQuestion guifg=#B283AF
highlight JrnlBoxInfo guifg=#8dc07c
highlight JrnlBoxSkipped guifg=#FB4A34
highlight JrnlBoxDone gui=strikethrough guifg=#665c54
highlight JrnlBoxStar guifg=#EEC476 gui=bold,reverse
highlight JrnlBoxImportant guifg=#EA9073 gui=bold,reverse

highlight JrnlTagInBoxDone gui=bold,strikethrough guifg=#665c54
highlight JrnlTagInBoxActive gui=bold,reverse guifg=#CBE697
highlight JrnlTagInBoxQuestion gui=bold guifg=#B283AF
highlight JrnlTagInBoxSkipped gui=bold guifg=#FB4A34
highlight JrnlTagInBoxInfo gui=bold guifg=#8dc07c
highlight JrnlTagInBoxImportant gui=bold,reverse guifg=#EA9073
highlight JrnlTagInBoxStar guifg=#EEC476 gui=bold,reverse
highlight JrnlTagInBoxEmpty gui=bold guifg=#FBBD2E
highlight JrnlTag gui=bold guifg=#FBBD2E

highlight def link jlbracket JrnlDate
highlight def link jseasoneptitle JrnlEntryLine
highlight def link jspoilers JrnlSpoilers

" Nopes
highlight def link jseasonepbody JrnlNope
highlight def link jLeadingWhiteSpace JrnlNope
