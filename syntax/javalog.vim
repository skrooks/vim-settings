" Vim syntax file
" Language: Java Stacktrace
" Maintainer: Adam Turner
" Latest Revision: 2021.12.22
" TODO: This could probably be done better.

if exists("b:current_syntax")
  finish
endif

" syn keyword	stSimple	at in line
syn match	stMethodCall	'[^(]*' nextgroup=stStartFileLocation contained
syn match	stStartFileLocation	'(' nextgroup=stFileName contained
syn match	stFileName '[^:]*' nextgroup=stFilePosition contained
syn match	stFilePostion ':' nextgroup=stLineNumber contained
syn match	stLineNumber	'\d*' nextgroup=stEndFileLocation contained
syn match	stEndFileLocation ')' contained
syn match	stAtStart	'\s*at[\%ua0 ]' nextgroup=stMethodCall contained
syn match	stAtLine	'^\s*at[\%ua0 ].*$' contains=stAtStart,stMethodCall,stStartFileLocation,stFileName,stFilePostion,stLineNumber,stEndFileLocation
syn match	stTimestamp	'\d\{4}-\d\{2}-\d\{2}\%ua0\d\{2}:\d\{2}:\d\{2},\d\{3}'
syn keyword	stLogLevel	TRACE DEBUG INFO WARN ERROR
syn match	stException	'[^\ua0]*Exception'

syn match stOpenTrace 'START:\d\+\%ua0\[[^\]]*\]\%ua0\[[^\]]*\]'

let b:current_syntax = "javalog"

hi def link stAtStart      Comment
hi def link stMethodCall   Function
hi def link stFileName     Identifier
hi def link stLineNumber   Number
hi def link stTimestamp    Comment
hi def link stLogLevel     Label
hi def link stException    Exception
hi def link stAtLine       Number
hi def link stOpenTrace    String
