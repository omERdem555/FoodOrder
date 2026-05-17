CREATE TRIGGER trg_siparis_tamamlandi
ON Siparis
AFTER UPDATE
AS
BEGIN
    -- Restoran gelir artýr
    UPDATE r
    SET r.toplam_gelir = r.toplam_gelir + i.siparis_tutari
    FROM Restoran r
    JOIN inserted i ON r.restoran_id = i.restoran_id
    JOIN deleted d ON i.siparis_id = d.siparis_id
    WHERE i.durum = 'teslim edildi'
      AND d.durum <> 'teslim edildi';

    -- Müþteri bakiyesi düþür (sadece kart ödemesi)
    UPDATE m
    SET m.musteri_bakiye = m.musteri_bakiye - i.siparis_tutari
    FROM Musteri m
    JOIN inserted i ON m.musteri_id = i.musteri_id
    JOIN deleted d ON i.siparis_id = d.siparis_id
    JOIN Odeme o ON i.siparis_id = o.siparis_id
    WHERE i.durum = 'teslim edildi'
      AND d.durum <> 'teslim edildi'
      AND o.odeme_turu = 'kart';
END;