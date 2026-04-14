--Soru: Her restoranın toplam kazancını hesapla.

SELECT 
    r.ad,
    SUM(s.siparis_tutari) AS toplam_gelir
FROM Siparis s
JOIN Restoran r ON s.restoran_id = r.restoran_id
GROUP BY r.ad;