Select r.ad as Restoran_Ad, mk.ad as Menu_Kategori, Count(mu.urun_id) as Urun_Sayisi
From MenuUrun as mu
Join Restoran as r on mu.kategori_id = r.restoran_id
Join MenuKategori as mk on mu.kategori_id = mk.kategori_id
Group By r.ad, mk.ad