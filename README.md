# 🎬 Jellyfin & qBittorrent (Docker)

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Jellyfin](https://img.shields.io/badge/jellyfin-00A4DC?style=for-the-badge&logo=jellyfin&logoColor=white) ![qBittorrent](https://img.shields.io/badge/qbittorrent-4D9CFF?style=for-the-badge&logo=qbittorrent&logoColor=white)

Selamlar, bu proje evde kendi medya sunucunuzu (Netflix benzeri kendi sisteminiz) en hızlı şekilde kurmanız için hazırladığım bir otomasyon. Jellyfin ve qBittorrent'in "Streaming" için ayarlanmış halini tek komutla kuruyor.

---

## 🔥 Ne İşe Yarıyor?
*   **Uğraştırmaz:** Scripti çalıştırıyorsunuz, gerisini o hallediyor.
*   **Otomatik Ayar:** "Hangi kullanıcıydım, yetkim neydi?" diye dert etmenize gerek yok. Script sizin yerinize kullanıcı ID'nizi bulup yetki sorunlarını çözüyor. Docker yüklü değilse onu bile hallediyor.
*   **İzlemeye Hazır:** İndirirken izleyebilmeniz (streaming) için gerekli ayarları yapılmış halde geliyor.

## 🛠️ İçinde Ne Var?
*   **[Jellyfin](https://jellyfin.org/):** Filmlerinizi ve dizilerinizi afişleriyle, konularıyla otomatik düzenleyip sunan harika bir arayüz.
*   **[qBittorrent-nox](https://www.qbittorrent.org/):** Arka planda çalışan, sadece web arayüzü olan hafif torrent istemcisi.

## 🚀 Nasıl Kurarız?

### 1. Ne Lazım?
*   Linux yüklü bir makine (Ubuntu falan olur).
*   Terminal açık olsun yeter.

### 2. Kurulum
Dosyaları indirin, script'e çalışma izni verip çalıştırın. Bu kadar:

```bash
chmod +x media-stack.sh
./media-stack.sh
```

### 3. Arayüzlere Giriş
Kurulum bitince tarayıcınızdan şu adreslere girip kullanmaya başlayabilirsiniz:

*   **Jellyfin (Filmleri izleyeceğiniz yer):**
    `http://ipadresi:8096`
    *(İlk girişte basit bir kurulum ekranı gelir, ileri ileri diyerek halledersiniz)*

*   **qBittorrent (İndirme yapacağınız yer):**
    `http://ipadresi.com:8080`
    *   **Kullanıcı Adı:** `admin`
    *   **Şifre:** `adminadmin`

---

## 📝 Birkaç Ufak Tavsiye (Önemli)
Sistemi sorunsuz kullanmak için şu tecrübe ettiğim noktalara dikkat edin:

*   **⚠️ Video Formatı:** Videolarınız mümkünse **mp4** olsun. En sorunsuz bu formatta çalışıyor.
*   **📝 Altyazı Meselesi:** Eğer dışarıdan altyazı dosyası (`.srt` vb.) atacaksanız, dosya adı filmle **birebir aynı** olmalı ve **aynı klasörde** durmalı. Yoksa Jellyfin görmüyor.

### Altyazı İndirme
OpenSubtitles'tan hızlıca altyazı çekmek isterseniz terminalden şu komutu kullanabilirsiniz (ID kısmına filmin ID'sini yazın):

```sh
curl -o outputname.zip -A "Mozilla/5.0" "http://dl.opensubtitles.org/en/download/sub/ID"
```

---

## 📂 Dosyalar Nerede?
Bilgisayarınızın içi çorba olmasın diye her şeyi düzenli bir klasör yapısında tutuyoruz:

```
/opt/docker_media_stack/
├── qbittorrent/config   # Torrent ayarları burada
├── jellyfin/config      # Jellyfin ayarları burada
└── jellyfin/cache       # Ön bellek

/opt/media               # Filmlerinizi buraya atın
/opt/media2              # Yer dolarsa burayı kullanırsınız
```

## ⚙️ Teknik Detay (Meraklısına)
Script arka planda `docker-compose-streaming.yaml` dosyasını sizin bilgisayarınıza göre ("hardcoded" değerleri silip sizin PUID/PGID bilgilerinizi girerek) dinamik olarak düzenliyor. Yani "yetki hatası" almazsınız.

## 🤝 Katkı
Hata görürseniz veya "Şunu da eklesek süper olur" derseniz haber verin, güncelleyelim.
