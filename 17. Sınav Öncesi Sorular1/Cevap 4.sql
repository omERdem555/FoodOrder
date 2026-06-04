SELECT ku.ad + ' ' + ku.soyad AS Kurye, COUNT(s.siparis_id) AS TeslimSayisi, SUM(s.siparis_tutari) AS ToplamTutar
FROM Kurye k
JOIN Kullanici ku ON k.kullanici_id = ku.kullanici_id
JOIN Siparis s ON k.kurye_id = s.kurye_id
WHERE s.durum = 'Delivered'
GROUP BY ku.ad, ku.soyad;