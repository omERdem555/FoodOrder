CREATE VIEW vw_musteri_bakiye_durumu AS
SELECT 
    k.ad,
    k.soyad,
    m.musteri_bakiye
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id;