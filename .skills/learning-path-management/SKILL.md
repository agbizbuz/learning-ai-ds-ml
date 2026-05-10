---
name: learning-path-management
description: >
  Manage the structured learning paths, documentation hierarchy, project roadmaps,
  and resource organization. Covers LEARNING_PATH.md, PROJECT_ROADMAP.md,
  QUICK_START.md, and the resources curriculum structure.
---

# Learning Path Management

## Repository Documentation Structure

```
learning-ai-ds-ml/
├── README.md                 # Project overview & entry point
├── LEARNING_PATH.md          # Phase-by-phase curriculum
├── PROJECT_ROADMAP.md        # Hands-on project catalog
├── QUICK_START.md            # Immediate setup guide
├── SUMMARY.md                # Timeline & progression tracker
├── resources/
│   ├── README.md             # Resource index
│   ├── beginner/             # Foundational materials
│   ├── intermediate/         # Core ML techniques
│   └── advanced/             # Research & production
├── simplilearn_ml_python/    # Algorithm notebooks
│   ├── random_forest.ipynb
│   ├── k_means_cluster.ipynb
│   ├── polynomial_regression.ipynb
│   ├── support_vector_machine.ipynb
│   ├── naive_bayes.ipynb
│   ├── pca.ipynb
│   ├── svd.ipynb
│   ├── boosting.ipynb
│   ├── bagging.ipynb
│   ├── stacking.ipynb
│   └── ...
├── LLM_Course/              # Advanced/DL notebooks
│   ├── NLP_Text.ipynb
│   ├── RNN.ipynb
│   ├── LSTM.ipynb
│   ├── CNN.ipynb
│   ├── GAN.ipynb
│   ├── VAE.ipynb
│   ├── Transfer_Learning.ipynb
│   ├── RL.ipynb
│   └── ...
└── .skills/                 # Agent skill definitions
```

## LEARNING_PATH.md Structure Rules

### Phase Format:

```markdown
## Phase X: Phase Title

**Level**: Beginner | Intermediate | Advanced
**Duration**: 2-3 weeks
**Prerequisites**: Phase X-1

### Learning Objectives:

- Objective 1 (specific, measurable)
- Objective 2
- Objective 3

### Core Topics:

- **Topic Area 1**: Brief description
  - Subtopic A
  - Subtopic B
- **Topic Area 2**: Description
  - Subtopic C

### Hands-on Notebooks:

- [Notebook Name](../path/to/notebook.ipynb) - Brief description
- [Notebook Name](../path/to/notebook.ipynb) - Description

### Recommended Resources:

- [Resource Title](URL) - What it covers
- [Resource Title](URL) - Topic

### 🎯 Milestone Project:

Project title - What you'll build, learning outcomes

### ✅ Readiness Check:

- [ ] Can you explain [concept]?
- [ ] Have you completed [notebook]?
- [ ] Can you implement [technique] without help?
```

### Phase Progression Rules:

1. **Each phase must build on previous** - no teleporting forward
2. **Include prerequisite check** at top of phase
3. **End with readiness checklist** - self-assessment
4. **Link actual notebook paths** - broken links hurt learning
5. **Mix theory + practice** - every phase has both

## Adding New Notebooks

### Decision workflow for where to put new material:

```
Is it a core ML algorithm?
├── Yes → simplilearn_ml_python/
│         ├── Beginner: Logistic Regression, Decision Trees, KNN
│         ├── Intermediate: Random Forest, SVM, Boosting
│         └── Advanced: Stacking, Stochastic Gradient Descent
│
└── No → Is it deep learning / advanced?
         ├── Yes → LLM_Course/
         │         ├── Neural networks (RNN, CNN, LSTM)
         │         ├── Generative models (GAN, VAE)
         │         ├── Transfer learning
         │         └── Reinforcement learning
         │
         └── No → Where does it fit?
                  ├── Theory/Reference → resources/
                  ├── Project/Portfolio → document in PROJECT_ROADMAP.md
                  └── Utility/Helper → potential lib/ or ignore
```

### Naming conventions:

| Category   | Pattern                    | Example                  |
| ---------- | -------------------------- | ------------------------ |
| Algorithms | `{algorithm_name}.ipynb`   | `random_forest.ipynb`    |
| Topics     | `{topic}_{specific}.ipynb` | `NLP_Text.ipynb`         |
| Projects   | `{project}_{type}.ipynb`   | `Churn_Prediction.ipynb` |
| Utilities  | `utils_{function}.py`      | `utils_plotting.py`      |

## PROJECT_ROADMAP.md Structure

### Project Entry Format:

```markdown
#### Project: [Project Name]

**Difficulty**: ⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐
**Skills Used**: Algorithm 1, Technique 2
**Time**: X-Y hours
**Dataset**: Name/URL/Source

##### Description:

What this project builds and why it matters.

##### What you'll build:

1. Step 1
2. Step 2
3. Step 3

##### Learning outcomes:

- Skill 1
- Skill 2
- Skill 3

##### Resources:

- [Link](URL)
```

### Project progression principles:

1. **Start simple, add complexity** - scaffold learning
2. **Real datasets** - Kaggle/UCI, not contrived examples
3. **Full pipeline exposure** - loading → preprocessing → modeling → evaluation
4. **Iterative improvement** - suggest "next steps" for each project
5. **Portfolio-ready** - projects should be GitHub-worthy

## QUICK_START.md Guidelines

### Must include:

1. **TL;DR setup** in < 10 lines of terminal commands
2. **Verification step** - how to know it worked
3. **First notebook to run** - clear starting point
4. **Common issues** + quick fixes
5. **What to expect** - manage learner expectations

### Keep it actionable:

````markdown
## 🚀 Five-Minute Setup

```bash
# These commands work on Mac/Linux. Windows: use WSL or Git Bash.
# 1. Get the repo
git clone https://github.com/agbizbuz/learning-ai-ds-ml.git
cd learning-ai-ds-ml

# 2. Create environment
brew install uv  # or pipx install uv on Linux
uv venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# 3. Install dependencies
uv pip install scikit-learn pandas numpy matplotlib seaborn jupyter

# 4. Start Jupyter
jupyter notebook
```
````

## ✅ Verify it Works

Open your browser → Navigate to `simplilearn_ml_python/logistic_regression.ipynb`
Run the first code cell. If you see output, you're ready! 🎉

````

## SUMMARY.md Maintenance

### Timeline Tracking:
```markdown
| Phase | Topics | Time Estimate | Status |
|-------|--------|------|----|
| Phase 5 | NLP, Transfer Learning | 3-4 weeks | 🟡 In Progress |
````

### Color coding status:

- 🟢 Completed
- 🟡 In Progress
- 🔴 Not Started
- ⚪ Optional

### Keep it realistic:

- Base estimates on actual time to complete, not just "learn"
- Acknowledge that review/repetition takes time
- Suggest weekly time commitments, not just total hours

## Resource Curation Principles

### Quality signals:

1. **Recency** - prefer content < 3 years old for frameworks/tools
2. **Author credibility** - university, industry expert, well-known educator
3. **Hands-on component** - video alone < video + notebooks
4. **Free or freely accessible** - prioritize open resources
5. **Multiple formats** - text + video + code coverage for different learning styles

### Resource linking format:

```markdown
- [Resource Title](URL) - Quick description + why it's useful
```

Avoid:

- Dead links
- Paywalled content without free alternatives
- Outdated tutorials (TensorFlow 1.x etc.)
- Overly theoretical without examples

## Updating Learning Path

### When adding new material:

1. **Determine difficulty level** - use readiness check criteria
2. **Place in correct phase** or create phase if gap exists
3. **Update prerequisites** - does this require prior learning?
4. **Link to resources** - add curated resources for new topics
5. **Add to roadmap** if project-worthy
6. **Update SUMMARY.md** timeline if schedule changes

### Review cadence:

- **Monthly**: Check for broken links, outdated resources
- **Quarterly**: Assess phase balance, add new topics if emerging
- **As needed**: Fix issues, respond to common learner questions

## Educational Sequencing Tips

### The "Three Passes" Principle:

1. **First pass**: Conceptual understanding (video/read)
2. **Second pass**: Guided practice (this repo's notebooks)
3. **Third pass**: Independent application (projects)

### Spaced repetition integration:

Suggest learners revisit earlier notebooks after completing later ones:

```markdown
> 💡 **Spaced Repetition Tip**: After completing Phase 3, revisit
> `logistic_regression.ipynb - you'll understand the math much better now!
```

### Prerequisite gates:

Make prerequisites explicit:

```markdown
### Prerequisites for this Phase:

- Completed Phase 2 readiness check
- Understand: [concept 1], [concept 2], [concept 3]
- Can implement: [technique 1] without tutorial
```
