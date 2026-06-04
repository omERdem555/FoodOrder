Select k.ad, k.soyad, Sum(s.siparis_tutari) as toplam_harcama
From Musteri as m 
Join Kullanici as k on m.kullanici_id = k.kullanici_id
Join Siparis as s On m.musteri_id = s.musteri_id
Group by m.musteri_id, k.ad, k.soyad
Having Sum(s.siparis_tutari) > 100