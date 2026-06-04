SELECT r.ad as Restoran_Ad, COUNT(mu.urun_id) AS ToplamUrun
FROM Restoran r
JOIN Menu m ON r.restoran_id = m.restoran_id
JOIN MenuKategori mk ON m.menu_id = mk.menu_id
JOIN MenuUrun mu ON mk.kategori_id = mu.kategori_id
GROUP BY r.ad;