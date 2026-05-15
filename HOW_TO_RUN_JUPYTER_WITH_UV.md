# How To: Run Jupyter Notebooks with a uv-managed Python Environment

Since you are using **`uv`**, you have access to much faster and cleaner workflows than traditional `pip` and `venv` management. There are three primary ways to run your Jupyter Notebooks using a `uv` environment, depending on whether you want a quick one-off run or a permanent setup.

---

## Method 1: The `uv run` Way (Recommended)

This is the most idiomatic way to use `uv`. If you have a `pyproject.toml` file in your directory (as this repository does), `uv` can run commands within that managed environment automatically.

**1. Ensure `jupyter` is in your dependencies.**
If `jupyter` isn't in your `pyproject.toml`, add it:

```bash
uv add jupyter
```

**2. Run Jupyter directly.**
Simply use `uv run`. This command ensures that the command is executed using the Python interpreter and the exact package versions locked in your `uv.lock` file.

```bash
uv run jupyter notebook
# OR
uv run jupyter lab
```

**Why this is good:** You don't need to "activate" anything. `uv` handles the environment context for you.

---

## Method 2: The "Kernel" Way (Best for existing Jupyter setups)

If you already have a global or separate Jupyter installation (like a standalone JupyterLab or Anaconda) and you just want to **use** your `uv` environment as a selectable "kernel" inside it, use this method.

**1. Install `ipykernel` in your `uv` environment.**

```bash
uv add ipykernel
```

**2. Register the environment as a new kernel.**
Run this command via `uv run`. This tells Jupyter to add a new option to its dropdown menu.

```bash
uv run python -m ipykernel install --user --name my-uv-project --display-name "Python (uv-project)"
```

**3. Open Jupyter and Select.**
Now, you can open your normal Jupyter application. When you create a new notebook or change the kernel of an existing one, you will see **"Python (uv-project)"** in the list.

**Why this is good:** You can have one heavy JupyterLab installation, but switch between different `uv` environments (for different projects) just by changing the kernel.

---

## Method 3: The "Manual" Way (Classic)

If you aren't using a `pyproject.toml` and just want to manage a standalone virtual environment:

**1. Create and activate the environment.**

```bash
uv venv
source .venv/bin/activate  # On macOS/Linux
# .venv\Scripts\activate  # On Windows
```

**2. Install Jupyter and your dependencies.**

```bash
uv pip install jupyter pandas matplotlib scikit-learn
```

**3. Run Jupyter.**

```bash
jupyter notebook
```

---

## Summary Comparison

| Feature         | `uv run` (Method 1)                   | Kernel Registration (Method 2)    | Manual `uv venv` (Method 3)          |
| :-------------- | :------------------------------------ | :-------------------------------- | :----------------------------------- |
| **Best For**    | Project-specific work                 | Using many environments in one UI | Quick, temporary experiments         |
| **Ease of Use** | Extremely High                        | High (once set up)                | Medium                               |
| **Context**     | Always uses project `uv.lock`         | Uses the specific `uv` env        | Uses whatever is "activated"         |
| **Dependency**  | `jupyter` must be in `pyproject.toml` | `ipykernel` must be in `uv` env   | You must `uv pip install` everything |
