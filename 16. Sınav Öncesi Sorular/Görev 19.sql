SELECT k.ad, k.soyad --Müşteri olan kullanıcılar
FROM Musteri m
JOIN Kullanici k ON m.kullanici_id = k.kullanici_id
WHERE m.musteri_id NOT EXISTS (
    SELECT DISTINCT musteri_id FROM Siparis
)

Select k.ad, k.soyad --Bütün kullanıcılar
From Kullanici as k