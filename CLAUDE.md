# CLAUDE.md

## What this repo is

Homebrew tap (`tsilva/tap`) for distributing brew-installable projects. Currently includes `claudebridge`; more formulas will be added as projects become available.

Users install formulas via:
```bash
brew install tsilva/tap/<formula-name>
```

## Repository structure

- `Formula/` — Homebrew formula files (Ruby). Each formula defines how to install a package.
- `.github/workflows/update-formula.yml` — GitHub Actions workflow for automated formula updates.

## How formula updates work

The `update-formula.yml` workflow is triggered via **workflow_dispatch** with a `version` input. It:
1. Fetches the sdist URL and SHA256 from PyPI for the given version
2. Regenerates the formula file with the new URL and hash
3. Commits and pushes the change

This is currently wired up for `claudebridge` (PyPI package: `py-claudebridge`). When adding new formulas, follow the same pattern or create additional workflows.

## Testing formulas locally

```bash
# Audit the formula for issues
brew audit --strict Formula/claudebridge.rb

# Install from local formula
brew install --build-from-source Formula/claudebridge.rb

# Run the formula's test block
brew test claudebridge
```

## Adding a new formula

1. Create `Formula/<name>.rb` following Homebrew conventions
2. Add an update workflow (or extend the existing one) if the formula should auto-update
3. Update `README.md` to list the new formula

## Important

- **README.md must be kept up to date with any significant project changes** (new formulas, workflow changes, install instructions, etc.)
