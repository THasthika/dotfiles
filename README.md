# Dotfiles Management Tools

A collection of scripts to manage, backup, and deploy dotfiles configurations.

## Scripts

### 1. `dotman` - Dotfiles Manager
Main tool for importing and deploying dotfiles between your OS and this repository.

**Commands:**
- `./dotman list` - List all configured mappings
- `./dotman status` - Show status of each config (imported, deployed, missing)
- `./dotman import <name|--all> [-f]` - Copy config from OS to repo
- `./dotman deploy <name|--all> [-f]` - Symlink config from repo to OS

**Examples:**
```bash
# View all configured dotfiles
./dotman list

# Check status
./dotman status

# Import a specific config
./dotman import nvim

# Import all configs
./dotman import --all

# Import all without prompts
./dotman import -f --all

# Deploy a specific config (creates symlink)
./dotman deploy nvim

# Deploy all configs
./dotman deploy --all

# Deploy all without prompts
./dotman deploy -f --all
```

### 2. `dotbackup` - Backup & Restore Tool
Create timestamped snapshot backups of your OS configs and restore them when needed.

**Commands:**
- `./dotbackup [create]` - Create a new backup
- `./dotbackup list` - List existing backups
- `./dotbackup restore <file> [-f]` - Restore from a backup

**Examples:**
```bash
# Create a backup
./dotbackup
# or
./dotbackup create

# Create backup in custom directory
./dotbackup -o ~/my-backups

# List backups
./dotbackup list

# Restore from backup
./dotbackup restore backups/dotfiles_backup_20251017_040151.zip

# Restore without prompts
./dotbackup restore backups/dotfiles_backup_20251017_040151.zip -f
```

### 3. `setup.bash` - Legacy Helper (deprecated)
Original simple script for copying configs. Consider using `dotman` instead.

## Configuration

All tools use `config.yaml` to define which dotfiles to manage:

```yaml
mappings:
  - source: nvim
    dest: ~/.config/nvim

  - source: alacritty
    dest: ~/.config/alacritty

  - source: git
    dest: ~/.config/git

  - source: bashrc
    dest: ~/.bashrc
```

**Fields:**
- `source`: Path relative to this repo
- `dest`: Absolute path in the OS (use `~` for home directory)

## Typical Workflow

### Initial Setup (New Machine)
1. Clone this repo
2. Review `config.yaml`
3. Deploy configs: `./dotman deploy --all`

### Regular Updates
1. Make changes to your OS configs
2. Import back to repo: `./dotman import <name>`
3. Commit and push changes

### Before Major Changes
1. Create backup: `./dotbackup`
2. Make your changes
3. If needed, restore: `./dotbackup restore <backup-file>`

## Requirements

- **bash** 4.0+
- **yq** (for YAML parsing) - either:
  - Go-based: [mikefarah/yq](https://github.com/mikefarah/yq) v4.x
  - Python-based: `pip install yq` v3.x
- **rsync** (for copying files)
- **zip/unzip** (for backups)

## Notes

- `import` copies files from OS to repo
- `deploy` creates symlinks from repo to OS (so changes in repo reflect immediately in OS)
- `backup` creates snapshot zip files (doesn't use symlinks)
- Use `-f` flag to skip prompts (useful for automation)
- Backups are stored in `./backups/` by default with timestamp naming

## License

MIT
