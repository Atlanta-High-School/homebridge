# Quick Start: Access Homebridge from Anywhere

## ⚠️ Security Warning
**NEVER expose Homebridge to the internet without authentication!** The config-ui-x plugin has built-in authentication - make sure to set a username and password in the UI settings.

## Option 1: ngrok (Fastest - 2 minutes)

1. **Install ngrok:**
   ```bash
   brew install ngrok
   ```

2. **Sign up & get token:**
   - Go to https://dashboard.ngrok.com/signup
   - Copy your authtoken

3. **Authenticate:**
   ```bash
   ngrok config add-authtoken YOUR_TOKEN
   ```

4. **Start tunnel with authentication:**
   ```bash
   ngrok http 3000 --basic-auth="yourusername:yourpassword"
   ```

5. **Access your dashboard:**
   - Copy the HTTPS URL from ngrok (e.g., `https://abc123.ngrok.io`)
   - Access it from anywhere!

**Note:** Free tier gives you a random URL. For a fixed URL, upgrade to paid plan.

---

## Option 2: Cloudflare Tunnel (Best for Production)

1. **Install cloudflared:**
   ```bash
   brew install cloudflared
   ```

2. **Login:**
   ```bash
   cloudflared tunnel login
   ```

3. **Create tunnel:**
   ```bash
   cloudflared tunnel create homebridge
   ```

4. **Create config file** `~/.cloudflared/config.yml`:
   ```yaml
   tunnel: <your-tunnel-id>
   credentials-file: ~/.cloudflared/<tunnel-id>.json
   
   ingress:
     - hostname: homebridge.yourdomain.com
       service: http://localhost:3000
     - service: http_status:404
   ```

5. **Run tunnel:**
   ```bash
   cloudflared tunnel run homebridge
   ```

6. **Set up DNS** in Cloudflare dashboard:
   - Add CNAME: `homebridge` → `<tunnel-id>.cfargotunnel.com`

Now access at `https://homebridge.yourdomain.com`!

---

## Option 3: Enable Authentication in Config UI

1. Open http://localhost:3000
2. Go to **Settings** → **Homebridge Settings**
3. Enable **Form Authentication**
4. Set a **Username** and **Password**
5. Save settings

This adds a login page to protect your dashboard.

---

## Recommendation

- **For quick testing:** Use ngrok
- **For permanent access:** Use Cloudflare Tunnel
- **Always:** Enable authentication in config-ui-x settings!
