### UPGRADE DATABASE

1. Click file jarus.sql
2. Dari sebelah kanan layar Click tombol `Raw`
3. Copy alamat file yg ada di address bar

Copy baris perintah berikut ke `terminal wsl`:
```bash
cd ~
curl -O https://raw.githubusercontent.com/kahfina/kahfina/main/jarus.sql jarus.sql
sudo -postgres psql -d jakab < jarus.sql
```
> Kalau nanya password, ini passwordnya: `t2z00a8y`
