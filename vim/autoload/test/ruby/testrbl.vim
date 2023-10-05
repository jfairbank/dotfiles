let g:test#ruby#testrbl#file_pattern = '\v(((^|/)test_.+)|_test)(spec)@<!\.rb$'

function! test#ruby#testrbl#test_file(file) abort
  return a:file =~# g:test#ruby#testrbl#file_pattern
endfunction

function! test#ruby#testrbl#build_position(type, position) abort
  if a:type ==# 'nearest'
    return [a:position['file'].':'.a:position['line']]
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

function! test#ruby#testrbl#build_args(args, color) abort
  let args = a:args

  if !a:color
    let args = ['--no-color'] + args
  endif

  return args
endfunction

function! test#ruby#testrbl#executable() abort
  return 'testrbl'
endfunction
