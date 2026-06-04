Select r.ad as Restoran_Ad, Count(mu.urun_id) as Urun_Sayisi
From Restoran as r
Join Menu as m On r.restoran_id = m.restoran_id
Join MenuKategori as mk On m.menu_id = mk.menu_id
Join MenuUrun as mu On mk.kategori_id = mu.kategori_id
Group By r.ad
Having Count(mu.urun_id) > 5