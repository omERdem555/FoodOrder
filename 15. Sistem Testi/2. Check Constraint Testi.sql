INSERT INTO MenuUrun
(kategori_id, urun_ad, fiyat, aktif_mi)
VALUES
(1, 'Hatali Urun', -50, 1);

Amaç:
Negatif fiyatlı ürün girilemesin.

Beklenen:
CHECK constraint failed

Kanıt:
✔ fiyat > 0 kuralı aktif