# Update Node.js to v22.22.0

## Current Status
- Current Node.js version: v22.13.0
- Target version: v22.22.0

## Option 1: Using Homebrew (Recommended if installed)

```bash
brew upgrade node
```

## Option 2: Using nvm (Node Version Manager)

### Install nvm (if not already installed):
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

Then restart your terminal or run:
```bash
source ~/.zshrc
```

### Install and use Node.js v22.22.0:
```bash
nvm install 22.22.0
nvm use 22.22.0
nvm alias default 22.22.0  # Set as default
```

## Option 3: Direct Download

1. Go to https://nodejs.org/
2. Download Node.js v22.22.0 LTS
3. Install the .pkg file
4. Restart your terminal

## Option 4: Using n (Node version manager)

```bash
npm install -g n
sudo n 22.22.0
```

## Verify Installation

After updating, verify:
```bash
node --version  # Should show v22.22.0
npm --version
```

## After Updating

1. Rebuild native modules (if any):
   ```bash
   cd /Users/jameswatson/homebridge
   npm rebuild
   ```

2. Restart Homebridge:
   ```bash
   pkill -f homebridge
   ./bin/homebridge
   ```
