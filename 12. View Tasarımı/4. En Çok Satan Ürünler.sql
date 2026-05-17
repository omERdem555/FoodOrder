CREATE VIEW vw_populer_urunler AS
SELECT 
    mu.urun_id,
    mu.urun_ad,
    SUM(sd.adet) AS toplam_satis
FROM SiparisDetay sd
JOIN MenuUrun mu ON sd.urun_id = mu.urun_id
GROUP BY mu.urun_id, mu.urun_ad;