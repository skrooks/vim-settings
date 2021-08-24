" Vim syntax file
" Language: Stacktrace
" Maintainer: Adam Turner
" Latest Revision: 2020.06.29
" TODO: This could probably be done better.

if exists("b:current_syntax")
  finish
endif

" syn keyword	stSimple	at in line
syn match	stMethodCall	'[^(]*([^)]*)' nextgroup=stInFile skipwhite contained
syn match	stFilePath	'[^:]*' nextgroup=stLineNumber contained
syn match	stLineNumber	'line \d*' contained
syn match	stAtMethod	'\s*at ' nextgroup=stMethodCall contained
syn match	stInFile	'in ' nextgroup=stFilePath contained
syn match	stAtLine	'^\s*at .*$' contains=stAtMethod,stMethodCall,stInFile,stFilePath,stLineNumber

let b:current_syntax = "stacktrace"

hi def link stAtMethod     Comment
hi def link stMethodCall   Type
hi def link stInFile       Comment
hi def link stFilePath     Identifier
hi def link stLineNumber   Constant
hi def link stAtLine       Comment
