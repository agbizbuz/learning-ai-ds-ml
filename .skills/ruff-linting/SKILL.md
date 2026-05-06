---
name: ruff-linting
description: >
  Configure, run, and fix ruff linting in Python files and Jupyter notebooks.
  Enforces consistent code quality across this ML repository.
---

# Ruff Linting for ML/DS Notebooks and Code

## Quick Reference

```bash
# Lint all Python files
ruff check .

# Lint with auto-fix
ruff check --fix .

# Format code
ruff format .

# Show rules applied
ruff rule ALL

# Check specific file
ruff check path/to/file.py

# Selective rule checking
ruff check --select=E,F,I,W --ignore=E501 .
```

## pyproject.toml Configuration

The repository should have this in `pyproject.toml`:

```toml
[tool.ruff]
# ML notebooks are educational - allow longer lines for readability
line-length = 100
target-version = "py310"
src = ["simplilearn_ml_python", "Course_Work"]

# Exclude common non-source paths
exclude = [
    ".git",
    ".venv",
    "__pycache__",
    "build",
    "dist",
    "*.egg-info",
    "notebook_checkpoints",
]

[tool.ruff.lint]
# Core rules that improve code quality
select = [
    "E",     # pycodestyle errors
    "W",     # pycodestyle warnings
    "F",     # pyflakes
    "I",     # isort
    "C90",   # mccabe complexity
    "N",     # pep8-naming
    "UP",    # pyupgrade
    "B",     # flake8-bugbear
    "SIM",   # simplify
    "RUF",   # ruff-specific
]

# Relax some rules for educational/ML code
ignore = [
    "E501",     # line length (notebooks)
    "F401",     # unused imports (common in exploratory work)
    "F841",     # unused variables (common ML)
    "C901",     # too complex (ML pipelines can be complex)
    "E731",     # lambda expressions (common in ML)
    "N803",     # argument not lowercase (X_train, etc)
    "N806",     # non-lowercase variable in function (ML convention)
]

[tool.ruff.lint.pydocstyle]
convention = "google"

[tool.ruff.lint.per-file-ignores]
# Notebooks are more exploratory - relax rules further
"**/*.ipynb" = ["F401", "E402", "E703", "F811"]
"**/__init__.py" = ["F401"]

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
docstring-code-format = true
```

## Common Ruff Commands for This Repo

| Command                             | Purpose                       |
| ----------------------------------- | ----------------------------- |
| `ruff check simplilearn_ml_python/` | Lint ML algorithm notebooks   |
| `ruff check Course_Work/`           | Lint advanced topic notebooks |
| `ruff format --check .`             | Check if code is formatted    |
| `ruff check --select=I .`           | Just check import ordering    |
| `ruff check --no-fix .`             | Show issues without fixing    |
| `ruff check --diff .`               | Show what fixes would change  |
| `ruff linter`                       | List all available rules      |

## Pre-commit Integration (Optional)

If using pre-commit hooks:

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.4.0
    hooks:
      - id: ruff
        args: [--fix, --exit-non-zero-on-fix]
      - id: ruff-format
```

## Notebook-Specific Ruff Behavior

Ruff handles `.ipynb` files natively. Important notes:

1. **Cell outputs are ignored** - ruff only checks code cells
2. **Magic commands are handled** - `%matplotlib`, `!pip`, etc. are fine
3. **Inline comments matter** - `# %load` markers work correctly

### Fixing Common Notebook Linting Issues:

```python
# BAD - multiple statements on one line (WPS303-ish)
import numpy as np; import pandas as pd

# GOOD - one import per line
import numpy as np
import pandas as pd
```

## Workflow Integration

### Recommended CI/CD step:

```yaml
- name: Lint with ruff
  run: |
    uv pip install ruff
    ruff check . --output-format=github  # GitHub annotations
    ruff format --check .
```

### Local development loop:

```bash
# After making changes
ruff check --fix .   # Fix auto-fixable issues
ruff format .        # Format everything
ruff check .         # Verify remaining issues
```

## Key Rules Explanation for ML Code

| Rule     | What it catches                         | ML-specific concern                          |
| -------- | --------------------------------------- | -------------------------------------------- |
| `E501`   | Line too long                           | Ignored - ML notebooks often have long lines |
| `F401`   | Unused imports                          | Common in exploratory work, ignored          |
| `I001`   | Import order wrong                      | Fixed - keeps imports organized              |
| `UP031`  | `datetime.datetime` → `datetime`        | Modern Python                                |
| `B007`   | Loop variable not used                  | Catch silent bugs                            |
| `SIM910` | `dict.get(key) is not None` → `in dict` | Cleaner code                                 |

## Tips for Teaching Code

1. **Keep educational code as-is** - if a code cell demonstrates a concept, don't over-optimize readability at the expense of pedagogy
2. **Add comments before fixing** - if ruff wants to simplify something that's intentionally verbose for teaching, add a `# noqa: SIM` comment with explanation
3. **Format consistently** - use `ruff format` to standardize style across all notebooks
4. **Check before committing** - run `ruff check .` as part of commit workflow
