### UPGRADE DATABASE

Copy baris perintah berikut ke `terminal wsl`:
```bash
cd ~
curl -O https://raw.githubusercontent.com/kahfina/kahfina/main/jarus.sql jarus.sql
sudo -postgres psql -d jakab < jarus.sql
```
> Kalau nanya password, ini passwordnya: `sikil`
