Create view vw_aktif_urunler as
Select mk.ad as 'Kategori Ad', mu.ad as 'Ürün Ad', mu.fiyat as 'Urun Fiyat'
From MenuUrun as mu
Join MenuKategori as mk On mu.kategori_id = mk.kategori_id
Where mu.aktif_mi = 1
