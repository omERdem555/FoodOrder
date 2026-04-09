INSERT INTO AskidaYemekKullanim (musteri_id, siparis_id, havuz_id, odeme_id, tutar)
SELECT
m.musteri_id,
o.siparis_id,
1,
od.odeme_id,
od.tutar
FROM Odeme od
JOIN Siparis o ON od.siparis_id = o.siparis_id
JOIN Musteri m ON o.musteri_id = m.musteri_id
WHERE od.odeme_turu = 'askida_yemek';