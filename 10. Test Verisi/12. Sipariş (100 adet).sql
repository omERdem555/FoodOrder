INSERT INTO Siparis (musteri_id, restoran_id, kurye_id, adres_id, siparis_tutari, durum, teslimat_turu)
SELECT
(musteri_id),
((musteri_id % 5) + 1),
CASE WHEN musteri_id % 2 = 0 THEN 1 ELSE NULL END,
1,
50 + musteri_id,
'Delivered',
CASE WHEN musteri_id % 2 = 0 THEN 'delivery' ELSE 'pickup' END
FROM Musteri
CROSS JOIN (SELECT TOP 5 1 x FROM sys.objects) t;