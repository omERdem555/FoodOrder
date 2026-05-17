--Soru: Her sipariş için müşteri adı, restoran adı, ürün adı, adet ve birim fiyat bilgilerini getir.

SELECT 
    k.ad,
    k.soyad,
    r.ad AS restoran_adi,
    mu.urun_ad,
    sd.adet,
    sd.birim_fiyat
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.musteri_id
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
JOIN Restoran r ON s.restoran_id = r.restoran_id
JOIN SiparisDetay sd ON s.siparis_id = sd.siparis_id
JOIN MenuUrun mu ON sd.urun_id = mu.urun_id;