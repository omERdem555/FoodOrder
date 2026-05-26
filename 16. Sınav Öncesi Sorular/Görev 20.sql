Select m.musteri_id, k.ad, k.soyad
From Musteri as m
Join Kullanici as k On m.kullanici_id = k.kullanici_id
Where m.musteri_id Not In(
Select ayb.musteri_id
From AskidaYemekBagis as ayb)