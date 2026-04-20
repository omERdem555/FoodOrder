CREATE VIEW vw_siparis_detay AS
SELECT 
    s.siparis_id,
    k.ad,
    k.soyad,
    r.ad AS restoran_ad,
    s.siparis_tutari,
    s.durum,
    s.siparis_tarihi
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.musteri_id
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
JOIN Restoran r ON s.restoran_id = r.restoran_id;