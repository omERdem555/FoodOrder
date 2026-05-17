--Soru: Her restoranın ortalama değerlendirme puanını hesapla.

SELECT 
    r.ad,
    AVG(d.puan) AS ortalama_puan
FROM Degerlendirme d
JOIN Restoran r ON d.restoran_id = r.restoran_id
GROUP BY r.ad;