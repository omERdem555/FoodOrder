INSERT INTO Siparis
(musteri_id, restoran_id, kurye_id, adres_id, siparis_tutari, durum, teslimat_turu)
VALUES
(9999, 1, NULL, NULL, 150, 'hazirlaniyor', 'pickup');

Amaç:
Olmayan müşteri ile sipariş oluşturulamasın.

Beklenen:
The INSERT statement conflicted with the FOREIGN KEY constraint...

Kanıt:
✔ FK çalışıyor
✔ Veri bütünlüğü korunuyor