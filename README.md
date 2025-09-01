# Python Project Template

[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-orange.json)](https://github.com/copier-org/copier)

A modern Python project template with integrated tooling for development, testing, and documentation.

## Features

This template uses:

- **[Copier](https://copier.readthedocs.io/)** - For templating and project generation
- **[uv](https://github.com/astral-sh/uv)** - For package and dependency management
- **[MkDocs](https://www.mkdocs.org/)** - For documentation with GitHub Pages deployment
- **[pytest](https://docs.pytest.org/)** - For testing with code coverage via pytest-cov
- **[pre-commit](https://pre-commit.com/)** - For enforcing code quality with ruff and codespell

## Directory Structure

```
├── .github/workflows/  # GitHub Actions workflows, automates MkDocs deployment to github-pages
├── .devcontainer/      # VS Code Development container configuration
├── .vscode/            # VS Code project settings
├── src/                # Source code
├── tests/              # Test files
└── pyproject.toml      # Project metadata and tool configurations
```

## Getting Started

### Creating a New Project

0. Install Copier if needed:  
   `uv tool install copier`

1. Create new GitHub repository and clone locally

2. Copy the project template into the local repo folder:  
   ```
   copier copy https://github.com/harryeslick/pyTemplate path/to/destination
   ```

### Setting Up Documentation

To enable automatic MkDocs deployment to GitHub Pages:

1. Go to repository **Settings → Actions → Workflow permissions**
   - Enable "Read and write permissions" to allow the workflow to create the gh-pages branch

2. Go to **Settings → Pages**
   - Set the source to the automatically generated `gh-pages` branch

## Development Setup

### Local Development

```bash
# Setup virtual environment and install dependencies
uv sync

# Install pre-commit hooks
pre-commit install-hooks
```

### Using VS Code DevContainer

1. Open project folder in VS Code
2. Install the "Remote - Containers" extension
3. Click "Reopen in Container" or run the "Remote-Containers: Reopen in Container" command
