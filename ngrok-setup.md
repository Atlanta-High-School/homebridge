# ngrok Setup for Homebridge (Quick & Easy)

## Step 1: Install ngrok

```bash
# macOS
brew install ngrok

# Or download from: https://ngrok.com/download
```

## Step 2: Sign up for free account

1. Go to https://dashboard.ngrok.com/signup
2. Get your authtoken from the dashboard

## Step 3: Authenticate

```bash
ngrok config add-authtoken YOUR_AUTH_TOKEN
```

## Step 4: Start Tunnel

```bash
ngrok http 3000
```

This will give you a public URL like `https://abc123.ngrok.io` that forwards to `localhost:3000`.

## Step 5: Enable Authentication (IMPORTANT!)

Add authentication to protect your Homebridge UI:

```bash
ngrok http 3000 --basic-auth="username:password"
```

Replace `username` and `password` with your own credentials.

## Note:
- Free tier gives you a random URL each time (changes on restart)
- For a fixed URL, you need a paid plan
- Always use authentication when exposing Homebridge!
