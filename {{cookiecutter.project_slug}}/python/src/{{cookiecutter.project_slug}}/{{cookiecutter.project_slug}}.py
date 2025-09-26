#!/bin/bash
# Header to use the proper version when running this Python script directly
""":" Main definitions for {{ cookiecutter.project_slug }}.

$(dirname $0)/../../../.venv/bin/python $0 $@ ; exit $status ; ".
"""

from __future__ import annotations

import logging
import sys
from pathlib import Path
from typing import Annotated

import typer

## TODO - There is probably something

## =======================================================
## Command Line Interface
## =======================================================

## Custom CLI logger to print to stdout
cli = logging.getLogger("CLI")
cli.setLevel(logging.INFO)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)

formatter = logging.Formatter("%(message)s")
handler.setFormatter(formatter)

cli.addHandler(handler)


# ruff: noqa: FBT001, FBT002 - positional boolean argument is required by typer
def version_callback(value: bool = False) -> None:
  """Print project version and exit."""
  from __init__ import __version__  # type: ignore [import-not-found] # noqa: PLC0415
  script_name = Path(__file__).stem
  if value:
    cli.info(f"{script_name} version: {__version__}")
    raise typer.Exit


def main(
  _version: Annotated[
    bool | None,
    typer.Option("--version", callback=version_callback, is_eager=True),
  ] = None,
) -> None:
  """Run project main function (only when as a script)."""
  cli.info("Project {{ cookiecutter.project_slug }} says 'Hello World!'")
  handler.flush()


if __name__ == "__main__":
  typer.run(main)

