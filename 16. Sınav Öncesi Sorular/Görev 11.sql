Select r.ad as 'Restoran Adı', Count(*) as 'Toplam Sipariş Sayısı'
From Restoran as r
Group By r.ad