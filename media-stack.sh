#!/bin/bash
set -e

GITHUB_REPO_URL="https://github.com/krgna/jellyfin-nox/"
REPO_DIR_NAME="jellyfin-nox"
HOST_CONFIG_DIR="/opt/docker_media_stack"
COMPOSE_FILE_NAME="docker-compose-streaming.yaml"
MEDIA_DIR_1="/opt/media"
MEDIA_DIR_2="/opt/media2"

PUID=$(id -u)
PGID=$(id -g)
TZ_SET="Europe/Istanbul"

echo "#####################################################"
echo "# Docker Medya   #"
echo "#####################################################"

if ! command -v docker &> /dev/null; then
    echo "--- Docker bulunamadı, kuruluyor... ---"
    sudo apt update -y
    sudo apt install -y ca-certificates curl gnupg lsb-release

    sudo install -m 0755 -d /etc/apt/keyrings
    DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
    curl -fsSL "https://download.docker.com/linux/$DISTRO/gpg" | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$DISTRO \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update -y
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker "$USER"
    echo "--- Docker kuruldu. Grubun aktif olması için oturumu kapatıp açmanız gerekebilir. ---"
else
    echo "--- Docker zaten kurulu, bu adım atlanıyor. ---"
fi

echo "--- Dizinler kontrol ediliyor... ---"
for dir in \
    "$HOST_CONFIG_DIR/qbittorrent/config" \
    "$HOST_CONFIG_DIR/jellyfin/config" \
    "$HOST_CONFIG_DIR/jellyfin/cache" \
    "$MEDIA_DIR_1" \
    "$MEDIA_DIR_2"
do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "Oluşturuldu: $dir"
    fi
done

sudo chown -R $PUID:$PGID "$HOST_CONFIG_DIR" "$MEDIA_DIR_1" "$MEDIA_DIR_2"

echo "--- Proje dosyaları hazırlanıyor... ---"
if [ -d "$REPO_DIR_NAME" ]; then
    echo "Klasör mevcut, güncelleniyor..."
    cd "$REPO_DIR_NAME"
    git pull
else
    git clone "$GITHUB_REPO_URL" "$REPO_DIR_NAME"
    cd "$REPO_DIR_NAME"
fi

echo "--- $COMPOSE_FILE_NAME yapılandırılıyor... ---"

if [ ! -f "$COMPOSE_FILE_NAME" ]; then
    echo "HATA: $COMPOSE_FILE_NAME bulunamadı!"
    exit 1
fi

sed -i "s/PUID=[0-9]*/PUID=$PUID/g" "$COMPOSE_FILE_NAME"
sed -i "s/PGID=[0-9]*/PGID=$PGID/g" "$COMPOSE_FILE_NAME"
sed -i "s|TZ=Europe/Istanbul|TZ=$TZ_SET|g" "$COMPOSE_FILE_NAME"

sed -i "s|/opt/qbittorrent/config|$HOST_CONFIG_DIR/qbittorrent/config|g" "$COMPOSE_FILE_NAME"
sed -i "s|/opt/jellyfin/config|$HOST_CONFIG_DIR/jellyfin/config|g" "$COMPOSE_FILE_NAME"
sed -i "s|/opt/jellyfin/cache|$HOST_CONFIG_DIR/jellyfin/cache|g" "$COMPOSE_FILE_NAME"

sed -i "s|/opt/media2|$MEDIA_DIR_2|g" "$COMPOSE_FILE_NAME" 
sed -i "s|/opt/media|$MEDIA_DIR_1|g" "$COMPOSE_FILE_NAME" 

sed -i "s/user: [0-9]*:[0-9]*/user: $PUID:$PGID/g" "$COMPOSE_FILE_NAME"

echo "--- Servisler başlatılıyor... ---"
docker compose -f "$COMPOSE_FILE_NAME" up -d

echo "--- Kurulum Tamamlandı! ---"
