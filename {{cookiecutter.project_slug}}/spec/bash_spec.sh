#!/bin/bash
Describe 'bash'

It "requires \`fd\`"
When run fd --version
The stdout should be present
The stderr should be blank
The status should be success
End

It "requires \`shellcheck\`"
When run shellcheck --version
The stdout should be present
The stderr should be blank
The status should be success
End

## Requirements
missing_shellcheck() { ! shellcheck --version >/dev/null 2>&1; }
missing_fd()         { ! fd         --version >/dev/null 2>&1; }

list_bash_files() {
  ## List all shell files in repo
  fd . --hidden --no-require-git --type f --exclude '*.py' --exec bash -c 'file -b "{}" | grep -q "Bourne-Again shell" && echo {}' \;
}

export -f list_bash_files

It "passes \`shellcheck\`"
Skip if "fd not available"         missing_fd
Skip if "shellcheck not available" missing_shellcheck
When run bash -c "list_bash_files | xargs shellcheck --format=gcc"
The stdout should be blank
The stderr should be blank
The status should be success
End


End

