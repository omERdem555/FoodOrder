SELECT k.ad + ' ' + k.soyad as 'Tam Ad', SUM(s.siparis_tutari) as 'Toplam Harcama'
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
JOIN Siparis s ON m.musteri_id = s.musteri_id
GROUP BY k.ad, k.soyad
HAVING SUM(s.siparis_tutari) > 300;