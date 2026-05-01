---
name: dataset-handling
description: >
  Load, explore, clean, and preprocess datasets for ML education. Covers data loading
  from URLs/Kaggle/sklearn, handling missing values, encoding, scaling, train/test splits,
  and proper data hygiene practices.
---

# Dataset Handling for ML Education

## Core Principles

1. **Data hygiene first** — understand your data before any modeling
2. **Prevent data leakage** — all preprocessing must happen AFTER train/test split
3. **Document data sources** — every notebook must cite dataset provenance
4. **Reproducibility** — use `random_state`, fix seeds, log versions
5. **Educational value** — show the data, don't just process it silently

## Data Loading Patterns

### Pattern 1: Direct CSV from URL (Preferred)

```python
import pandas as pd

# Most educational datasets - transparent, reproducible
df = pd.read_csv("https://raw.githubusercontent.com/.../data.csv")

# With specific column types
df = pd.read_csv(
    url,
    parse_dates=["date_column"],
    dtype={"id_column": "int64"},
    na_values=["?", "NA", "null", ""],
)
```

### Pattern 2: Sklearn Built-in Datasets

```python
from sklearn.datasets import load_iris, load_boston, fetch_california_housing, fetch_openml

# Small datasets (downloaded automatically)
iris = load_iris()
X = iris.data
y = iris.target
feature_names = iris.feature_names

# Larger datasets via fetch_openml
mnist = fetch_openml('mnist_784', version=1, as_frame=False, parser='auto')
X, y = mnist.data, mnist.target
```

### Pattern 3: Kaggle Dataset Download

```python
# In Colab cell - one-time setup
# !pip install kaggle
# !kaggle datasets download -d <dataset-slug> -p /content/
# !unzip /content/file.zip -d /content/

df = pd.read_csv("/content/dataset.csv")
```

### Pattern 4: Google Drive Mount

```python
# For personal/large datasets
from google.colab import drive
drive.mount('/content/drive')

df = pd.read_csv('/content/drive/MyDrive/dataset.csv')
```

## EDA Checklist (Every Notebook)

```python
# == Step 1: Shape & Types ==
print(f"Shape: {df.shape}")
print(f"\nColumn types:\n{df.dtypes}")

# == Step 2: Missing Values ==
print(f"\nMissing values:\n{df.isnull().sum()}")
print(f"\nMissing %:\n{(df.isnull().mean() * 100).round(2)}%")

# == Step 3: Basic Statistics ==
print(f"\nNumeric summary:\n{df.describe()}")

# == Step 4: Duplicate Check ==
print(f"\nDuplicates: {df.duplicated().sum()}")
if df.duplicated().sum() > 0:
    df = df.drop_duplicates()

# == Step 5: Class Balance (Classification) ==
print(f"\nTarget distribution:\n{df['target'].value_counts()}")
print(f"\nTarget distribution %:\n{df['target'].value_counts(normalize=True) * 100:.2f}%")

# == Step 6: Correlation (if multiple numeric columns) ==
numeric_cols = df.select_dtypes(include=[np.number]).columns
correlation = df[numeric_cols].corr()
```

## Missing Value Handling Strategies

### When to use which strategy:

| Scenario                        | Strategy         | Code                           |
| ------------------------------- | ---------------- | ------------------------------ |
| < 5% missing, random            | Drop rows        | `df.dropna()`                  |
| Numeric, < 50% missing          | Mean/Median fill | `df.fillna(df.median())`       |
| Categorical with dominant value | Mode fill        | `df.fillna(df.mode().iloc[0])` |
| Sequential/time series          | Forward fill     | `df.fillna(method='ffill')`    |
| > 50% missing                   | Drop column      | `df.drop('column', axis=1)`    |
| Need indicator of missingness   | Fill + flag      | See below                      |

### Complete missing value pipeline:

```python
def handle_missing_values(df, strategy="median_for_numeric"):
    """Handle missing values with chosen strategy."""
    df_processed = df.copy()

    for col in df_processed.columns:
        missing_pct = df_processed[col].isnull().mean()

        if missing_pct > 0.5:
            # Too many missing - drop column
            print(f"Dropping {col} ({missing_pct*100:.1f}% missing)")
            df_processed = df_processed.drop(col, axis=1)

        elif df_processed[col].dtype == 'object':
            # Categorical - fill with mode
            mode_val = df_processed[col].mode()[0]
            df_processed[col] = df_processed[col].fillna(mode_val)

        else:
            if strategy == "median":
                df_processed[col] = df_processed[col].fillna(
                    df_processed[col].median()
                )
            elif strategy == "mean":
                df_processed[col] = df_processed[col].fillna(
                    df_processed[col].mean()
                )

    return df_processed
```

## Feature Engineering Essentials

### Scaling (ALWAYS after train/test split):

```python
from sklearn.preprocessing import StandardScaler, MinMaxScaler, RobustScaler

# CRITICAL: fit on TRAINING data ONLY, transform on both
scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)  # fit + transform
X_test_scaled = scaler.transform(X_test)         # transform ONLY

# When to use which scaler:
# StandardScaler: Most common, Gaussian-distributed features
# MinMaxScaler: Neural networks, bounded features [0,1]
# RobustScaler: Features with outliers (med-based)
```

### Encoding Categorical Variables:

```python
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# Binary categories
le = LabelEncoder()
df["gender_encoded"] = le.fit_transform(df["gender"])
# male → 1, female → 0

# Multi-category with few levels → One-Hot Encoding
df = pd.get_dummies(df, columns=["category"], prefix="cat", drop_first=True)

# Multi-category with many levels → Target Encoding
# from category_encoders import TargetEncoder
# te = TargetEncoder()
# df["encoded"] = te.fit_transform(df["category"], df["target"])
```

### Feature Creation Patterns:

```python
# Time-based features
df["year"] = df["date"].dt.year
df["month"] = df["date"].dt.month
df["dayofweek"] = df["date"].dt.dayofweek

# Ratio features
df["price_per_sqft"] = df["price"] / df["area"]

# Binning continuous variables
df["age_group"] = pd.cut(
    df["age"], bins=[0, 18, 35, 55, 100],
    labels=["Youth", "Adult", "Middle", "Senior"]
)

# Interaction features
df["income_x_education"] = df["income"] * df["education_years"]
```

## Train/Test/Validation Split Strategies

### Standard split:

```python
# 80/20 for simple cases
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# With stratification (classification with imbalance)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)
```

### Train/Val/Test split:

```python
# 70/15/15 for model selection workflow
X train, X_temp, y_train, y_temp = train_test_split(
    X, y, test_size=0.3, random_state=42, stratify=y
)
X_val, X_test, y_val, y_test = train_test_split(
    X_temp, y_temp, test_size=0.5, random_state=42, stratify=y_temp
)
# Results in ~70/15/15 split
```

### Time series split (NEVER use random split for time series!):

```python
from sklearn.model_selection import TimeSeriesSplit

# Chronological split
split_idx = int(len(df) * 0.8)
train_df = df[:split_idx]
test_df = df[split_idx:]

# Or use TimeSeriesSplit for CV
tscv = TimeSeriesSplit(n_splits=5)
for train_idx, val_idx in tscv.split(X):
    X_tr, X_val = X[train_idx], X[val_idx]
```

## Cross-Validation Patterns

```python
from sklearn.model_selection import (
    cross_val_score,
    cross_validate,
   KFold,
    StratifiedKFold,
    RepeatedKFold,
)

# Simple CV with multiple metrics
scoring = ["accuracy", "precision", "recall", "f1", "roc_auc"]
cv_results = cross_validate(
    model, X_train, y_train,
    cv=StratifiedKFold(n_splits=5, shuffle=True, random_state=42),
    scoring=scoring,
    return_train_score=True,
)

for metric in scoring:
    test_scores = cv_results[f"test_{metric}"]
    train_scores = cv_results[f"train_{metric}"]
    print(f"{metric}: {test_scores.mean():.4f} ± {test_scores.std():.4f}")
    if (train_scores.mean() - test_scores.mean()) > 0.1:
        print(f"  ⚠️  Possible overfitting detected!")
```

## Data Validation Assertions

```python
def validate_dataset(X, y, task="classification"):
    """Validate dataset health before modeling."""
    # Shape check
    assert X.shape[0] == y.shape[0], "X and y have different sample counts"

    # No NaN in features
    assert not X.isnull().any().any(), "X contains missing values"

    # No extreme values
    assert not np.isinf(X.select_dtypes(include=[np.number])).any().any(), \
        "X contains infinite values"

    # Enough samples (rule of thumb)
    assert X.shape[0] > 100, "Dataset too small for reliable modeling"

    # Classification checks
    if task == "classification":
        n_classes = y.nunique()
        assert 2 <= n_classes <= 10, f"Expected 2-10 classes, got {n_classes}"

        class_balance = y.value_counts(normalize=True).min()
        if class_balance < 0.1:
            print("⚠️  Class imbalance detected - consider SMOTE or class weights")

    # Print validation summary
    print(f"✓ Dataset validated: {X.shape[0]} samples, {X.shape[1]} features")
```

## Common Dataset Issues & Fixes

| Issue                 | Detection                      | Fix                                |
| --------------------- | ------------------------------ | ---------------------------------- |
| Outliers              | `df.describe()` extreme values | Clip, transform, or remove         |
| Class imbalance       | `value_counts(normalize=True)` | `class_weight='balanced'`, SMOTE   |
| Multicollinearity     | `df.corr()` > 0.9              | Drop one of correlated features    |
| Cardinality explosion | `nunique()` very high          | Target encoding or feature hashing |
| Data leakage          | Target info in features        | Remove leakage columns             |
| Skewness              | Distribution plots             | Box-Cox or log transform           |

## Saving Processed Data for Later Use

```python
# Save cleaned dataset for reproducibility
df.to_csv("data/processed_train.csv", index=False)

# Or save sklearn pipeline artifacts
import joblib
joblib.dump(scaler, "models/scaler.pkl")
joblib.dump(encoder, "models/encoder.pkl")

# Load later
scaler = joblib.load("models/scaler.pkl")
```

## Quick Reference: Common Datasets by Difficulty

### Beginner:

- Iris (classification, 150 samples)
- Boston Housing (regression, 506 samples)
- Wine Quality (classification, 1599 samples)
- Titanic (classification + messy data, 891 samples)

### Intermediate:

- California Housing (regression, 20640 samples)
- MNIST (image classification, 70000 samples)
- IMDB Reviews (NLP, 50000 samples)
- Customer Churn (classification, 10000+ samples)

### Advanced:

- MovieLens (recommendations, 100K+ ratings)
- Kaggle competitions datasets
- Custom scraped/API datasets
- Time series (stock prices, weather)
