Select Upper(k.ad + ' ' + k.soyad) as 'TamAd', DATEDIFF(DAY, k.kayit_tarihi, GETDATE()) as 'KayitGunSayisi'
From Kullanici as k
