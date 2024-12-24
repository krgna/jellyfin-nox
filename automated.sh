#!/bin/bash

# Jellyfin kurulumu
echo "Jellyfin kurulumu başlatılıyor..."
curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# qbittorrent-nox kurulumu
echo "qbittorrent-nox kurulumu başlatılıyor..."
sudo apt update
sudo apt install -y qbittorrent-nox

# qbittorrent-nox başlatma
echo "qbittorrent-nox başlatılıyor..."
sudo systemctl start qbittorrent-nox

echo "Kurulum ve başlatma işlemleri tamamlandı."
