TRIGGER 1 — Bağış Yapıldığında Havuz Artmalı
Amaç:

AskidaYemekBagis → INSERT → havuz +tutar


CREATE TRIGGER trg_bagis_havuz_arttir
ON AskidaYemekBagis
AFTER INSERT
AS
BEGIN
    UPDATE h
    SET h.toplam_bakiye = h.toplam_bakiye + i.tutar
    FROM AskidaYemekHavuzu h
    JOIN inserted i ON h.havuz_id = i.havuz_id;
END;




TRIGGER 2 — Askıda Yemek Kullanılınca Havuz Azalmalı

CREATE TRIGGER trg_kullanim_havuz_azalt
ON AskidaYemekKullanim
AFTER INSERT
AS
BEGIN
    UPDATE h
    SET h.toplam_bakiye = h.toplam_bakiye - i.tutar
    FROM AskidaYemekHavuzu h
    JOIN inserted i ON h.havuz_id = i.havuz_id;
END;




3 — Negatif Bakiyeyi Engelle

CREATE TRIGGER trg_havuz_negatif_kontrol
ON AskidaYemekKullanim
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN AskidaYemekHavuzu h ON i.havuz_id = h.havuz_id
        WHERE h.toplam_bakiye < i.tutar
    )
    BEGIN
        RAISERROR ('Yetersiz askıda yemek bakiyesi!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO AskidaYemekKullanim
    (musteri_id, siparis_id, havuz_id, odeme_id, tutar, tarih)
    SELECT musteri_id, siparis_id, havuz_id, odeme_id, tutar, tarih
    FROM inserted;
END;




4 — Sipariş Tamamlanınca Gelir Güncelle

toplam_gelir DECIMAL(10,2) DEFAULT 0

CREATE TRIGGER trg_siparis_tamamlandi
ON Siparis
AFTER UPDATE
AS
BEGIN
    UPDATE r
    SET r.toplam_gelir = r.toplam_gelir + i.siparis_tutari
    FROM Restoran r
    JOIN inserted i ON r.restoran_id = i.restoran_id
    JOIN deleted d ON i.siparis_id = d.siparis_id
    WHERE i.durum = 'teslim edildi'
      AND d.durum <> 'teslim edildi';
END;