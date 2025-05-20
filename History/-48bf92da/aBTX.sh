#!/bin/bash

# IP de tu Mac
N8N_IP="192.168.1.254"
N8N_PORT="5678"
CADDYFILE_PATH="$HOME/caddy/n8n/Caddyfile"

echo "[🟢] Lanzando n8n en segundo plano..."
export N8N_SECURE_COOKIE=false
nohup n8n > "$HOME/caddy/n8n/n8n.log" 2>&1 &

sleep 2

echo "[🟢] Reiniciando Caddy con proxy a $N8N_IP:$N8N_PORT..."
sudo caddy run --config "$CADDYFILE_PATH" --adapter caddyfile
open -a "<Google Chrome>" http://192.168.1.254:5678/