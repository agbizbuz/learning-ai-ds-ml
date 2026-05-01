---
name: repository-conventions
description: >
  Follow repository conventions for file naming (British spellings), markdown formatting,
  documentation style, commit messages, and overall consistency.
---

# Repository Conventions

## File Naming Rules (Non-negotiable)

Always use underscores and British English in names:

| Correct              | Wrong                |
| -------------------- | -------------------- |
| `LEARNING_PATH.md`   | `LEARNING-PATH.md`   |
| `PROJECT_ROADMAP.md` | `PROJECT-ROADMAP.md` |
| `QUICK_START.md`     | `QUICK-START.md`     |
| `SUMMARY.md`         | `SUMMARY.md`         |

### Key rules:

- Always use `README.md` - never `readme` or `ReadMe`
- Python files: `snake_case` (e.g. `random_forest.ipynb`)
- Markdown files: `SCREAMING_SNAKE_CASE` for docs (e.g. `LEARNING_PATH.md`)
- Directories: `lowercase_with_underscores`

## Markdown Formatting

### Headers hierarchy:

```markdown
# Title - Document title only

## Section - Major topics

### Subsection - Details within sections

#### Item - Specific examples/projects

##### Detail - Fine-grained notes
```

### Lists and Links:

- Use `-` for unordered lists (never `*`)
- Use `1.` for ordered lists
- Format links as: `- [Title](URL) - Brief note`

### Emphasis and inline code:

- `**bold**` for emphasis (not `__bold__`)
- `_italic_` sparingly
- `` `backticks` `` for code, filenames, variables

### Tables:

```
| Header A | Header B |
|----------|----------|
| Data     | Data     |
```

### Callouts with blockquotes:

```markdown
> 💡 **Tip**: Helpful advice
> ⚠️ **Warning**: Important caveat
> 📝 **Note**: Additional context
```

### Emoji usage:

- Use purposefully in headers/section titles
- Don't clutter body text
- Preferred: 🚀 💻 📚 🎯 🛠️ 📊 🎓 ✅ ❌ 💡 ⚠️ 📝

## Code Block Rules

### Always specify language:

`````markdown
```python
import numpy as np
```

```bash
pip install scikit-learn
```

```toml
[project]
name = "learning-ai-ds-ml"
```
`````

### Indentation:

- Python code: 4 spaces (standard)
- Markdown nesting: 2 spaces
- Never mix tabs and spaces

### Strings:

- Use double quotes `"` in Python examples
- Use single quotes `'` for dict keys if needed

## Documentation Style Guide

### README.md structure:

1. **TL;DR first** - one-paragraph project overview
2. **Prerequisites** - Python version, OS, tools needed
3. **Quick Start** - 5-minute setup instructions
4. **Repository tree** - show folder structure
5. **Learning paths** - link to LEARNING_PATH.md
6. **Projects** - link to PROJECT_ROADMAP.md
7. **Contributing** - how others can help
8. **License** - if applicable

### Notebook cell comments:

```python
"""Brief description of what this cell does."""
# More detailed explanation if logic is non-obvious
```

### Function/variable naming:

- Functions: `snake_case`
- Classes: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Private helpers: `_leading_underscore`

## Git and Commit Conventions

### Branch names:

```
feature/add-random-forest-notebook
fix/fix-broken-dataset-link
docs/update-learning-path-phase-2
```

### Commit message format:

```
type: short description

Optional longer explanation if needed.

Types:
- feat: New content/notebook
- fix: Bug fix or broken link repair
- docs: Documentation updates
- style: Formatting (no logic changes)
- refactor: Code restructure in notebooks
- test: Adding validation tests
- chore: Maintenance, deps, config
```

### Examples:

```
feat: add stacking ensemble notebook with tutorial
fix: update broken UCI dataset URL in PCA notebook
docs: revise learning path phase three prerequisites
style: format all notebooks using ruff
```

## File Organization

### Root directory contains only:

- Documentation: `README.md`, `LEARNING_PATH.md`, `PROJECT_ROADMAP.md`
- Quick guides: `QUICK_START.md`, `SUMMARY.md`
- Config: `.gitignore`, `pyproject.toml`
- Skills: `.skills/` directory

### Algorithm notebooks go in:

- `simplilearn_ml_python/` - traditional ML algorithms
- `Course_Work/` - advanced topics and deep learning

### Avoid at all costs:

- Orphaned notebooks in root
- Mixing notebooks and docs
- Duplicate content across files
- Inconsistent casing in filenames

### Naming patterns:

```
simplilearn_ml_python/
├── random_forest.ipynb
├── k_means_cluster.ipynb
├── support_vector_machine.ipynb

Course_Work/
├── NLP_Text.ipynb
├── Transfer_Learning.ipynb
└── ...
```

## Validation Checklist

Before committing any changes:

### Notebooks:

- [ ] All cells run top-to-bottom without errors
- [ ] No hidden state or stale imports
- [ ] Dataset URLs download successfully
- [ ] Output cells show expected content
- [ ] Code passes `ruff check`

### Documentation:

- [ ] British English spellings used
- [ ] Underscores, never hyphens in filenames
- [ ] All code blocks have language specifiers
- [ ] Cross-references/links still valid
- [ ] Markdown renders correctly

### Git hygiene:

- [ ] Commit message follows convention
- [ ] No secrets/credentials in code
- [ ] All URLs use HTTPS
- [ ] Large outputs cleared before commit
- [ ] `ruff check` passes clean
