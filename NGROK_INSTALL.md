# ngrok Installation & Setup Guide

## Step 1: Install ngrok

### Option A: Direct Download (Recommended)
1. Go to https://ngrok.com/download
2. Download the macOS version
3. Unzip the file
4. Move `ngrok` to `/usr/local/bin/`:
   ```bash
   sudo mv ngrok /usr/local/bin/
   sudo chmod +x /usr/local/bin/ngrok
   ```

### Option B: Using Homebrew (if installed)
```bash
brew install ngrok
```

## Step 2: Sign Up & Get Authtoken

1. Go to https://dashboard.ngrok.com/signup
2. Create a free account
3. Go to https://dashboard.ngrok.com/get-started/your-authtoken
4. Copy your authtoken

## Step 3: Configure ngrok

```bash
ngrok config add-authtoken YOUR_AUTH_TOKEN_HERE
```

Replace `YOUR_AUTH_TOKEN_HERE` with the token from step 2.

## Step 4: Start the Tunnel

**IMPORTANT:** Always use authentication when exposing Homebridge!

```bash
ngrok http 3000 --basic-auth="yourusername:yourpassword"
```

Replace `yourusername` and `yourpassword` with secure credentials.

## Step 5: Access Your Dashboard

ngrok will display a URL like:
```
Forwarding  https://abc123.ngrok.io -> http://localhost:3000
```

Open this URL in your browser. You'll be prompted for the username/password you set.

## Running in Background

To keep ngrok running in the background:

```bash
nohup ngrok http 3000 --basic-auth="username:password" > ngrok.log 2>&1 &
```

Check the URL:
```bash
curl http://localhost:4040/api/tunnels | python3 -m json.tool
```

## Security Notes

⚠️ **CRITICAL:** 
- Always use `--basic-auth` when exposing Homebridge
- The free tier gives you a random URL that changes each time
- For a fixed URL, you need a paid ngrok plan ($8/month)
- Consider also enabling authentication in config-ui-x settings

## Troubleshooting

- **Port 3000 in use?** Make sure Homebridge is running: `lsof -i :3000`
- **Can't connect?** Check that Homebridge is accessible locally: `curl http://localhost:3000`
- **Need help?** Check ngrok status: `ngrok config check`
