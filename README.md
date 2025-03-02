 Jellyfin ve NOX

Jellyfin ve NOX headless Web-UI kurulumunu otomatikleştirmek için oluşturulmuş shell scripti.

## Kurulum
Aşağıdaki komutu çalıştırarak scripti indirip çalıştırabilirsin:

```sh
curl -sSL https://raw.githubusercontent.com/krgna/jellyfin-nox/refs/heads/main/automated.sh -o automated.sh && chmod +x automated.sh && ./automated.sh
```

## Önemli Notlar
- Bu script **Ubuntu 22.04** için üretilmiştir.
- **NOX ve Jellyfin'in** varsayılan klasörleri **/media** olarak seçilmelidir.
- Video formatı **mp4** olarak ayarlanmalıdır.

## Altyazılar
- OpenSubtitles'tan altyazı indirmek için:

  ```sh
  wget http://dl.opensubtitles.org/en/download/sub/subtitleID
  ```
  
- İndirdiğiniz dosyayı açmak için:

  ```sh
  unzip subtitleID.zip
  ```

- Altyazı dosyaları, ilgili **.mp4** dosyası ile **aynı isme** sahip olmalıdır.

---


