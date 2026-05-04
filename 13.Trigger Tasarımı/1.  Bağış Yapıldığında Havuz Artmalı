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