# Cookiecutter Project
A project template to get started quickly with a solid framework.

## Features
* Bash:
	+ Static analysis using [shellcheck](https://github.com/koalaman/shellcheck)
	+ Specifications writing and unit-testing using [shellspec](https://github.com/shellspec/shellspec)
* Python:
  + Project and package management using [uv](https://github.com/astral-sh/uv)
	+ Static analysis using [ruff](https://github.com/astral-sh/ruff)
	+ Unit-testing using [pytest](https://github.com/pytest-dev/pytest)
	+ Type checking using [mypy](https://github.com/python/mypy)

## Usage
1. Generate a new project: `cookiecutter https://github.com/Da-Buche/cookiecutter-project`.
2. Answer the questions.
3. Install dependencies: `cd <new_project_name>` and `make install`.
4. Verify setup: `make test` or `make test_all`.
5. Start developping and add tests as needed.

## Credits
Based on the awesome [Cookiecutter](https://github.com/cookiecutter/cookiecutter) tool.
