Select mu.ad, (mu.fiyat * 1.15) as 'KDVli Fiyat'
From MenuUrun mu
Where mu.ad = 'Urun 1-1'

--Normalde Update ile yapılması lazım ama ben kullanımını bilmediğim için Select ile Alias kullanımını gösterdim.