Select a.il as 'İl', a.ilce as 'İlçe', a.posta_kodu as 'Posta Kodu'
From Restoran as r
Join Adres as a On r.adres_id = a.adres_id
Union
Select a.il as 'İl', a.ilce as 'İlçe', a.posta_kodu as 'Posta Kodu'
From Kullanici as k
Join Adres as a On k.kullanici_id = a.kullanici_id
