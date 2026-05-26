Select Upper(k.ad + ' ' + k.soyad) as 'TamAd', DATEDIFF(DAY, k.kayit_tarihi, CURRENT_DATE) as 'KayitGunSayisi'
From Kullanici as k
