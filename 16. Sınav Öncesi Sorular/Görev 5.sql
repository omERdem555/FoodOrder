Select mu.ad, (mu.fiyat * 1.15) as 'KDVli Fiyat'
From MenuUrun mu
Where mu.ad = 'Urun 1-1'

--Normalde Update ile yapılması lazım ama ben kullanımını bilmediğim için Select ile Alias kullanımını gösterdim.

UPDATE MenuUrun
SET fiyat = fiyat * 1.15
WHERE ad = 'Urun 1-1'; --Bu şekilde de güncelleme yapabilirsin ama ben sadece fiyatı göstermek istediğim için Select kullandım. Update ile yaptığında veritabanında kalıcı olarak değişiklik olur.