Select r.ad as 'Restoran Adı', COUNT(s.siparis_id)  as 'Toplam Sipariş Sayısı'
From Restoran as r
Left Join Siparis as s On r.restoran_id = s.restoran_id
Group By r.ad