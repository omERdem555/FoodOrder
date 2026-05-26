Select (k.ad + ' ' + k.soyad) as 'İsim', Sum(s.siparis_tutari) as 'Toplam Harcama'
From Musteri as m
Join Kullanici as k On m.kullanici_id = k.kullanici_id
Join Siparis as s On m.musteri_id = s.musteri_id
Where Sum(s.siparis_tutari) > 300
Group By m.musteri_id, k.ad, k.soyad
