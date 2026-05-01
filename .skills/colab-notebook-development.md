---
name: colab-notebook-development
description: >
  Create, edit, and optimize Jupyter notebooks for Google Colab. Covers cell structure,
  Colab-specific features (badges, runtime selection, GPU setup), educational cell organization,
  and best practices for ML learning notebooks in this educational repository.
---

# Colab Notebook Development

## Core Principles

1. **Every notebook starts with a Colab open-in-badge** — link back to the GitHub repo
2. **Educational-first design** — each cell should teach something, not just compute
3. **Self-contained cells** — users should be able to run cells in any order after dependencies
4. **Clear progression** — import → data → EDA → model → evaluate → visualize
5. **Include visualizations** — ML learning is visual; every notebook must have plots

## Notebook Structure Template

### Standard ML Notebook (e.g., `simplilearn_ml_python/random_forest.ipynb`):

```
Cell 1: Markdown - Title with Colab badge
  └─ "<a href=\"...colab-badge.png...\" ...>Open In Colab</a>"

Cell 2: Markdown - Overview & Learning Objectives
  └─ What algorithm, what problem, key takeaways

Cell 3: Code - Imports
  └─ All libraries (numpy, pandas, sklearn, etc.)

Cell 4: Markdown - Section: Data Loading

Cell 5: Code - Data Loading & Inspection
  └─ pd.read_csv(), df.head(), df.info(), df.describe()

Cell 6: Markdown - Section: Exploratory Data Analysis

Cell 7+: Code - EDA Visualizations
  └─ scatter plots, histograms, correlation heatmaps

Cell N: Markdown - Section: Model Training

Cell N+1: Code - Train/Test Split & Model Training
  └─ train_test_split(), model.fit()

Cell N+2: Code - Model Evaluation
  └─ metrics, confusion matrix, feature importance

Cell N+3: Code - Visualize Results
  └─ plot predictions vs actual, error distribution

Cell N+4: Markdown - Summary & Key Takeaways
  └─ What was learned, when to use this algorithm
```

## Colab-Specific Features to Use

### Opening Badge (ALWAYS include):

```markdown
<a href="https://colab.research.google.com/github/agbizbuz/learning-ai-ds-ml/blob/main/path/to/notebook.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>
```

### GPU Runtime Check:

```python
import tensorflow as tf
print("GPU Available:", tf.config.list_physical_devices('GPU'))
```

### Mount Google Drive (for datasets):

```python
from google.colab import drive
drive.mount('/content/drive')
```

### Display utilities:

```python
from IPython.display import display, Markdown, HTML, clear_output
import matplotlib.pyplot as plt
plt.style.use('seaborn-v0_8-colorblind')  # or 'ggplot'

# Nice output display
display(df.head().style.background_gradient(cmap='coolwarm'))
```

### Interactive widgets:

```python
import ipywidgets as widgets
from ipywidgets import interact

@interact(n_estimators=(50, 500, 25), max_depth=(3, 20, 1))
def tune_model(n_estimators, max_depth):
    """Interactive hyperparameter tuning"""
    model = RandomForestRegressor(n_estimators=n_estimators, max_depth=max_depth)
    model.fit(X_train, y_train)
    score = model.score(X_test, y_test)
    print(f"R² Score: {score:.4f}")
```

## Notebook Best Practices for This Repository

### Code Style Within Notebooks:

1. **Use markdown cells liberally** — explain BEFORE and AFTER code blocks
2. **Print informative outputs** — don't leave empty cells
3. **Use f-strings for dynamic output**:
   ```python
   print(f"Model R² Score: {r2_score(y_test, predictions):.4f}")
   print(f"Mean Absolute Error: {mae:.4f}")
   ```
4. **Include timing for longer operations**:
   ```python
   import time
   start = time.time()
   model.fit(X_train, y_train)
   print(f"Training completed in {time.time() - start:.2f} seconds")
   ```

### Data Loading Patterns:

This repository uses Kaggle/UCI datasets via URLs. Standard pattern:

```python
import pandas as pd

# Load from URL
df = pd.read_csv('https://raw.githubusercontent.com/.../data.csv')

# Or download from Kaggle
# !kaggle datasets download -d user/dataset-name -p /content/
# df = pd.read_csv('/content/dataset-name.csv')
```

### Visualization Standards:

```python
# Consistent figure sizing
plt.figure(figsize=(12, 6))

# Always add titles, labels, grid
plt.title('Model Performance Comparison', fontsize=16)
plt.xlabel('Feature', fontsize=12)
plt.ylabel('Value', fontsize=12)
plt.grid(True, alpha=0.3)

# Use seaborn for statistical plots
import seaborn as sns
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt='.2f')
```

## Creating New Notebooks

### When asked to create a new notebook for the learning path:

1. **Determine difficulty level** → beginner/intermediate/advanced → target folder
2. **Choose algorithm/topic** → align with LEARNING_PATH.md phases
3. **Find an appropriate dataset** → prefer URLs over local files for accessibility
4. **Follow the structure template** above
5. **Include a "Next Steps" cell** suggesting related notebooks or improvements
6. **Tag notebook with difficulty** in the title markdown

### Notebook filename conventions:

```
simplilearn_ml_python/algorithm_name.ipynb
Course_Work/topic_name.ipynb
```

## Common Issues in Colab Notebooks

| Issue             | Fix                                                          |
| ----------------- | ------------------------------------------------------------ |
| Version conflicts | Add `%pip install` cells at top with pinned versions         |
| Missing dataset   | Use URL-based loading or provide Kaggle download command     |
| Slow execution    | Add timing outputs and suggest smaller datasets for practice |
| GPU not detected  | Include runtime type check and CPU fallback code             |

## Notebook Cell Comments

Every code cell should have inline comments for educational value:

```python
# Split data: 80% training, 20% testing
# random_state ensures reproducible splits
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
```
