---
name: ml-pipeline-development
description: >
  Write and review ML pipeline code for this educational repository. Covers scikit-learn
  workflows, model evaluation, data preprocessing, hyperparameter tuning, and proper use
  of numpy/pandas/tensorflow. Always produce ruff-clean code with educational commentary.
---

# ML Pipeline Development

## Core Principles

1. **Always follow proper train/test split** — prevent data leakage
2. **Use scikit-learn pipelines** when appropriate — they're educational best practice
3. **Include proper metrics** — never just accuracy; use task-appropriate metrics
4. **Always set random_state** — reproducibility is critical for educational code
5. **Use ruff-compliant code** — see `ruff-linting` skill for rules

## Standard ML Workflow Template

### Complete supervised learning pipeline:

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import (
    accuracy_score, precision_score, recall_score, f1_score,
    mean_squared_error, mean_absolute_error, r2_score,
    confusion_matrix, classification_report,
)

# ============================================================
# 1. Load and Explore Data
# ============================================================
df = pd.read_csv("data.csv")
print(f"Dataset shape: {df.shape}")
print(f"Missing values:\n{df.isnull().sum()}")

# ============================================================
# 2. Preprocess Data
# ============================================================
# Handle missing values
df = df.dropna()  # or df.fillna(strategy)

# Encode categorical variables if needed
# df = pd.get_dummies(df, columns=['categorical_col'])

# Separate features and target
X = df.drop("target_column", axis=1)
y = df["target_column"]

# Split data (CRITICAL: do this BEFORE scaling to avoid data leakage)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y  # stratify for classification
)

# Scale features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)  # fit ONLY on training
X_test_scaled = scaler.transform(X_test)  # transform test with training stats

# ============================================================
# 3. Train Model
# ============================================================
from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier(
    n_estimators=100,
    max_depth=10,
    random_state=42,
    n_jobs=-1,  # use all cores
)
model.fit(X_train_scaled, y_train)

# ============================================================
# 4. Evaluate Model
# ============================================================
y_pred = model.predict(X_test_scaled)

print("Classification Report:")
print(classification_report(y_test, y_pred))
print(f"R² Score: {r2_score(y_test, y_pred):.4f}")

# Cross-validation for robust evaluation
cv_scores = cross_val_score(model, X_train, y_train, cv=5)
print(f"CV Score: {cv_scores.mean():.4f} (+/- {cv_scores.std() * 2:.4f})")

# ============================================================
# 5. Feature Importance (for tree-based models)
# ============================================================
importances = pd.Series(
    model.feature_importances_, index=X.columns
).sort_values(ascending=False)
```

## Dataset Loading Patterns

### Prefer URL-based data loading for reproducibility:

```python
# Pattern 1: Direct CSV from URL
df = pd.read_csv("https://raw.githubusercontent.com/.../data.csv")

# Pattern 2: sklearn built-in datasets
from sklearn.datasets import load_iris, load_boston, fetch_california_housing
data = load_iris()
df = pd.DataFrame(data.data, columns=data.feature_names)
df["target"] = data.target

# Pattern 3: Kaggle datasets with download instruction
# !pip install kaggle
# !kaggle datasets download -d <dataset> -p /content/
df = pd.read_csv("/content/dataset.csv")
```

## Model Selection Guidelines by Task

| Task Type                | Recommended Models                    | Key Metrics                      |
| ------------------------ | ------------------------------------- | -------------------------------- |
| Regression               | Linear, Ridge, Lasso, RF Regressor    | RMSE, MAE, R²                    |
| Classification           | Logistic, RF Classifier, SVM, XGBoost | Precision, Recall, F1, AUC       |
| Clustering               | K-Means, DBSCAN, Hierarchical         | Silhouette Score, Davies-Bouldin |
| Dimensionality Reduction | PCA, SVD, t-SNE                       | Explained Variance Ratio         |
| Time Series              | ARIMA, LSTM, Prophet                  | MAE, RMSE, Directional Accuracy  |
| NLP                      | TF-IDF + Naive Bayes, BERT            | Perplexity, BLEU, Accuracy       |

## Hyperparameter Tuning (Educational Pattern):

```python
from sklearn.model_selection import GridSearchCV, RandomizedSearchCV

# Grid Search (exhaustive - good for teaching)
param_grid = {
    "n_estimators": [50, 100, 200],
    "max_depth": [5, 10, 15, None],
    "min_samples_split": [2, 5, 10],
}

grid_search = GridSearchCV(
    RandomForestClassifier(random_state=42),
    param_grid,
    cv=5,
    scoring="f1",
    n_jobs=-1,
    verbose=1,
)
grid_search.fit(X_train, y_train)

print(f"Best Parameters: {grid_search.best_params_}")
print(f"Best CV Score: {grid_search.best_score_:.4f}")
```

## Scikit-Learn Pipeline Pattern (Best Practice):

```python
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.impute import SimpleImputer

# Define preprocessing steps
numeric_features = ["age", "salary", "spending_score"]
numeric_transformer = Pipeline(steps=[
    ("imputer", SimpleImputer(strategy="median")),
    ("scaler", StandardScaler()),
])

categorical_features = ["gender"]
categorical_transformer = Pipeline(steps=[
    ("imputer", SimpleImputer(strategy="most_frequent")),
    ("encoder", OneHotEncoder(handle_unknown="ignore")),
])

# Combine preprocessing
preprocessor = ColumnTransformer(
    transformers=[
        ("num", numeric_transformer, numeric_features),
        ("cat", categorical_transformer, categorical_features),
    ]
)

# Full pipeline
full_pipeline = Pipeline(steps=[
    ("preprocessor", preprocessor),
    ("classifier", RandomForestClassifier(random_state=42)),
])

# Train with pipeline (prevents data leakage!)
full_pipeline.fit(X_train, y_train)
y_pred = full_pipeline.predict(X_test)
```

## Visualization Best Practices

```python
# Consistent style setup
plt.style.use("seaborn-v0_8-darkgrid")
plt.rcParams["figure.figsize"] = (12, 6)
plt.rcParams["font.size"] = 12

# Confusion matrix visualization
cm = confusion_matrix(y_test, y_pred)
sns.heatmap(cm, annot=True, fmt="d", cmap="Blues")
plt.title("Confusion Matrix")
plt.ylabel("Actual")
plt.xlabel("Predicted")
plt.show()

# Feature importance bar chart
top_features = importances.head(10)
top_features.plot(kind="barh", color="steelblue")
plt.title("Top 10 Feature Importances")
plt.tight_layout()
plt.show()
```

## Deep Learning Patterns (for Course_Work notebook)

```python
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, LSTM
from tensorflow.keras.callbacks import EarlyStopping

# Typical model structure
model = Sequential([
    Dense(128, activation="relu", input_shape=(input_dim,)),
    Dropout(0.3),
    Dense(64, activation="relu"),
    Dropout(0.3),
    Dense(32, activation="relu"),
    Dense(output_dim, activation="softmax"),  # or 'sigmoid' for binary
])

model.compile(
    optimizer="adam",
    loss="categorical_crossentropy",  # or 'binary_crossentropy' or 'mse'
    metrics=["accuracy"],
)

# Train with early stopping
early_stop = EarlyStopping(
    monitor="val_loss",
    patience=10,
    restore_best_weights=True,
)

history = model.fit(
    X_train, y_train,
    validation_split=0.2,
    epochs=100,
    batch_size=32,
    callbacks=[early_stop],
    verbose=1,
)

# Plot training curves
plt.plot(history.history["loss"], label="Training Loss")
plt.plot(history.history["val_loss"], label="Validation Loss")
plt.legend()
plt.show()
```

## Common Anti-Patterns to Avoid

1. **Data leakage** — fitting scaler on entire dataset before splitting
2. **No random_state** — results vary every run, confusing for learners
3. **Missing stratification** — imbalanced classes need `stratify=y` in split
4. **Only using accuracy** — always include precision/recall/F1
5. **No cross-validation** — single split is unreliable
6. **Unbounded models** — always set max_depth or regularize
7. **Silent failures** — check for NaN/inf in predictions

## Testing ML Code

For any ML code written, include validation:

```python
# Assert shapes match
assert X_train.shape[0] == y_train.shape[0]
assert X_test.shape[0] == y_test.shape[0]

# Assert predictions are valid
assert not np.any(np.isnan(y_pred)), "Predictions contain NaN"
assert np.all(y_pred >= 0) and np.all(y_pred <= 1), "Invalid probability range"
```
