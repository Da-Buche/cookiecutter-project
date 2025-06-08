#!/bin/bash
## ===============================================================================================================
## Project specifications.
##
## A. Buchet - June 2025
## ===============================================================================================================

Describe '{{ cookiecutter.project_slug }}'


It 'prints hello world'
When run ./python/src/{{ cookiecutter.project_slug }}/{{ cookiecutter.project_slug }}.py
The stdout should equal "Project {{ cookiecutter.project_slug }} says 'Hello World!'"
End


It 'prints version'
When run ./python/src/{{ cookiecutter.project_slug }}/{{ cookiecutter.project_slug }}.py --version
The stdout should match pattern "{{ cookiecutter.project_slug }} version: [0-9]*.[0-9]*.[0-9]*"
End


End

