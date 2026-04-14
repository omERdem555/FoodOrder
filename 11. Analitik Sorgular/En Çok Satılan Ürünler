--Soru: Toplam satış adetlerine göre en çok satılan ürünleri listele.

SELECT 
    mu.urun_ad,
    SUM(sd.adet) AS toplam_satis
FROM SiparisDetay sd
JOIN MenuUrun mu ON sd.urun_id = mu.urun_id
GROUP BY mu.urun_ad
ORDER BY toplam_satis DESC;