#!/bin/bash

set -e

echo "Minecraft 1.12.2 Server Setup"

sudo apt-get update
sudo apt-get install -y openjdk-8-jre-headless wget

mkdir -p ~/minecraft/server
cd ~/minecraft/server

if [ ! -f server.jar ]; then
    echo "ERROR: server.jar is missing!"
    echo "Put the official Minecraft 1.12.2 server.jar"
    echo "inside ~/minecraft/server/"
    exit 1
fi

echo "eula=true" > eula.txt

cat > server.properties <<EOF
motd=My Minecraft 1.12.2 Server
server-port=25565
server-ip=
online-mode=true
max-players=10
gamemode=survival
difficulty=normal
pvp=true
spawn-protection=0
view-distance=8
level-name=world
generate-structures=true
allow-nether=true
enable-command-block=false
EOF

cat > ~/minecraft/start.sh <<'EOF'
#!/bin/bash
cd ~/minecraft/server
java -Xms512M -Xmx2G -jar server.jar nogui
EOF

chmod +x ~/minecraft/start.sh

echo ""
echo "================================"
echo "SERVER SETUP COMPLETE!"
echo "================================"
echo "Start with:"
echo "~/minecraft/start.sh"
