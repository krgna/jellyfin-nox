# Jellyfin ve NOX 
Jellyfin ve NOX headless Web-UI kurulumunu otomatikleştirmek için oluşturulmuş shell scripti için repo.


* ```  curl -sSL https://raw.githubusercontent.com/krgna/jellyfin-nox/refs/heads/main/automated.sh -o automated.sh && chmod +x automated.sh && ./automated.sh ```

 
# Önemli notlar
> Bu script **Ubuntu 22.04** için üretilmiştir.
> 
> NOX ve Jellyfin'in default klasörleri **/media** olarak seçilmelidir ve video formatı **mp4** olarak ayarlanmalıdır.
> 
> Alt yazılar **.mp4** dosyası ile aynı **isime** sahip olmalıdır.

# Naming rules for external files

> Jellyfin will search for external files that exactly match the video filename. They can optionally include a language which will only be used if the language cannot be determined from the file metadata.

> If multiple languages are defined within the filename the last one will be used and the others ignored.
