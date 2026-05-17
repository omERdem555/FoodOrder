--Soru: Sipariş sayısına göre müşterileri sırala (çoktan aza).

SELECT 
    k.ad,
    k.soyad,
    COUNT(s.siparis_id) AS siparis_sayisi
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
JOIN Siparis s ON m.musteri_id = s.musteri_id
GROUP BY k.ad, k.soyad
ORDER BY siparis_sayisi DESC;