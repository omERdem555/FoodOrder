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