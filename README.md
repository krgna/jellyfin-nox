# Jellyfin ve NOX 
Jellyfin ve NOX headless Web-UI kurulumunu otomatikleştirmek için oluşturulmuş shell scripti için repo.


* ``` curl -sSL https://raw.githubusercontent.com/krgna/jellyfin-nox/refs/heads/main/automated.sh -o automated.sh && chmod +x automated.sh && ./automated.sh```

 
# Önemli notlar
> Bu script **Ubuntu 22.04** için üretilmiştir.
> 
> NOX ve Jellyfin'in default klasörleri **/media** olarak seçilmelidir ve video formatı **mp4** olarak ayarlanmalıdır.
> 
> Opensubtitles ``` wget http://dl.opensubtitles.org/en/download/sub/subtitleID sonrasında unzip işlemi.```
> Alt yazılar **.mp4** dosyası ile aynı **isime** sahip olmalıdır.
