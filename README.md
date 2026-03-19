# git-tagger

A lightweight CLI tool to simplify Git tagging workflows by automatically suggesting the next tag based on existing tags.

---

## Features

- Auto-increment tag numbers (`prefix-1 → prefix-2`)
- Reuse last tag prefix automatically
- Support for multiple prefixes (e.g. `technxt-*`, `syrotech-*`)
- Interactive prefix selection with `fzf` (`--pick`)
- One-command tag creation and push
- Works across all your Git repositories

## Installation

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd git-tagger
```

### 2. Install globally

```bash
make install
```

This will:

- Symlink the tagger command into ~/.local/bin
- Ensure ~/.local/bin is in your PATH

## Usage

Run inside any Git repository:

### Use last tag prefix

```bash
tagger
```

### Specify a prefix

```bash
tagger technxt-port-status
```

### Pick prefix interactively (requires fzf)

```bash
tagger --pick
```

### Example

```bash
$ tagger

Using last tag prefix: technxt-port-status
Last matching tag: technxt-port-status-1
Next tag: technxt-port-status-2

Commands:
  git tag "technxt-port-status-2"
  git push origin "technxt-port-status-2"

Create and push this tag? (y/n):
```

## Notes

- Must be run inside a Git repository
- Tags are assumed to follow the format: <prefix>-<number>
- If no tags exist, you must provide a prefix manually
