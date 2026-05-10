# AGENTS.md — Working Instructions for This Repository

## 1. Repo Purpose

Educational ML/AI learning path with Jupyter notebooks and supporting documentation,
organized by difficulty level (Beginner → Intermediate → Advanced).

**Full project details** — consult the docs below when you need scope or content guidance:

- `README.md` — project overview and directory map
- `LEARNING_PATH.md` — phase-by-phase curriculum with timelines
- `PROJECT_ROADMAP.md` — project ideas, datasets, and implementation steps
- `SUMMARY.md` — complete learning path overview

Do not duplicate these docs in tool output.

---

## 2. File Layout and Edit Permissions

| Path                                                                    | Content                                                         | Agent Policy                                                                           |
| ----------------------------------------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `simplilearn_ml_python/`                                                | Beginner/intermediate Jupyter notebooks (ML algorithms)         | **Editable** — fix imports, update cells, add clarifying markdown                      |
| `LLM_Course/`                                                           | Advanced notebooks (NLP embeddings, fine-tuning, generative AI) | **Editable** — same notebook conventions apply                                         |
| `reference/`                                                            | PDF lecture notes                                               | **Read-only** — never modify or move                                                   |
| `resources/`                                                            | Curated links organized by difficulty level                     | **Read-only** — do not add/remove items without explicit user request                  |
| `resources/beginner/`, `resources/intermediate/`, `resources/advanced/` | Difficulty-bucketed material                                    | **Read-only**                                                                          |
| Root `.md` docs                                                         | `README.md`, `LEARNING_PATH.md`, etc.                           | **Editable** when asked, but keep British English spelling and UPPER_SNAKE_CASE naming |

---

## 3. Python / Environment Conventions

- **Python:** ≥ 3.12
- **Managed by uv** — `make setup` to initialise environment, see `pyproject.toml`.
- **Core packages:** `numpy`, `pandas`, `matplotlib`, `scikit-learn`, `jupyter`, `seaborn`, `tensorflow`
- **Import aliases:** `import numpy as np`, `import pandas as pd`, `import tensorflow as tf` — follow the existing convention in the repo
- **No `requirements.txt` exists yet.** If you add a new dependency to a notebook, note it in the relevant markdown cell; do not create a bare `requirements.txt` unless explicitly asked.
- **Virtual env assumed** — notebooks expect a local `venv` with the above packages installed.

---

## 4. Jupyter Notebook Conventions

All `.ipynb` files in `simplilearn_ml_python/` and `LLM_Course/` follow a consistent pattern. Honour it:

1. **Title markdown cell** — First cell is a markdown cell with a Colab badge link and a brief description. Always preserve this.
2. **Explanatory markdown between code blocks** — After every major code block, add a short markdown cell explaining what the code did and its output. This is the pedagogical core of the repo.
3. **Code cells are self-contained** — Imports live near the top. Data loading and plotting live in separate cells.
4. **Datasets by URL only** — Never download, embed, or commit dataset files into the repo. If a notebook references data, use a Kaggle/UCI/online URL or a `kagglehub` data handle.
5. **Validation before saving** — When modifying a notebook, mentally verify that all code cells would run bottom-to-top without NameError. If you change a variable name or import, update every downstream cell that depends on it.
6. **Keep the Colab badge consistent** — If adding a brand-new notebook, include the standard Colab link pointing to the repo.

---

## 5. Documentation Conventions

- **Filenames:** UPPER_SNAKE_CASE with `.md` extension (e.g. `LEARNING_PATH.md`, not `learning-path.md`)
- **Spelling:** British English throughout (e.g. _organise_, _colour_, _summariser_)
- **Cross-references:** Use relative paths (e.g. `see [QUICK_START.md](QUICK_START.md)`)
- **Tone:** Instructional, learner-facing, not internal-engineering-notes style

---

## 6. What NOT to Do

| Rule                                                                                                       | Reason                                                                                                  |
| ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Do not download or commit dataset files                                                                    | Keeps the repo lightweight and licence-clean; datasets are always fetched at runtime                    |
| Do not modify files in `reference/`                                                                        | These are original course PDFs; moving or renaming breaks doc links                                     |
| Do not remove Colab badge cells from notebooks                                                             | Learners rely on these to open notebooks in Colab with one click                                        |
| Do not rewrite explanatory markdown cells with terse engineering notes                                     | The repo is pedagogical — explanations must stay detailed enough for a learner at that difficulty level |
| Do not change the curriculum structure of `LEARNING_PATH.md` or `PROJECT_ROADMAP.md` without user approval | These define the teaching sequence                                                                      |

---

## 7. Validation Expectations

This is an educational repo — there are no unit tests, linters, or CI. Validation is manual and targeted:

| Task                       | How to validate                                                                                                                |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Editing a notebook         | Ensure every code cell's imports, variables, and outputs chain correctly. Pay attention to shape changes (e.g. after scaling). |
| Adding a new notebook      | Follow the template pattern: title markdown → imports → data load → model → fit → plot → summary markdown.                     |
| Changing a `.md` doc       | Keep British English spelling and UPPER_SNAKE_CASE filename references.                                                        |
| Breaking API compatibility | If a cell depends on a specific scikit-learn or TensorFlow API, document the version assumption in a comment.                  |

---

## 8. Reference Card: Current Notebook Inventory

### `simplilearn_ml_python/`

| Notebook                              | Algorithm                                |
| ------------------------------------- | ---------------------------------------- |
| `random_forest.ipynb`                 | Random Forest regression                 |
| `random_forest_improved.ipynb`        | Random Forest with hyperparameter tuning |
| `k_means_cluster.ipynb`               | K-Means clustering                       |
| `knn_for_anamoly.ipynb`               | KNN anomaly detection                    |
| `pca.ipynb`                           | Principal Component Analysis             |
| `naive_bayes.ipynb`                   | Naive Bayes classification               |
| `polynomial_regression.ipynb`         | Polynomial regression                    |
| `svd.ipynb`                           | Singular Value Decomposition             |
| `bagging.ipynb`                       | Bagging ensemble                         |
| `boosting.ipynb`                      | Boosting ensemble                        |
| `stacking.ipynb`                      | Stacking ensemble                        |
| `hierarchial_clustering.ipynb`        | Hierarchical clustering                  |
| `birch.ipynb`                         | BIRCH clustering                         |
| `stochastic_grad_desc.ipynb`          | Stochastic Gradient Descent              |
| `support_vector_machine.ipynb`        | SVM                                      |
| `ensemble_wt_keras_and_sklearn.ipynb` | Ensemble with Keras & sklearn            |
| `tensorflow_exercise.ipynb`           | TensorFlow exercise                      |

### `LLM_Course/`

| Notebook                                        | Topic                                   |
| ----------------------------------------------- | --------------------------------------- |
| `Embeddings.ipynb`                              | Tokenization, vectorisation, embeddings |
| `Fine_Tuning_Course_lab.ipynb`                  | Model fine-tuning lab                   |
| `continued_pretraining_engineering_demo.ipynb`  | Continued pre-training demo             |
| `Generative_AI_Use_Case_Summarize_Dialog.ipynb` | Dialogue summarisation                  |
| `Cust_Feedbak_Summeriser.ipynb`                 | Customer feedback summariser            |
| `LLM_Model_Evaluation.ipynb`                    | LLM evaluation                          |
| `LLM_Examples_Gemini.ipynb`                     | Gemini API examples                     |
