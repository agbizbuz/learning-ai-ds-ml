---
name: notebook-creation
description: >
  Create well-structured Jupyter notebooks for machine learning education with proper
  pedagogical flow, Colab badges, visualization cells, and clear progression from
  imports to evaluation.
---

# Notebook Creation Guide

## Purpose

Create educational Jupyter notebooks that follow a consistent, pedagogically sound
structure aligned with the repository's learning paths.

## Standard Notebook Skeleton

Every notebook should follow this progression:

```
┌──────────────────────────────────────────────┐
│ Cell 1: Title + Colab Badge (Markdown)       │
│ Cell 2: Overview & Learning Objectives       │
│ Cell 3: Import Libraries                     │
│ Cell 4: Dataset Description (Markdown)       │
│ Cell 5: Load & Inspect Data                  │
│ Cell 6: Exploratory Data Analysis (Markdown) │
│ Cell 7-N: EDA Visualizations                 │
│ Cell N+1: Preprocessing (Markdown)           │
│ Cell N+2: Data Preparation                   │
│ Cell N+3: Model Training (Markdown)          │
│ Cell N+4: Build & Train                      │
│ Cell N+5: Evaluation (Markdown)              │
│ Cell N+6: Metrics & Visual Results           │
│ Cell N+7: Key Takeaways (Markdown)           │
└──────────────────────────────────────────────┘
```

## Complete Example Structure

### Title Cell:

```markdown
# 🌲 Random Forest Regression - Petrol Consumption Prediction

<a href="https://colab.research.google.com/github/agbizbuz/learning-ai-ds-ml/blob/main/simplilearn_ml_python/random_forest.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

## Learning Objectives

- Understand how Random Forest handles non-linear relationships
- Learn to tune hyperparameters for regression tasks
- Compare ensemble methods against simpler baselines
```

### Imports Cell:

```python
# ================================
# Import Libraries
# ================================
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.tree import DecisionTreeRegressor

plt.style.use("seaborn-v0_8-darkgrid")
```

### Data Loading Cell:

```python
# ================================
# Load Dataset
# ================================
# Dataset: Monthly petroleum consumption in Saudi Arabia (1980-2012)
# Source: https://archive.ics.uci.edu/ml/datasets/petrol+consumption

url = "https://raw.githubusercontent.com/.../petrol_consumption.csv"
df = pd.read_csv(url)

# Quick overview
print(f"Dataset shape: {df.shape}")
print(f"\nFirst 5 rows:")
display(df.head())
print(f"\nData types and missing values:")
display(df.info())
```

### EDA Cell:

```python
# ================================
# Exploratory Data Analysis
# ================================
# Visualize distribution of target variable
fig, axes = plt.subplots(1, 2, figsize=(14, 5))
sns.histplot(df["Petrol_Tax"], kde=True, ax=axes[0])
axes[0].set_title("Distribution of Petrol Tax")

sns.scatterplot(data=df, x="Temperature", y="Petrol_Consumption", hue="Petrol_Tax")
axes[1].set_title("Temperature vs Consumption")
plt.tight_layout()
plt.show()
```

### Preprocessing Cell:

```python
# ================================
# Data Preprocessing
# ================================
# Separate features and target
feature_columns = ["Temperature", "Taxation", "Petrol_Tax", "Number_of_Vehicles"]
target_column = "Petrol_Consumption"

X = df[feature_columns]
y = df[target_column]

# Train/test split (80/20)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

print(f"Training set: {X_train.shape[0]} samples")
print(f"Test set: {X_test.shape[0]} samples")
```

### Model Training Cell:

```python
# ================================
# Train Random Forest Regressor
# ================================
rf_model = RandomForestRegressor(
    n_estimators=100,
    max_depth=10,
    min_samples_split=5,
    random_state=42,
    n_jobs=-1,
)

rf_model.fit(X_train, y_train)
print("Model trained successfully!")

# Make predictions
y_pred = rf_model.predict(X_test)
```

### Evaluation Cell:

```python
# ================================
# Model Evaluation
# ================================
# Calculate metrics
mae = mean_absolute_error(y_test, y_pred)
mse = mean_squared_error(y_test, y_pred)
rmse = np.sqrt(mse)
r2 = r2_score(y_test, y_pred)

print("Model Performance:")
print(f"  Mean Absolute Error (MAE):  {mae:.4f}")
print(f"  Mean Squared Error (MSE):   {mse:.4f}")
print(f"  Root Mean Squared Error:    {rmse:.4f}")
print(f"  R² Score:                   {r2:.4f}")

# Cross-validation
cv_scores = cross_val_score(rf_model, X, y, cv=5, scoring="r2")
print(f"\nCross-Validation R²: {cv_scores.mean():.4f} (±{cv_scores.std():.4f})")
```

### Visualization Cell:

```python
# Visualize predictions vs actual
plt.figure(figsize=(10, 6))
plt.scatter(y_test, y_pred, alpha=0.6, color="steelblue")
plt.plot([y_test.min(), y_test.max()],
         [y_test.min(), y_test.max()], 'r--', lw=2)
plt.xlabel("Actual Values")
plt.ylabel("Predicted Values")
plt.title("Random Forest: Predicted vs Actual Consumption")
plt.tight_layout()
plt.show()
```

### Takeaways Cell:

```markdown
## 🔑 Key Takeaways

1. **Random Forest** handles non-linear relationships better than linear models
2. **Ensemble approach** reduces variance through averaging multiple trees
3. **Hyperparameters** like `n_estimators` and `max_depth` significantly impact performance
4. **Cross-validation** provides more reliable performance estimates than single split
5. **Feature importance** reveals which predictors matter most

### ✨ What to Try Next

- Compare against Gradient Boosting (`GradientBoostingRegressor`)
- Try feature selection using RF feature importances
- Experiment with `max_features` parameter
```

## Cell Design Principles

### Import Cell Rules:

- Group imports by: standard library → third-party → sklearn → custom
- Sort alphabetically within groups (enforced by ruff `I` rules)
- Add comment `# noqa: F401` if intentionally unused imports for teaching

### Code Cell Rules:

- Begin with section header comment: `# ================================`
- Print informative output - never leave a cell that produces no output
- Use `display()` for DataFrames to render nicely in Colab
- Set `random_state` for reproducibility
- Time expensive operations with `time.time()`

### Visualization Rules:

- Use `plt.style.use()` at import time for consistency
- Always label axes and add titles
- Use `figsize=(12, 6)` as default for wider plots
- Use `plt.tight_layout()` to prevent label clipping
- Prefer seaborn for statistical visualizations

### Markdown Cell Rules:

- Use emoji sparingly but purposefully (🌲📊🎯💡)
- Include "What to Try Next" suggestions at end
- Reference related papers or resources when relevant
- Use bullet points for key takeaways

## Difficulty Level Guidelines

### Beginner Notebooks:

- Focus on single algorithm
- Include extensive explanations
- Use built-in datasets when possible
- 3-5 evaluation metrics max
- Visual decision boundaries if applicable

### Intermediate Notebooks:

- Compare 2+ algorithms
- Include hyperparameter tuning
- Add cross-validation
- Feature engineering examples
- Pipelines demonstration

### Advanced Notebooks:

- Deep learning models
- Neural network architecture design
- Gradient visualization
- Learning curve analysis
- Production-like code patterns

## Saving Tips

When creating notebooks programmatically or editing them:

1. **Set kernel info** in notebook metadata:

```json
"kernelspec": {
    "display_name": "Python 3",
    "language": "python",
    "name": "python3"
}
```

2. **Set language info**:

```json
"language_info": {
    "name": "python",
    "version": "3.10.0"
}
```

3. **Clear outputs** before committing to keep repo size reasonable
4. **Test in Colab** before pushing to verify execution order

## Common Dataset Sources for Education

| Category | Source                | URL Pattern                         |
| -------- | --------------------- | ----------------------------------- |
| Datasets | UCI ML Repository     | `archive.ics.uci.edu/ml`            |
| Datasets | Kaggle                | `kaggle.com/datasets/`              |
| Datasets | sklearn built-in      | `sklearn.datasets.load_*`           |
| Datasets | Google Dataset Search | `datasetsearch.research.google.com` |
| Datasets | data.gov              | `catalog.data.gov`                  |
| Datasets | OpenML                | `openml.org`                        |

## Quick Checklist Before Committing

- [ ] Colab badge present and links to correct file
- [ ] All cells have descriptive section comments
- [ ] No hardcoded paths that break on different machines
- [ ] Output cells demonstrate the concept clearly
- [ ] Visualizations are publication-quality
- [ ] `random_state` set everywhere reproducibility matters
- [ ] Learning objectives match LEARNING_PATH.md level
- [ ] Key takeaways section summarizes lessons
- [ ] Next steps guide learners forward
- [ ] Code passes `ruff check` without errors
