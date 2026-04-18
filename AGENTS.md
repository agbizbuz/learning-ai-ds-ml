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

## 🧠 Karpathy's LLM Skills Advice

Based on Andrej Karpathy's approach to training neural networks, here are key principles for working with LLMs:

1. **Start Simple**: Begin with a basic model (linear classifier, tiny ConvNet) and gradually increase complexity
2. **Data Understanding**: Spend significant time (hours) examining datasets thoroughly - look for patterns, imbalances, biases
3. **Build End-to-End Pipeline**: Set up full training + evaluation infrastructure before adding complexity
4. **Debug Step-by-Step**: 
   - Fix random seed for reproducibility
   - Disable data augmentation initially
   - Verify loss at initialization 
   - Overfit single batch first
   - Visualize data just before network input
5. **Use Adam with 3e-4 learning rate**: Especially in early stages
6. **Complexify One-at-a-Time**: Add features or data sources individually to monitor performance impact
7. **Don't Be a Hero**: Use simple, proven architectures from related papers as a starting point
8. **Regularization Strategy**: 
   - Get more data first (better than any regularization)
   - Use data augmentation
   - Apply early stopping
   - Use weight decay
9. **Hyperparameter Tuning**: Use random search instead of grid search (neural nets are more sensitive to some parameters than others)
10. **Patience & Attention to Detail**: Deep learning requires thoroughness and careful observation, not fast approaches

As Karpathy emphasizes: "Neural net training is a leaky abstraction" and "fails silently", so approach with methodical, cautious methodology.

## 💡 Using AI Assistants Effectively

Based on Karpathy's philosophy about technology adoption and problem-solving:

- **Leverage the power of broad quasi-expertise**: Use AI assistants like Claude to expand your capabilities across domains you're not experts in
- **Start with the basics**: Before complex tasks, use AI to draft, explore, and prototype solutions
- **Treat AI as a multiplier, not a replacement**: Use it to enhance your own work rather than outsource it completely
- **Maintain critical evaluation**: Always validate AI outputs, especially for important tasks - don't rely blindly on AI responses
- **Use iterative refinement**: Ask for improvements and adjustments to AI outputs rather than expecting perfect first attempts
- **Focus on the "what" rather than the "how"**: Let AI handle implementation details while you focus on conceptual and strategic decisions
