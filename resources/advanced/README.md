# Advanced Resources

Materials for deep learning, LLMs, embeddings, fine-tuning, and production MLOps.

---

## 🎓 Courses & Tutorials

| Resource             | Topic                             | Link                            |
| -------------------- | --------------------------------- | ------------------------------- |
| Fast.ai Practical DL | Hands-on DL from first principles | <https://course.fast.ai>        |
| Hugging Face Course  | NLP, transformers, fine-tuning    | <https://huggingface.co/course> |
| D2L.ai (Zero to All) | Deep learning with PyTorch        | <https://d2l.ai>                |
| LangChain Docs       | Production LLM apps, RAG          | <https://python.langchain.com>  |
| Groq API Docs        | Low-latency inference             | <https://console.groq.com/docs> |

## 📚 Books & Papers

| Paper / Book                 | Author                        | Focus                     |
| ---------------------------- | ----------------------------- | ------------------------- |
| _Attention Is All You Need_  | Vaswani et al. (2017)         | Transformer architecture  |
| _BERT_                       | Devlin et al. (2019)          | Pre-training for language |
| _Chain-of-Thought Prompting_ | Wei et al. (2022)             | LLM reasoning             |
| _Deep Learning_              | Goodfellow, Bengio, Courville | DL theory bible           |

## 🗃️ Datasets & Models for Advanced Practice

| Dataset / Model             | Source              | Good For                          |
| --------------------------- | ------------------- | --------------------------------- |
| GLUE / SuperGLUE            | Hugging Face        | Multi-task NLP benchmarking       |
| SQuAD v2                    | Stanford            | Reading comprehension, QA         |
| Customer Feedback (custom)  | Kaggle / own scrape | Summarisation, topic mod.         |
| SentenceTransformers/all-\* | HuggingFace         | Retrieval & embedding benchmarks  |
| Gemma-2-2B                  | Google              | Lightweight instruction-tuned LLM |

## 🛠️ Cheat-Sheets

| Topic                      | Link                                                    |
| -------------------------- | ------------------------------------------------------- |
| Transformers API           | <https://huggingface.co/docs/transformers>              |
| LangChain Expression Lang. | <https://python.langchain.com/docs/expression_language> |
| Torch GPU / MPS usage      | <https://pytorch.org/docs/stable/tensors.html>          |

## 🧪 Tooling & MLOps

| Tool             | Purpose                        |
| ---------------- | ------------------------------ |
| DVC              | Dataset & model versioning     |
| MLflow           | Experiment tracking            |
| Weights & Biases | Monitoring + reporting         |
| Evidently AI     | Drift detection & eval.        |
| Ray AIR          | Distributed training & serving |

## ✅ What You Should Be Able To Do After This Section

- Tokenise, embed, and vectorise text corpora
- Fine-tune a small LLM with PEFT / LoRA on a classification / summarisation task
- Build a RAG pipeline with LangChain + embeddings + Chroma/FAISS
- Use guardrails / validation to ensure LLM output safety & structure
- Write production-ready prompts with Chain-of-Thought & few-shot examples
