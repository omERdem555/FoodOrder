Select k.ad, k.soyad, Count(s.siparis_id) as toplam_siparis
From Musteri as m 
Join Siparis as s on m.musteri_id = s.musteri_id
Join Kullanici as k on m.kullanici_id = k.kullanici_id
Group By k.ad, k.soyad
Having Count(s.siparis_id) >= 3