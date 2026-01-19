# Fix Homebridge to Work Normally

## Issue
You're running Homebridge from the development directory (`./bin/homebridge`) instead of using the globally installed version.

## Solution: Install Homebridge Globally

### Step 1: Install Homebridge globally
```bash
cd /Users/jameswatson/homebridge
npm install -g .
```

This installs the current version globally so you can use `homebridge` command from anywhere.

### Step 2: Run Homebridge normally
```bash
homebridge
```

Or with debug mode:
```bash
homebridge -D
```

### Step 3: Access the UI
- Web UI: http://localhost:3000
- HomeKit: Port 51826 (discoverable in Home app)

## Alternative: Use hb-service (Recommended for Production)

For a proper service installation:

```bash
sudo npm install -g --unsafe-perm homebridge homebridge-config-ui-x
sudo hb-service install
```

This creates a proper system service that:
- Starts automatically on boot
- Runs in the background
- Has proper logging
- Can be managed with `hb-service` commands

## Current Setup Issues

1. **Running from source**: You're using `./bin/homebridge` which is for development
2. **No proper service**: Not running as a system service
3. **Manual management**: Need to manually start/stop processes

## Quick Fix

To run normally right now:

```bash
# Stop current processes
pkill -f homebridge
pkill -f ngrok

# Install globally (if not already)
npm install -g .

# Run normally
homebridge
```

Then access at http://localhost:3000

## For Remote Access

After installing globally, you can still use ngrok:

```bash
# Terminal 1: Start Homebridge
homebridge

# Terminal 2: Start ngrok
ngrok http 3000
```
