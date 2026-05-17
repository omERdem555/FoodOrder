CREATE TRIGGER trg_musteri_bakiye_kontrol
ON Siparis
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.siparis_id = d.siparis_id
        JOIN Musteri m ON i.musteri_id = m.musteri_id
        JOIN Odeme o ON i.siparis_id = o.siparis_id
        WHERE i.durum = 'teslim edildi'
          AND d.durum <> 'teslim edildi'
          AND o.odeme_turu = 'kart'
          AND m.musteri_bakiye < i.siparis_tutari
    )
    BEGIN
        RAISERROR ('Yetersiz müşteri bakiyesi!',16,1);
        ROLLBACK TRANSACTION;
    END
END;