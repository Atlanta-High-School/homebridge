# Cloudflare Tunnel Setup for Homebridge

## Step 1: Install Cloudflare Tunnel

```bash
# Download cloudflared (macOS)
brew install cloudflared

# Or download directly from:
# https://github.com/cloudflare/cloudflared/releases
```

## Step 2: Authenticate with Cloudflare

```bash
cloudflared tunnel login
```

This will open a browser window to authenticate with your Cloudflare account.

## Step 3: Create a Tunnel

```bash
cloudflared tunnel create homebridge
```

This will create a tunnel and save credentials.

## Step 4: Create Config File

Create `~/.cloudflared/config.yml`:

```yaml
tunnel: <tunnel-id-from-step-3>
credentials-file: ~/.cloudflared/<tunnel-id>.json

ingress:
  - hostname: homebridge.yourdomain.com
    service: http://localhost:3000
  - service: http_status:404
```

Replace `homebridge.yourdomain.com` with your domain (you can get a free one from Cloudflare).

## Step 5: Run the Tunnel

```bash
cloudflared tunnel run homebridge
```

Or set it up as a service to run automatically.

## Step 6: Configure DNS

In your Cloudflare dashboard, add a CNAME record:
- Name: `homebridge` (or subdomain of your choice)
- Target: `<tunnel-id>.cfargotunnel.com`

Now you can access your Homebridge UI at `https://homebridge.yourdomain.com` from anywhere!
