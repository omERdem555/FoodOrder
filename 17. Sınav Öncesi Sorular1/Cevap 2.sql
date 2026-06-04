Select r.ad as restoran_ad, Max(mu.fiyat) as AS EnPahaliUrun, Min(mu.fiyat) as EnUcuzUrun
From Menu as m 
Join MenuKategori as mk on m.menu_id = mk.menu_id
Join MenuUrun as mu on mk.kategori_id= mu.kategori_id
Join Restoran as r on m.restoran_id = r.restoran_id
Group by r.ad