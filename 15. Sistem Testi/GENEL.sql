1. INSERT INTO Siparis
(musteri_id, restoran_id, kurye_id, adres_id, siparis_tutari, durum, teslimat_turu)
VALUES
(9999, 1, NULL, NULL, 150, 'hazirlaniyor', 'pickup');

Amaç:
Olmayan müşteri ile sipariş oluşturulamasın.

Çıktı:
The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Siparis__musteri__7E37BEF6". The conflict occurred in database "FoodOrder", table "dbo.Musteri", column 'musteri_id'.

Kanılanan:
✔ FK çalışıyor
✔ Veri bütünlüğü korunuyor





2. INSERT INTO MenuUrun
(kategori_id, urun_ad, fiyat, aktif_mi)
VALUES
(1, 'Hatali Urun', -50, 1);

Amaç:
Negatif fiyatlı ürün girilemesin.

Çıktı:
The INSERT statement conflicted with the CHECK constraint "CK__MenuUrun__fiyat__6B24EA82". The conflict occurred in database "FoodOrder", table "dbo.MenuUrun", column 'fiyat'.

Kanıt:
✔ fiyat > 0 kuralı aktif





3. INSERT INTO Kullanici
(ad, soyad, email, telefon, sifre)
VALUES
('Test', 'Kullanici', 'ahmet5@mail.com', '5550000000', '123');

Amaç:
Aynı email iki kez kullanılamasın. (Var olan mail ile dene)

Çıktı:
Violation of UNIQUE KEY constraint 'UQ__Kullanic__AB6E616492CF4E6D'. Cannot insert duplicate key in object 'dbo.Kullanici'. The duplicate key value is (ahmet5@mail.com).

Kanıt:
✔ Duplicate kullanıcı engelleniyor





4. Önce:
SELECT * FROM AskidaYemekHavuzu;

Sonra:
INSERT INTO AskidaYemekBagis
(musteri_id, havuz_id, tutar, anonim_mi)
VALUES
(1, 1, 100, 0);

Tekrar:
SELECT * FROM AskidaYemekHavuzu;

Beklenen:
toplam_bakiye +100

Çıktı:
(1 row affected)

Kanıt:
✔ trg_bagis_havuz_arttir çalışıyor





5. INSERT INTO AskidaYemekKullanim
(musteri_id, siparis_id, havuz_id, odeme_id, tutar)
VALUES
(2, 1, 1, 1, 40);

Amaç:
Kullanım sonrası bakiye düşsün.

Beklenen:
toplam_bakiye -40

Kanıt:
✔ trg_kullanim_havuz_azalt çalışıyor





6. INSERT INTO AskidaYemekKullanim
(musteri_id, siparis_id, havuz_id, odeme_id, tutar)
VALUES
(2, 6, 1, 6, 999999);

Amaç:
Havuzdan fazla kullanım engellensin.

Çıktı:
Msg 50000, Level 16, State 1, Procedure trg_havuz_negatif_kontrol, Line 13 [Batch Start Line 0]
Yetersiz askıda yemek bakiyesi!
Msg 3609, Level 16, State 1, Line 1
The transaction ended in the trigger. The batch has been aborted.

Kanıt:
✔ İş kuralı DB seviyesinde korunuyor






7. SELECT * FROM vw_aktif_restoranlar;

Amaç:
View doğru veri döndürüyor mu?

Beklenen:
Sadece aktif restoranlar

Kanıt:
✔ View mantıklı çalışıyor






8. SELECT * 
FROM Siparis
WHERE musteri_id = 3;

Amaç:
Execution Plan’da scan yerine seek görmek

Kontrol:
SSMS → Include Actual Execution Plan

Beklenen:
Index Seek