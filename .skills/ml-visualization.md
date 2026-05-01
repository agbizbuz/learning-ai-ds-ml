---
name: ml-visualization
description: >
  Create publication-quality visualizations using matplotlib and seaborn for ML
  education. Covers EDA plots, model evaluation visualizations, learning curves,
  confusion matrices, feature importance charts, and interactive plots.
---

# ML Visualization for Education

## Purpose

Create clear, informative visualizations that help learners understand data patterns,
model behavior, and evaluation results. Every plot should have a teaching purpose.

## Setup Template

```python
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Consistent style across all notebooks
plt.style.use("seaborn-v0_8-darkgrid")
plt.rcParams.update({
    "figure.figsize": (12, 6),
    "figure.dpi": 100,
    "axes.titlesize": 16,
    "axes.labelsize": 13,
    "xtick.labelsize": 11,
    "ytick.labelsize": 11,
    "legend.fontsize": 12,
})

# Color palette - colorblind-friendly
PALETTE = ["#4C72B0", "#DD8452", "#55A868", "#C44E52", "#8172B3", "#937860"]
CMAP = "coolwarm"
```

## EDA Visualizations

### Distribution Analysis:

```python
# Single feature histogram with KDE
fig, axes = plt.subplots(1, 3, figsize=(18, 5))

sns.histplot(data=df, x="feature_name", kde=True, ax=axes[0]);
axes[0].set_title("Distribution")

sns.boxplot(y=df["feature_name"], ax=axes[1]);
axes[1].set_title("Box Plot (Outliers)")

sns.ecdfplot(data=df, x="feature_name", ax=axes[2]);
axes[2].set_title("ECDF")

plt.tight_layout()
```

### Correlation Heatmap:

```python
# Correlation matrix visualization
correlation = df.select_dtypes(include="number").corr()

plt.figure(figsize=(12, 10))
sns.heatmap(
    correlation,
    annot=True,
    fmt=".2f",
    cmap="coolwarm",
    vmin=-1,
    vmax=1,
    linewidths=0.5,
    cbar_kws={"shrink": 0.8},
)
plt.title("Feature Correlation Matrix", pad=20)
plt.tight_layout()
plt.show()
```

### Pair Plot (for small datasets < 1000 samples):

```python
# Only for small datasets - too slow for large ones
sns.pairplot(df, hue="target", palette=PALETTE, diag_kind="kde")
plt.suptitle("Feature Pairwise Relationships", y=1.02)
plt.show()
```

### Scatter Plot with Trend:

```python
# Relationship between two features
plt.figure(figsize=(10, 6))
sns.scatterplot(
    data=df,
    x="feature_a",
    y="feature_b",
    hue="target",
    palette=PALETTE,
    alpha=0.6,
    s=60,
)
plt.title("Feature A vs Feature B by Class")
plt.tight_layout()
plt.show()
```

### Count Plots (Categorical):

```python
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Class distribution
sns.countplot(data=df, x="category", ax=axes[0], palette=PALETTE)
axes[0].set_title("Category Distribution")

# With target
sns.countplot(data=df, x="category", hue="target", ax=axes[1], palette=PALETTE)
axes[1].set_title("Category by Target Class")
plt.tight_layout()
```

## Model Evaluation Visualizations

### Confusion Matrix:

```python
from sklearn.metrics import confusion_matrix, classification_report
import itertools

def plot_confusion_matrix(y_true, y_pred, class_names, title="Confusion Matrix"):
    cm = confusion_matrix(y_true, y_pred)

    plt.figure(figsize=(8, 6))
    sns.heatmap(
        cm,
        annot=True,
        fmt="d",
        cmap="Blues",
        xticklabels=class_names,
        yticklabels=class_names,
        linewidths=0.5,
    )
    plt.title(title, pad=15, fontsize=16)
    plt.ylabel("Actual Label")
    plt.xlabel("Predicted Label")
    plt.tight_layout()
    plt.show()

# Normalized version
def plot_normalized_cm(y_true, y_pred, class_names):
    cm = confusion_matrix(y_true, y_pred)
    cm_pct = cm.astype("float") / cm.sum(axis=1)[:, np.newaxis] * 100

    plt.figure(figsize=(8, 6))
    sns.heatmap(
        cm_pct,
        annot=True,
        fmt=".1f",
        cmap="YlOrRd",
        xticklabels=class_names,
        yticklabels=class_names,
    )
    plt.title("Confusion Matrix (Percentage)", pad=15)
    plt.ylabel("Actual")
    plt.xlabel("Predicted")
    plt.tight_layout()
    plt.show()
```

### ROC Curve:

```python
from sklearn.metrics import roc_curve, auc

def plot_roc_curve(y_true, y_scores, model_name="Model"):
    fpr, tpr, _ = roc_curve(y_true, y_scores)
    roc_auc = auc(fpr, tpr)

    plt.figure(figsize=(8, 6))
    plt.plot(fpr, tpr, color="steelblue", lw=2,
             label=f"{model_name} (AUC = {roc_auc:.3f})")
    plt.plot([0, 1], [0, 1], "k--", lw=1.5, label="Random Classifier")
    plt.xlim([-0.05, 1.05])
    plt.ylim([0, 1.05])
    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    plt.title("ROC Curve", pad=15)
    plt.legend(loc="lower right")
    plt.tight_layout()
    plt.show()

# Multi-model comparison
def plot_roc_comparison(y_true, scores_dict):
    """Plot multiple ROC curves for comparison.
    scores_dict = {"RandomForest": y_scores_rf, "SVM": y_scores_svm, ...}
    """
    plt.figure(figsize=(8, 6))

    for name, scores in scores_dict.items():
        fpr, tpr, _ = roc_curve(y_true, scores)
        auc_score = auc(fpr, tpr)
        plt.plot(fpr, tpr, lw=2, label=f"{name} (AUC = {auc_score:.3f})")

    plt.plot([0, 1], [0, 1], "k--", lw=1.5, label="Random")
    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    plt.title("ROC Curve Comparison", pad=15)
    plt.legend(loc="lower right")
    plt.tight_layout()
    plt.show()
```

### Precision-Recall Curve:

```python
from sklearn.metrics import precision_recall_curve, auc as sk_auc

def plot_pr_curve(y_true, y_scores, model_name="Model"):
    precision, recall, _ = precision_recall_curve(y_true, y_scores)
    pr_auc = sk_auc(recall, precision)

    plt.figure(figsize=(8, 6))
    plt.plot(recall, precision, color="steelblue", lw=2,
             label=f"{model_name} (PR-AUC = {pr_auc:.3f})")
    plt.xlabel("Recall")
    plt.ylabel("Precision")
    plt.title("Precision-Recall Curve", pad=15)
    plt.legend(loc="best")
    plt.tight_layout()
    plt.show()
```

## Feature Importance Visualizations

### Bar Chart (Tree-based models):

```python
def plot_feature_importance(model, feature_names, top_n=15, descending=True):
    importances = model.feature_importances_

    # Sort by importance
    indices = np.argsort(importances)[::-1] if descending else np.argsort(importances)
    importances = importances[indices]
    features = [feature_names[i] for i in indices]

    # Take top N
    if top_n:
        features = features[:top_n]
        importances = importances[:top_n]

    plt.figure(figsize=(10, max(4, len(features) * 0.4)))
    colors = plt.cm.viridis(np.linspace(0.2, 0.8, len(features)))

    plt.barh(range(len(features)), importances, color=colors)
    plt.yticks(range(len(features)), features)
    plt.xlabel("Importance")
    plt.title("Feature Importances" + (f" (Top {top_n})" if top_n else ""))
    plt.tight_layout()
    plt.show()
```

### SHAP Summary Plot (Advanced):

```python
# Optional - requires shap library: pip install shap
import shap

def plot_shap_summary(model, X_sample, title="SHAP Feature Impact"):
    """Visualize feature impact using SHAP values.

    Uses a sample of data for faster computation.
    """
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(X_sample)

    plt.figure(figsize=(10, 8))
    shap.summary_plot(shap_values, X_sample, show=False)
    plt.suptitle(title, y=1.05, fontsize=16)
    plt.tight_layout()
    plt.show()
```

## Learning Curve & Validation Curve

```python
from sklearn.model_selection import learning_curve, validation_curve

def plot_learning_curve(model, X, y, title="Learning Curve", cv=5):
    train_sizes, train_scores, val_scores = learning_curve(
        model, X, y,
        train_sizes=np.linspace(0.1, 1.0, 10),
        cv=cv,
        scoring="accuracy",
        n_jobs=-1,
        random_state=42,
    )

    train_mean = train_scores.mean(axis=1)
    train_std = train_scores.std(axis=1)
    val_mean = val_scores.mean(axis=1)
    val_std = val_scores.std(axis=1)

    plt.figure(figsize=(10, 6))
    plt.plot(train_sizes, train_mean, "o-", color="steelblue",
             label="Training Score")
    plt.plot(train_sizes, val_mean, "s-", color="darkorange",
             label="Validation Score")
    plt.fill_between(train_sizes, train_mean - train_std,
                     train_mean + train_std, alpha=0.1, color="steelblue")
    plt.fill_between(train_sizes, val_mean - val_std,
                     val_mean + val_std, alpha=0.1, color="darkorange")
    plt.xlabel("Training Examples")
    plt.ylabel("Score")
    plt.title(title, pad=15)
    plt.legend(loc="lower right")
    plt.tight_layout()
    plt.show()
```

## Model Comparison Charts

### Side-by-side metric comparison:

```python
def plot_model_comparison(model_names, metrics_dict, title="Model Comparison"):
    """Compare multiple models across metrics.

    metrics_dict = {
        "Accuracy": [0.85, 0.82, 0.88],
        "F1": [0.83, 0.80, 0.86],
        "Precision": [0.84, 0.81, 0.87],
        "Recall": [0.82, 0.79, 0.85],
    }
    """
    x = np.arange(len(model_names))
    width = 0.25
    n_metrics = len(metrics_dict)

    fig, ax = plt.subplots(figsize=(12, 6))

    for i, (metric, values) in enumerate(metrics_dict.items()):
        offset = (i - n_metrics / 2 + 0.5) * width
        bars = ax.bar(x + offset, values, width, label=metric)

    ax.set_ylabel("Score")
    ax.set_title(title, pad=15)
    ax.set_xticks(x)
    ax.set_xticklabels(model_names)
    ax.legend(loc="lower right")
    ax.set_ylim(0, 1.1)
    plt.tight_layout()
    plt.show()
```

### Radar/Spider chart for model comparison:

```python
def plot_radar_comparison(model_names, metrics_dict, title="Model Radar Chart"):
    """Multi-model radar/spider plot.

    metrics_dict = {
        "Accuracy": [0.92, 0.88, 0.90],
        "Precision": [0.90, 0.86, 0.89],
        "Recall": [0.88, 0.90, 0.87],
        "F1": [0.91, 0.88, 0.88],
        "AUC": [0.95, 0.91, 0.93],
    }
    """
    categories = list(metrics_dict.keys())
    N = len(categories)

    angles = [n / float(N) * 2 * np.pi for n in range(N)]
    angles += angles[:1]  # Close the loop

    fig, ax = plt.subplots(figsize=(8, 8), subplot_kw=dict(polar=True))

    for model_name, idx in zip(model_names, range(len(model_names))):
        values = [metrics_dict[cat][idx] for cat in categories]
        values += values[:1]  # Close the loop
        ax.plot(angles, values, "o-", linewidth=2, label=model_name)
        ax.fill(angles, values, alpha=0.1)

    ax.set_xticks(angles[:-1])
    ax.set_xticklabels(categories)
    ax.set_ylim(0, 1)
    plt.title(title, y=1.08, fontsize=16)
    plt.legend(loc="upper right", bbox_to_anchor=(1.3, 1.1))
    plt.tight_layout()
    plt.show()
```

## Residual Plots (Regression)

```python
def plot_residuals(y_true, y_pred, title="Residual Analysis"):
    residuals = y_true - y_pred

    fig, axes = plt.subplots(1, 3, figsize=(18, 5))

    # Residuals vs Predicted
    axes[0].scatter(y_pred, residuals, alpha=0.6, color="steelblue")
    axes[0].axhline(y=0, color="red", linestyle="--", lw=1.5)
    axes[0].set_xlabel("Predicted Values")
    axes[0].set_ylabel("Residuals")
    axes[0].set_title("Residuals vs Predicted")

    # Residual distribution
    axes[1].hist(residuals, bins=30, edgecolor="black", color="steelblue", alpha=0.7)
    axes[1].axvline(x=0, color="red", linestyle="--", lw=1.5)
    axes[1].set_xlabel("Residual")
    axes[1].set_title("Residual Distribution")

    # QQ plot
    from scipy import stats
    stats.probplot(residuals, dist="norm", plot=axes[2])
    axes[2].set_title("Q-Q Plot")

    plt.suptitle(title, fontsize=16, y=1.02)
    plt.tight_layout()
    plt.show()
```

## Decision Boundary Visualization (2D)

```python
from matplotlib.colors import ListedColormap

def plot_decision_boundary(model, X, y, feature_indices=[0, 1],
                          title="Decision Boundary", cmap="RdBu"):
    """Plot decision boundary for 2 features."""
    x1_range = np.linspace(X[:, feature_indices[0]].min() - 1,
                          X[:, feature_indices[0]].max() + 1, 300)
    x2_range = np.linspace(X[:, feature_indices[1]].min() - 1,
                          X[:, feature_indices[1]].max() + 1, 300)

    mesh1, mesh2 = np.meshgrid(x1_range, x2_range)
    mesh = np.c_[mesh1.ravel(), mesh2.ravel()]

    # Use only the two selected features for prediction
    if X.shape[1] == 2:
        Z = model.predict(mesh).reshape(mesh1.shape)
    else:
        # For models with >2 features, this needs adaptation
        Z = model.predict(mesh).reshape(mesh1.shape)

    plt.figure(figsize=(10, 8))
    contour = plt.contourf(mesh1, mesh2, Z, alpha=0.3, cmap=cmap)

    scatter = plt.scatter(
        X[:, feature_indices[0]], X[:, feature_indices[1]],
        c=y, cmap=cmap, edgecolors="black", s=50, alpha=0.7,
    )
    plt.xlabel(f"Feature {feature_indices[0]}")
    plt.ylabel(f"Feature {feature_indices[1]}")
    plt.title(title, pad=15)
    plt.colorbar(contour)
    plt.tight_layout()
    plt.show()
```

## Plotting Tips for Educational Notebooks

1. **Always annotate** - add text labels to highlight key insights
2. **Use color consistently** - one palette for entire notebook
3. **Size matters** - too small = illegible, too large = wasteful
4. **Save figures** for reports: `plt.savefig("output.png", dpi=150, bbox_inches="tight")`
5. **Interactive plots** with plotly for exploratory work:
   ```python
   import plotly.express as px
   fig = px.scatter(df, x="feature_a", y="feature_b", color="target",
                    hover_data=["other_feature"])
   fig.show()
   ```

## Color Palette Reference

```python
# Colorblind-safe palettes for different purposes
CLASSIFICATION = ["#FF6B6B", "#4ECDC4", "#45B7D1"]  # 3 classes
MULTICLASS = ["#4C72B0", "#DD8452", "#55A868", "#C44E52", "#8172B3"]  # 5 classes
REGRESSION = plt.cm.coolwarm  # divergent for error visualization
DEPTH = plt.cm.viridis  # for importance/depth
HEATMAP = "coolwarm"     # for correlation matrices
```
