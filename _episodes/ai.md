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
cd adk_currency_agent
cp .env.example .env
vim .env
```

1. Update `OPENAI_API_BASE` with `https://openrouter.ai/api/v1`
2. Update `OPENAI_API_KEY` with your key

```bash
uv sync
uv run currency_agent
```

## Client

```bash
git clone https://github.com/srbdev/currency_client.git
cd currency_client
uv venv
source .venv/bin/activate
uv pip install -r requirements

uv run python cli.py --url http://localhost:10999
```

Enter a user prompt to make sure that the backend agent is correctly bootstrap with the LLM.

## Kubernetes

```bash
kubectl create namespace NAME
kubectl apply -f deployment.yaml -n NAME

kubectl port-forward svc/currency-agent-service 10999:10999 -n NAME
```

1. Restart client

## MCP

```bash
git clone https://github.com/srbdev/currency_mcp.git
cd currency_mcp
kubectl apply -f deployment.yaml -n NAME
```

### Update Agent

```bash
git checkout with-remote-mcp 

# If `git` complains about overwritting changes in `deployment.yaml`
git stash
git checkout with-remote-mcp 
git stash pop 
# make sure no conflicts in `deployment.yaml`
```

1. Update `MCP_SERVER_HTTP_URL` with Service IP address from MCP server

```bash
kubectl get services -n NAME
# and copy `CLUSTER-IP` for `currency-mcp-service` row

kubectl delete deployments/currency_agent -n NAME 
kubectl apply -f deployment.yaml -n NAME
kubectl port-forward svc/currency-agent-service 10999:10999 -n NAME
```

1. Restart client


## Example Prompts

```
Find the list of supported EU currencies and show the exchange rate with USD in markdown format
how much is 10 USD in CAD?
how did the EUR value fluctuate against USD from jan 1st, 2026 to now?
```
