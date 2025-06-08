#!/usr/bin/env python
"""Main tests for {{ cookiecutter.project_slug }}."""

import logging

import pytest
from {{ cookiecutter.project_slug }}.{{ cookiecutter.project_slug }} import main


def test_hello(caplog : pytest.LogCaptureFixture) -> None:
  """Test `main` function."""
  caplog.set_level(logging.INFO)
  main()
  assert "Project {{ cookiecutter.project_slug }} says 'Hello World!'\n" in caplog.text

