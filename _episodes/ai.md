---
title: "Agentic AI"
teaching: 15
exercises: 20
questions:
- How do I quickly develop and deploy agents in Kubernetes?
- How do multi-agent systems communicate?
objectives:
- Learn about developing AI agents 
- Learn about connecting AI agents to MCP servers
- Learn about deploying AI systems to Kubernetes
---

# Agentic AI

## Currency Agent

```bash
git clone https://github.com/srbdev/adk_currency_agent.git
```

1. Update `OPENAI_API_BASE` with value
2. Update `OPENAI_API_KEY` with value

```bash
kubectl apply -f deployment.yaml
```

## Client

```bash
git clone https://github.com/srbdev/currency_client.git
uv run python cli.py --url http://localhost:10999
```

### Example Prompts

```
Find the list of supported EU currencies and show the exchange rate with USD in markdown format
how much is 10 USD in CAD?
how did the EUR value fluctuate against USD from jan 1st, 2026 to now?
```
