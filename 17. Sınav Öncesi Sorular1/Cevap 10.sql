Select r.ad as Restoran_Adi, Avg(s.siparis_tutari) as Ortalama_Siparis_Tutari
From Restoran as r
Join Siparis as s on r.restoran_id = s.restoran_id
Group By r.ad
Having Avg(s.siparis_tutari) > 60