---
name: uv-environment-management
description: >
  Manage Python environments with uv — create virtual environments, install packages,
  manage dependencies, and configure pyproject.toml for this ML/DS educational repository.
  Always use uv instead of pip or conda for any Python package management tasks.
---

# uv Environment Management

## Core Principles

1. **Always use `uv`** — never raw `pip` or `conda` for package management
2. **Pin Python version** — use `.python-version` file (recommend `3.11` for best ML library compatibility)
3. **Use `uv pip`** for installing into existing venvs, **`uv add`** for managed project deps
4. **Leverage uv's speed** — it's significantly faster than pip for installs and resolution

## Setting Up the Environment

### Initialize if no pyproject.toml exists:

```bash
# Initialize a project with uv
uv init --name learning-ai-ds-ml --no-readme

# Or create pyproject.toml manually if preferred
uv project init
```

### Create and activate virtual environment:

```bash
# Create venv with specific Python version
uv venv --python 3.11

# Activate
source .venv/bin/activate    # Linux/macOS
# .venv\Scripts\activate     # Windows
```

### Install ML/DS core dependencies:

```bash
# Core data science stack
uv add numpy pandas matplotlib seaborn

# ML frameworks
uv add scikit-learn

# Deep learning (for LLM_Course notebooks)
uv add tensorflow

# Jupyter support
uv add jupyter jupyterlab ipykernel

# Additional useful packages
uv add scipy statsmodels xgboost lightgbm

# Plotting/visualization
uv add plotly

# NLP (for embeddings/NLP notebooks)
uv add nltk transformers datasets

# Dev tools
uv add --dev ruff pytest ipywidgets
```

### Sync dependencies:

```bash
uv sync
```

## pyproject.toml Configuration

When creating or updating `pyproject.toml`, structure it like:

```toml
[project]
name = "learning-ai-ds-ml"
version = "0.1.0"
description = "AI, Data Science & Machine Learning Learning Path"
requires-python = ">=3.10"
dependencies = [
    "numpy>=1.24",
    "pandas>=2.0",
    "matplotlib>=3.7",
    "seaborn>=0.12",
    "scikit-learn>=1.3",
    "jupyter>=1.0",
    "jupyterlab>=4.0",
    "tensorflow>=2.14",
    "scipy>=1.11",
    "plotly>=5.17",
    "nltk>=3.8",
    "transformers>=4.35",
]

[project.optional-dependencies]
dev = [
    "ruff>=0.1",
    "pytest>=7.0",
]
notebooks = [
    "ipywidgets>=8.0",
    "widgetsnbextension>=4.0",
]

[tool.ruff]
line-length = 100
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "W", "I", "N", "UP", "B"]
ignore = ["E501"]  # line length handled by formatter
```

## Common uv Commands Reference

| Task                | Command                        |
| ------------------- | ------------------------------ |
| Create venv         | `uv venv --python 3.11`        |
| Add package         | `uv add package-name`          |
| Add dev dep         | `uv add --dev package-name`    |
| Remove package      | `uv remove package-name`       |
| Sync all deps       | `uv sync`                      |
| Compile deps        | `uv compile`                   |
| List installed      | `uv pip list`                  |
| Show package info   | `uv pip show package-name`     |
| Update all          | `uv upgrade`                   |
| Update one          | `uv upgrade package-name`      |
| Pin Python          | `uv python pin 3.11`           |
| Export requirements | `uv export > requirements.txt` |

## Managing Multiple Python Versions

```bash
# List available Python versions
uv python list

# Install specific version
uv python install 3.10 3.11 3.12

# Pin to specific version
uv python pin 3.11

# Create venv with specific version
uv venv --python 3.11 --python-preference managed
```

## Troubleshooting Common Issues

### TensorFlow GPU on Colab vs Local

```bash
# For CPU-only (recommended for most notebooks)
uv add "tensorflow-cpu>=2.14"

# For GPU support (when needed)
uv add "tensorflow>=2.14"
```

### Conflict resolution with ML libraries:

```bash
# If dependency conflicts arise, let uv resolve
uv sync  # uv handles complex resolution automatically

# Check for outdated packages
uv pip list --outdated

# Force specific version if needed
uv add "numpy==1.24.3"
```

### Notebook kernel registration:

```bash
# After creating venv, register kernel for Jupyter
uv add ipykernel
python -m ipykernel install --user --name learning-ml --display-name "Python (ML)"
```

## Best Practices for This Repository

1. **Keep dependencies lean** — only install what each notebook phase needs
2. **Use optional dependencies** — separate deep learning deps from core ML deps since not all users need TensorFlow
3. **Pin major versions** — ML libraries change fast; pin at least major.minor for stability
4. **Document version requirements** — some notebooks may require specific versions noted in markdown cells
5. **Never commit `uv.lock`** in educational repos unless the project requires exact reproducibility

## When Running Notebooks in Colab

Since notebooks target Google Colab, remind users:

- Colab has its own pre-installed packages (TensorFlow, PyTorch, scikit-learn, etc.)
- For local execution, the uv environment is essential
- Always include `%pip install` fallback in notebooks for users running locally without uv
