# Homebrew Tap for Embacle

Install [embacle](https://github.com/dravr-ai/dravr-embacle) — a unified LLM server wrapping AI CLI tools as an OpenAI-compatible API + MCP server.

## Install

```bash
brew tap dravr-ai/tap
brew install embacle
```

## Usage

```bash
# Start the OpenAI-compatible API + MCP server
embacle-server --provider copilot

# Start the standalone MCP server (for Claude Desktop, Cursor, etc.)
embacle-mcp --provider copilot
```

## Update

```bash
brew upgrade embacle
```
