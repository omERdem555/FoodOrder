View 1 — Aktif Restoranlar
CREATE VIEW vw_aktif_restoranlar AS
SELECT 
    restoran_id,
    ad,
    telefon,
    puan
FROM Restoran
WHERE aktif_mi = 1;




View 2 — Sipariş Detaylı Görünüm (EN ÖNEMLİ)
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



View 3 — Askıda Yemek Havuz Durumu
CREATE VIEW vw_askida_havuz_durum AS
SELECT 
    h.havuz_id,
    h.toplam_bakiye,
    ISNULL(SUM(k.tutar), 0) AS toplam_kullanim,
    h.toplam_bakiye - ISNULL(SUM(k.tutar), 0) AS kalan_bakiye
FROM AskidaYemekHavuzu h
LEFT JOIN AskidaYemekKullanim k 
    ON h.havuz_id = k.havuz_id
GROUP BY h.havuz_id, h.toplam_bakiye;



View 4 — En Çok Satan Ürünler
CREATE VIEW vw_populer_urunler AS
SELECT 
    mu.urun_id,
    mu.urun_ad,
    SUM(sd.adet) AS toplam_satis
FROM SiparisDetay sd
JOIN MenuUrun mu ON sd.urun_id = mu.urun_id
GROUP BY mu.urun_id, mu.urun_ad;