SELECT
    km.ad + ' ' + km.soyad AS Musteri,
    kk.ad + ' ' + kk.soyad AS Kurye,
    s.siparis_tutari,
    s.durum
FROM Siparis s
JOIN Musteri m
    ON s.musteri_id = m.musteri_id
JOIN Kullanici km
    ON m.kullanici_id = km.kullanici_id
JOIN Kurye ku
    ON s.kurye_id = ku.kurye_id
JOIN Kullanici kk
    ON ku.kullanici_id = kk.kullanici_id;