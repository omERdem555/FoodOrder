Select r.ad as 'Restoran Adı', Avg(s.siparis_tutari) as 'Ortalama Sipariş Tutarı'
From Restoran as r 
Join Siparis as s On r.restoran_id = s.restoran_id
Group By r.ad