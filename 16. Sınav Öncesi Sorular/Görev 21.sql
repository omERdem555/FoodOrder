Select m.musteri_id, k.ad, k.soyad
From Musteri as m
Join Kullanici as k On m.kullanici_id = k.kullanici_id
Where m.dogrulanmis_ihtiyac_sahibi = 1 and not exists
(
Select *
From AskidaYemekKullanim as ayk 
Where ayk.musteri_id = m.musteri_id
)