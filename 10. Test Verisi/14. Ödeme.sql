INSERT INTO Odeme (siparis_id, odeme_turu, tutar, odeme_durumu)
SELECT
siparis_id,
CASE WHEN siparis_id % 5 = 0 THEN 'askida_yemek' ELSE 'kart' END,
siparis_tutari,
'Basarili'
FROM Siparis;