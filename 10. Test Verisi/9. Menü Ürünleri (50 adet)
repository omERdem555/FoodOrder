INSERT INTO MenuUrun (kategori_id, urun_ad, fiyat)
SELECT 
(kategori_id),
CONCAT('Urun ',kategori_id,'-',v.number),
(10 + v.number)
FROM MenuKategori
CROSS JOIN master..spt_values v
WHERE v.type='P' AND v.number BETWEEN 1 AND 5;