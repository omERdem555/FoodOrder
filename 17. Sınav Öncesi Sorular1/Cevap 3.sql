Select Sum(s.siparis_tutari) as ToplamGelir, Avg(s.siparis_tutari) as OrtalamaSiparisTutari, Count(s.siparis_id) as ToplamSiparisSayisi
From Musteri as m 
Join Siparis as s On m.musteri_id = s.musteri_id
Group By m.musteri_id