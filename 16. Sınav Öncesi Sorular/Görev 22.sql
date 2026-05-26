Create view vw_restoran_siparis_ozeti as
Select r.ad as 'Restoran Adı', Count(*) as 'Toplam Sipariş Sayısı', Sum(r.toplam_gelir) as 'Restoran Toplam Gelir', Avg(s.siparis_tutari) as 'Ortalama Sipariş Tutarı'
From Restoran as r
Join Siparis as s On r.restoran_id = s.restoran_id
Group By r.ad, r.restoran_id, s.restoran_id
