# GitHub Actions — Notebook Validation

Run every notebook through nbmake to catch import errors, NameErrors, and shape mismatches before learners do.

---

## How It Works

1. **Setup:** Python ≥ 3.12 + `uv` → fast dependency install from `pyproject.toml`
2. **Test:** `nbmake` executes every `.ipynb` in `simplilearn_ml_python/` and `LLM_Course/`
3. **Lint:** `ruff` checks import hygiene and notebook-cell conventions
4. **Lint:** `ruff` checks import hygiene and notebook-cell conventions

## Skipping Notebooks That Need API Keys

Several advanced notebooks require external API keys (Groq, Gemini, Colab userdata) or long GPU training.
They are **automatically skipped** via the `nbmake.skip-files` config in `pyproject.toml`.

---

## Example Workflow File

```yaml
# .github/workflows/notebook_check.yml
name: Notebook Validation

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_call:
    types:
  workflow_call:
    types:

#  schedule:
    # Nightly run at 03:00 UTC
    - cron: '6 3 * * *'

jobs:
  notebook-test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.12"]

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install uv
        run: pip install uv

      - name: Cache uv environment
        id: cache-venv
        uses: actions/cache@v4
        with:
          path: .venv
          key: ${{ runner.os }}-venv-${{ hashFiles('pyproject.toml') }}

      - name: Sync dependencies
        if: steps.cache-venv.outputs.cache-hit != 'true'
        run: |
          uv sync --extra dev

      - name: Lint notebooks
        run: |
          uv run ruff check simplilearn_ml_python/ LLM_Course/ --output-format=concise

      - name: Execute notebooks (nbmake)
        run: |
          uv run nbmake simplilearn_ml_python/ LLM_Course/
```

---

## Notes

- CI will never download dataset files; all data is fetched at runtime via URL / Kaggle handle.
- To add a new notebook to the test suite, ensure its imports are declared in `pyproject.toml`.
- To exclude a notebook from CI, add it to `nbmake.skip-files` in `pyproject.toml`.
