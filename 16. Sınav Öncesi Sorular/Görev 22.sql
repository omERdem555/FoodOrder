Create view vw_restoran_siparis_ozeti as
Select r.ad as 'Restoran Adı', COUNT(s.siparis_id) as 'Toplam Sipariş Sayısı', Sum(r.toplam_gelir) as 'Restoran Toplam Gelir', Avg(s.siparis_tutari) as 'Ortalama Sipariş Tutarı'
From Restoran as r
LEFT JOIN Siparis s ON r.restoran_id = s.restoran_id
Group By r.restoran_id, r.ad, r.toplam_gelir;
