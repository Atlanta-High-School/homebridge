#!/bin/bash

# ngrok Setup Script for Homebridge

echo "🚀 Setting up ngrok for Homebridge..."

# Check if ngrok is installed
if command -v ngrok &> /dev/null; then
    echo "✅ ngrok is already installed"
    ngrok version
else
    echo "📥 ngrok is not installed. Please install it:"
    echo ""
    echo "Option 1: Download from https://ngrok.com/download"
    echo "   - Download for macOS"
    echo "   - Unzip and move to /usr/local/bin/"
    echo ""
    echo "Option 2: Install via Homebrew (if you have it):"
    echo "   brew install ngrok"
    echo ""
    read -p "Press Enter after installing ngrok..."
fi

# Check if authtoken is configured
if ngrok config check &> /dev/null; then
    echo "✅ ngrok is configured"
else
    echo ""
    echo "🔐 You need to configure ngrok with your authtoken:"
    echo ""
    echo "1. Sign up at https://dashboard.ngrok.com/signup (free)"
    echo "2. Copy your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken"
    echo "3. Run: ngrok config add-authtoken YOUR_TOKEN"
    echo ""
    read -p "Press Enter after configuring ngrok..."
fi

# Get username and password for basic auth
echo ""
echo "🔒 Setting up authentication (IMPORTANT for security!)"
read -p "Enter username for Homebridge access: " USERNAME
read -sp "Enter password: " PASSWORD
echo ""

# Start ngrok tunnel
echo ""
echo "🌐 Starting ngrok tunnel..."
echo "Your Homebridge dashboard will be accessible via the HTTPS URL shown below"
echo ""

ngrok http 3000 --basic-auth="$USERNAME:$PASSWORD"
