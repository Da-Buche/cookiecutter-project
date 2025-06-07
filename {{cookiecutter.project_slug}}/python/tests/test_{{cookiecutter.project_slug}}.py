#!/usr/bin/env python

from {{ cookiecutter.project_slug }}.{{ cookiecutter.project_slug }} import main

def test_main(capfd):
  """Test `main` function."""
  main()
  out, err = capfd.readouterr()
  assert out == "Project {{ cookiecutter.project_slug }} says 'Hello World!'\n"

