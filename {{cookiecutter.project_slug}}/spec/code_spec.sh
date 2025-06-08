#!/bin/bash
#shellcheck disable=SC2046,SC2016
## ===============================================================================================================
## General code specifications.
##
## A. Buchet - June 2025
## ===============================================================================================================

Describe 'code'

## `fd` is required as it respects .gitignore patterns
It "requires \`fd\`"
When run fd --version
The stdout should be present
The stderr should be blank
The status should be success
End

missing_scc() { ! scc --version >/dev/null 2>&1; }
missing_fd()  { ! fd  --version >/dev/null 2>&1; }

list_files() {
  ## List all project source files
  fd . --hidden --no-require-git --type f "$@"
}

export -f list_files

It 'contains no "TODO"'
Skip if "fd not available" missing_fd
Pending "TODOs are not failures but they should be reminded."
When run grep -Ei 'TO-?DO' $(list_files --exclude='code_spec.sh')
The stdout should be blank
The stderr should be blank
The status should be failure
End

It 'contains no "DEBUG"'
Skip if "fd not available" missing_fd
When run grep -Ei '\bDEBUG\b' $(list_files --exclude='code_spec.sh')
The stdout should be blank
The stderr should be blank
The status should be failure
End

It 'does not contain whitespace'
Skip if "fd not available" missing_fd
When run grep -En '\s+$' $(list_files)
The stdout should be blank
The stderr should be blank
The status should be failure
End

It 'does not contain tabs'
Skip if "fd not available" missing_fd
When run grep -n $'\t' $(list_files --exclude=Makefile)
The stdout should be blank
The stderr should be blank
The status should be failure
End

It 'does not contain carriage returns'
Skip if "fd not available" missing_fd
When run grep -n $'\r' $(list_files)
The stdout should be blank
The stderr should be blank
The status should be failure
End

It 'does not contain big files (1000 lines maximum)'
Skip if "fd not available" missing_fd
When run bash -c "list_files --exec wc -l {} \; | awk '\$1 > 1000 {print \$2}'"
The stdout should be blank
The stderr should be blank
The status should be success
End

It 'contains 15-30% of comments'
Skip if "scc not available" missing_scc
comments_ratio() { scc | grep -E ^Total | awk '{ printf "%.2f\n", ($5 * 100 / ($5 + $6)) }'; }
When run env COMMENTS_RATIO=$(comments_ratio) bash -c 'echo "15.00 <= $COMMENTS_RATIO && $COMMENTS_RATIO <= 30.00" | bc -l'
The stdout should equal 1
The stderr should be blank
The status should be success
End


End

