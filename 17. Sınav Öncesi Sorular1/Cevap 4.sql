Select Count(s.siparis_id) as ToplamTeslimEdilenSiparis, Sum(s.siparis_tutari) as ToplamGelir
From Kurye as k
Join Siparis as s On k.kurye_id = s.kurye_id
Where s.durum = 'Delivered'
Group By k.kullanici_id