# =============================================================================
# Makefile — Educational ML/AI Learning Path
# =============================================================================
# Usage: make <target>
# =============================================================================

PYTHON := python3
UV := uv
SHELL := /bin/bash

.PHONY: help setup setup-llm setup-dev lint lint-fix test-notebooks clean

help:
	@echo "Available targets:"
	@echo "  setup         — Create virtual environment with core ML dependencies"
	@echo "  setup-llm     — Also install LLM / modern AI dependencies (GPU recommended)"
	@echo "  setup-dev     — Also install development tools (ruff, nbmake, papermill)"
	@echo "  lint          — Check notebook code quality with ruff"
	@echo "  lint-fix      — Auto-fix linting issues in notebooks"
	@echo "  test-notebooks — Run all notebooks with nbmake to verify they execute"
	@echo "  clean         — Remove virtual environment and cache files"

# -- Environment Setup ----------------------------------------------------------

setup:
	@echo "Setting up core ML environment with uv..."
	$(UV) sync
	@echo ""
	@echo "✅ Core ML dependencies installed!"
	@echo "To activate: source .venv/bin/activate (Linux/Mac) or .venv\\Scripts\\activate (Windows)"
	@echo ""
	@echo "Need LLM deps too? Run: make setup-llm"
	@echo "Need dev tools?      Run: make setup-dev"

setup-llm:
	@echo "Adding LLM / modern AI dependencies..."
	$(UV) sync --extra llm
	@echo ""
	@echo "✅ LLM dependencies installed (torch, transformers, langchain, etc.)"

setup-dev:
	@echo "Adding development tools..."
	$(UV) sync --extra dev
	@echo ""
	@echo "✅ Dev tools installed (ruff, nbmake, papermill)"

# -- Linting -------------------------------------------------------------------

lint:
	@echo "Running ruff on notebooks..."
	$(UV) run ruff check simplilearn_ml_python/ LLM_Course/ --output-format=concise 2>/dev/null || \
	$(PYTHON) -m ruff check simplilearn_ml_python/ LLM_Course/ --output-format=concise

lint-fix:
	@echo "Auto-fixing lint issues..."
	$(UV) run ruff check simplilearn_ml_python/ LLM_Course/ --fix --output-format=concise 2>/dev/null || \
	$(PYTHON) -m ruff check simplilearn_ml_python/ LLM_Course/ --fix --output-format=concise

# -- Notebook Testing -----------------------------------------------------------

test-notebooks:
	@echo "Validating all notebooks can execute..."
	$(UV) run pytest --nbmake simplilearn_ml_python/ LLM_Course/ 2>/dev/null
# 	$(PYTHON) -m nbmake simplilearn_ml_python/ LLM_Course/

# -- Cleanup --------------------------------------------------------------------

clean:
	@echo "Removing virtual environment and caches..."
	rm -rf .venv/
	$(UV) cache clean 2>/dev/null || true
	@echo "✅ Cleaned."
