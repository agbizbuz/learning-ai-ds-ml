# AGENTS.md

## 📚 Repository Overview

This repository is an AI/ML learning path with structured documentation and code examples organized by difficulty level (Beginner → Intermediate → Advanced).

### Key Files and Structure

1. **README.md** - Main project overview
2. **LEARNING_PATH.md** - Structured learning path by difficulty level
3. **PROJECT_ROADMAP.md** - Detailed project ideas with datasets and steps
4. **QUICK_START.md** - Quick installation and setup guide
5. **SUMMARY.md** - Complete learning path overview
6. **resources/** - Curated learning materials categorized by difficulty
7. **simplilearn_ml_python/** - Jupyter notebooks with ML algorithm implementations
8. **Course_Work/** - Advanced topics including NLP embeddings
9. **reference/** - Theoretical materials (PDF lecture notes)

## 🐍 Python Environment

### Package Dependencies

All packages are standard Python ML ecosystem. No package.json or pip requirements file provided. Common dependencies include:
- numpy
- pandas
- matplotlib
- scikit-learn
- jupyter
- seaborn
- tensorflow (for deep learning notebooks)

### Environment Setup

```bash
# Create virtual environment
python -m venv ml_env
source ml_env/bin/activate  # On Windows: ml_env\Scripts\activate

# Install essential packages
pip install numpy pandas matplotlib scikit-learn jupyter seaborn seaborn tensorflow
```

## 📘 Learning Paths

### Beginner (2-4 weeks)
- Start with **QUICK_START.md** for immediate setup
- Focus on Python fundamentals and basic ML algorithms
- Use **resources/beginner/** for theoretical materials

### Intermediate (4-6 weeks)
- Implement projects from **PROJECT_ROADMAP.md**
- Study **simplilearn_ml_python/** notebooks for algorithm implementations
- Use **resources/intermediate/** for advanced techniques

### Advanced (6-8 weeks)
- Explore **Course_Work/** for deep learning and NLP
- Use **resources/advanced/** for research papers
- Build production-ready systems

## 🚀 Project Implementation

### Jupyter Notebook Workflow

Many ML implementations are in Jupyter notebooks in the **simplilearn_ml_python/** directory. Common notebooks include:
- `random_forest.ipynb` - Random Forest classification
- `k_means_cluster.ipynb` - K-Means clustering
- `pca.ipynb` - Principal Component Analysis
- `naive_bayes.ipynb` - Naive Bayes classifier
- `polynomial_regression.ipynb` - Polynomial regression
- `svd.ipynb` - Singular Value Decomposition
- `ensemble_wt_keras_and_sklearn.ipynb` - Ensemble methods

### Project-Based Learning

1. **Beginner**: Start with Iris classification, house price prediction, customer segmentation
2. **Intermediate**: Spam detection, stock prediction, MNIST image recognition
3. **Advanced**: Chatbot, recommendation engine, autonomous vehicle simulation

## 📋 Important Notes

### File Naming Convention

The repository uses British spellings consistently:
- **PROJECT_ROADMAP.md** (not PROJECT-ROADMAP.md)
- **LEARNING_PATH.md** (not LEARNING-PATH.md)
- **QUICK_START.md** (not QUICK-START.md)

### Dataset Locations

Most datasets are referenced by URL in the documentation (Kaggle, UCI ML Repository, Google datasets). No datasets are included in the repository itself.

## 🔧 Development Tips

### No Build/Test Scripts

This is an educational repository with documentation and notebooks. There are:
- No unit tests
- No build pipeline
- No linting configuration
- No CI/CD workflows

### No Framework Quirks

Standard Python ML ecosystem with no custom toolchain or codegen.

### Reproducibility

All notebooks should be run in clean Jupyter environments. No special execution order required.

## 📚 Additional Resources

For more detailed learning paths and project ideas, see:
- **SUMMARY.md** - Comprehensive overview with timeline
- **resources/README.md** - Curated resource guide
- **LEARNING_PATH.md** - Structured phase-by-phase learning guide
