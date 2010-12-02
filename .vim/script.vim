


map <Leader>ca :call MakeSnippet()<CR>
imap <Leader>ca <ESC> :call MakeSnippet()<CR>

function! MakeSnippet()
	if empty(&ft)
			echo "No filetype defined for snippet"
	else
		let name = input('Enter the snippet abbreviation: ')
		let file_type = &ft
		let snippet_path = g:snippets_dir . file_type . '/' . name . '.snippet'
		exec "edit" snippet_path
	end
endfunction
