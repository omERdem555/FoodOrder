--Soru: Kart ve askıda yemek ödemelerinin toplam tutarlarını ayrı ayrı hesapla.

SELECT 
    odeme_turu,
    SUM(tutar) AS toplam
FROM Odeme
GROUP BY odeme_turu;