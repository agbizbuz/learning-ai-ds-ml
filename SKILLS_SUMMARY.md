# Skills Summary

## Overview

This repository uses a structured skill system to guide AI agents in maintaining and enhancing educational machine learning notebooks. The `.skills/` directory contains 9 specialized skill files that cover the complete ML workflow from environment setup to model deployment visualization.

## Skill Architecture

```
.skills/
├── ml-pipeline-development.md      # scikit-learn ML workflows
├── notebook-creation.md            # Pedagogical notebook structure
├── ml-visualization.md             # matplotlib/seaborn plotting
├── colab-notebook-development.md   # Google Colab specifics
├── uv-environment-management.md    # Python dependency manager
├── ruff-linting.md                 # Code quality enforcement
├── dataset-handling.md             # Data loading & preprocessing
├── learning-path-management.md     # Curriculum documentation
└── repository-conventions.md       # Naming & formatting standards
```

## Skill Categories

### 1. Core ML Development (3 skills)

| Skill                     | Purpose                     | Key Capabilities                                                                                           |
| ------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `ml-pipeline-development` | Model building & evaluation | Supervised/unsupervised learning, CV, hyperparameter tuning, ensemble methods, scikit-learn best practices |
| `dataset-handling`        | Data preparation            | Loading (URL/Kaggle/sklearn), EDA, missing values, encoding, scaling, train/test splits                    |
| `ml-visualization`        | Plotting & interpretation   | EDA charts, confusion matrices, ROC/PR curves, learning curves, decision boundaries                        |

### 2. Notebook Craft (2 skills)

| Skill                        | Purpose                       | Key Capabilities                                                             |
| ---------------------------- | ----------------------------- | ---------------------------------------------------------------------------- |
| `notebook-creation`          | Educational content structure | Cell organisation, teaching patterns, progression templates, code blocks     |
| `colab-notebook-development` | Colab optimization            | GPU runtime setup, drive mounting, Colab-specific UI tricks, notebook badges |

### 3. Development Tooling (2 skills)

| Skill                       | Purpose                   | Key Capabilities                                                           |
| --------------------------- | ------------------------- | -------------------------------------------------------------------------- |
| `uv-environment-management` | Python environment & deps | `uv` package manager, virtual environments, `pyproject.toml` configuration |
| `ruff-linting`              | Code quality              | Linting rules, notebook fixing, CI/CD integration, config setup            |

### 4. Repository Governance (2 skills)

| Skill                      | Purpose           | Key Capabilities                                                                |
| -------------------------- | ----------------- | ------------------------------------------------------------------------------- |
| `learning-path-management` | Curriculum docs   | LEARNING_PATH.md, PROJECT_ROADMAP.md, educational sequencing, resource curation |
| `repository-conventions`   | Consistency rules | British English filenames, markdown formatting, commit messages, Git standards  |

## How Skills Work Together

### Typical ML Education Workflow:

1. **Setup**: `uv-environment-management` → create dev environment
2. **Data**: `dataset-handling` → load, explore, preprocess
3. **Model**: `ml-pipeline-development` → train, evaluate, tune
4. **Visualize**: `ml-visualization` → plot results & metrics
5. **Document**: `notebook-creation` + `learning-path-management` → pedagogical structure
6. **Quality**: `ruff-linting` → enforce code standards
7. **Deploy**: `colab-notebook-development` → Colab optimization & badges

### Skill Invocation Example:

When creating a new Random Forest notebook, the AI agent will:

- Reference `ml-pipeline-development` for algorithm implementation
- Use `dataset-handling` for data preparation patterns
- Apply `ml-visualization` for feature importance plots
- Follow `notebook-creation` for cell structure
- Enforce `repository-conventions` for naming/formatting
- Run `ruff-linting` for code quality
- Configure with `uv-environment-management` if deps needed
- Update `learning-path-management` docs accordingly

## Design Principles

Each skill was built with these constraints:

- **Valid frontmatter**: `name` + `description` YAML headers
- **Repository-specific**: Tailored to this educational ML repo, not generic ML
- **Comprehensive examples**: Copy-paste ready code patterns
- **Clear decision trees**: When to use what, troubleshooting flows
- **Educational focus**: Teaching-first, not production-first

## Coverage Matrix

| Phase                | Covered Skills                                                  |
| -------------------- | --------------------------------------------------------------- |
| 📦 Setup & Config    | uv-environment-management, ruff-linting, repository-conventions |
| 📊 Data Pipeline     | dataset-handling, ml-visualization                              |
| 🤖 Model Development | ml-pipeline-development, ml-visualization                       |
| 📝 Documentation     | notebook-creation, learning-path-management                     |
| 🚀 Deployment        | colab-notebook-development                                      |

## Maintenance Notes

- Skills use consistent YAML frontmatter format
- Markdown follows repository conventions (underscores, British English)
- Code examples are tested and ready for use
- Cross-references between skills enable holistic workflow guidance
- Total: 2,561 lines of skill documentation

## Quick Reference

```python
# When agent needs help, invoke relevant skill:
# "Use ml-pipeline-development skill for Random Forest implementation"
# "Apply dataset-handling skill for missing value strategy"
# "Reference ml-visualization skill for ROC curve plotting"
# "Follow repository-conventions for new notebook naming"
```

**Created**: 2025-05-01
**Version**: 1.0
**Skill Count**: 9
**Total Lines**: 2,561
