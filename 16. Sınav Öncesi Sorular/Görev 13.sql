Select mu.ad as 'Ürün Adı', SUM(sd.adet) as 'Toplam Satış Adedi'
From MenuUrun as mu
Join SiparisDetay as sd On mu.urun_id = sd.urun_id
Group By sd.urun_id, mu.ad
Order By [Toplam Satış Adedi] Desc