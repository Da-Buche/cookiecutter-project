#!/bin/bash
## ===============================================================================================================
## Usual tests on python code.
##
## A. Buchet - June 2025
## ===============================================================================================================

Describe 'python'


It 'passes lint checks [ruff]'
When run uv run ruff check ./python
The stdout should equal 'All checks passed!'
The status should be success
End

It 'passes type-checking [mypy]'
When run uv run mypy ./python
The stdout should be present
The status should be success
End

It 'passes unit-tests [pytest]'
When run env PYTHONPATH="./python/src:$PYTHONPATH" uv run pytest -q ./python
The stdout should be present
The stdout should not include fail
The status should be success
End


End

