--Soru: Hiç askıda yemek bağışı yapmamış müşterileri listele.

SELECT 
    k.ad,
    k.soyad
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
WHERE m.musteri_id NOT IN (
    SELECT DISTINCT musteri_id FROM AskidaYemekBagis
);



--Soru: Toplam satış adetlerine göre en çok satılan ürünleri listele.

SELECT 
    mu.urun_ad,
    SUM(sd.adet) AS toplam_satis
FROM SiparisDetay sd
JOIN MenuUrun mu ON sd.urun_id = mu.urun_id
GROUP BY mu.urun_ad
ORDER BY toplam_satis DESC;



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



--Soru: Hiç sipariş vermemiş müşterileri listele.

SELECT 
    k.ad,
    k.soyad
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
WHERE m.musteri_id NOT IN (
    SELECT DISTINCT musteri_id FROM Siparis
);



--Soru: Her kuryenin kaç sipariş teslim ettiğini getir.

SELECT 
    k.ad,
    k.soyad,
    COUNT(s.siparis_id) AS teslimat_sayisi
FROM Kurye ku
JOIN Kullanici k ON ku.kullanici_id = k.kullanici_id
JOIN Siparis s ON ku.kurye_id = s.kurye_id
GROUP BY k.ad, k.soyad;



--Soru: Kart ve askıda yemek ödemelerinin toplam tutarlarını ayrı ayrı hesapla.

SELECT 
    odeme_turu,
    SUM(tutar) AS toplam
FROM Odeme
GROUP BY odeme_turu;



--Soru: Fiyatı ortalamanın üzerinde olan ürünleri listele.

SELECT 
    urun_ad,
    fiyat
FROM MenuUrun
WHERE fiyat > (
    SELECT AVG(fiyat) FROM MenuUrun
);



--Soru: Her restoranın ortalama değerlendirme puanını hesapla.

SELECT 
    r.ad,
    AVG(d.puan) AS ortalama_puan
FROM Degerlendirme d
JOIN Restoran r ON d.restoran_id = r.restoran_id
GROUP BY r.ad;



--Soru: Her restoranın toplam kazancını hesapla.

SELECT 
    r.ad,
    SUM(s.siparis_tutari) AS toplam_gelir
FROM Siparis s
JOIN Restoran r ON s.restoran_id = r.restoran_id
GROUP BY r.ad;



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