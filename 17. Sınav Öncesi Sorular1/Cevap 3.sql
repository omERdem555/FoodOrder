SELECT k.ad + ' ' + k.soyad AS Musteri, SUM(s.siparis_tutari) AS ToplamTutar, AVG(s.siparis_tutari) AS OrtalamaTutar, COUNT(s.siparis_id) AS ToplamSiparisSayisi
FROM Musteri as m
JOIN Kullanici as k ON m.kullanici_id = k.kullanici_id
JOIN Siparis as s ON m.musteri_id = s.musteri_id
GROUP BY k.ad, k.soyad;