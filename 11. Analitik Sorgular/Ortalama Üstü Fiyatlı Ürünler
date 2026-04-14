--Soru: Fiyatı ortalamanın üzerinde olan ürünleri listele.

SELECT 
    urun_ad,
    fiyat
FROM MenuUrun
WHERE fiyat > (
    SELECT AVG(fiyat) FROM MenuUrun
);