# conftest.py — shared pytest config that actually works for nbmake
# ----------------------------------------------------------------
# nbmake is a pytest plugin; it does NOT read [tool.nbmake] in pyproject.toml.
# Use pytest.ini_options (or this file) for anything you want to control.

import pathlib

# --- Skip notebooks that require API keys or GPU training ---
collect_ignore = [
    # Gemini & Groq API keys needed
    str(pathlib.Path("LLM_Course").resolve() / "LLM_Examples_Gemini.ipynb"),
    str(pathlib.Path("LLM_Course").resolve() / "External_Guardrails.ipynb"),
    # Fine-tuning / continued pre-training (GPU + large models)
    str(pathlib.Path("LLM_Course").resolve() / "Fine_Tuning_Course_lab.ipynb"),
    str(pathlib.Path("LLM_Course").resolve() / "continued_pretraining_engineering_demo.ipynb"),
    # requires google colab
    str(pathlib.Path("LLM_Course").resolve() / "Cust_Feedback_Summeriser.ipynb"),
    str(pathlib.Path("LLM_Course").resolve() / "RAG_Example.ipynb"),
    # this notebook has errors
    str(pathlib.Path("simplilearn_ml_python").resolve() / "ensemble_wt_keras_and_sklearn.ipynb"),
]
