INSERT INTO Musteri (kullanici_id, dogrulanmis_ihtiyac_sahibi, musteri_bakiye)
SELECT kullanici_id,
CASE WHEN kullanici_id % 5 = 0 THEN 1 ELSE 0 END,
10000
FROM Kullanici;