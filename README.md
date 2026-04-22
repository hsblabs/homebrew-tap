# hsblabs/homebrew-tap

Homebrew tap for `microcms` and `unispeedtest`.

## Prerequisite

The `hsblabs/microcms-cli` and `hsblabs/universal-speedtest-cli` repositories and their GitHub Releases must be public. If they are still private, `brew audit` and `brew install` will fail with HTTP 404 when resolving the homepage and release asset URLs.

## Install

```bash
brew tap hsblabs/tap
brew install hsblabs/tap/microcms
brew install hsblabs/tap/unispeedtest
```

Or install directly from the tap in one command:

```bash
brew install hsblabs/tap/microcms
brew install hsblabs/tap/unispeedtest
```

## Repository layout

```text
.github/workflows/
  test.yml
  update.yml
Formula/
  microcms.rb
  unispeedtest.rb
docs/adr/
  2026-04-23-maltmill-formula-management.md
Makefile
```

## Updating for a new release

1. Install `maltmill`
   ```bash
   brew install Songmu/tap/maltmill
   ```
2. Run `make update`
3. Confirm the diff in `Formula/*.rb`
4. Commit and push to `hsblabs/homebrew-tap`

`make update` uses `maltmill -w Formula/*.rb`, so the release version, asset URLs, and checksums are refreshed directly from GitHub Releases while preserving the existing custom `install` and `test` blocks in each formula.

## Formula notes

- `microcms` uses `--version` in its Homebrew test.
- `unispeedtest` does not expose a version flag, so its Homebrew test validates the help output instead.

## GitHub Actions

- `test.yml`: runs `make test` on push and pull request
- `update.yml`: installs `maltmill`, updates `Formula/*.rb` on schedule or manual dispatch, and opens a pull request when needed

## Repository settings

Configure GitHub repository settings after pushing:

1. Enable GitHub Actions to create and approve pull requests if organization policy requires it.
2. Add branch protection for `main` with required status checks for the `test` workflow.
3. Keep the default `GITHUB_TOKEN` permissions available for the update workflow (`contents: write`, `pull-requests: write`).
