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