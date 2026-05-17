INSERT INTO SiparisDetay (siparis_id, urun_id, adet, birim_fiyat)
SELECT
siparis_id,
((siparis_id % 10) + 1),
1 + (siparis_id % 3),
20
FROM Siparis;