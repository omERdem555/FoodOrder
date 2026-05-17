--Soru: Her kuryenin kaç sipariş teslim ettiğini getir.

SELECT 
    k.ad,
    k.soyad,
    COUNT(s.siparis_id) AS teslimat_sayisi
FROM Kurye ku
JOIN Kullanici k ON ku.kullanici_id = k.kullanici_id
JOIN Siparis s ON ku.kurye_id = s.kurye_id
GROUP BY k.ad, k.soyad;