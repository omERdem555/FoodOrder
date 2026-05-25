Select sd.siparis_id, mu.ad, sd.adet, sd.birim_fiyat
From MenuUrun as mu
Join SiparisDetay as sd On mu.urun_id = sd.urun_id