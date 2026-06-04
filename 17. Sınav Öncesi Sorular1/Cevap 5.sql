Select mu.ad as Urun_Ad ,COUNT(*) as toplam_satis, SUM(sd.adet) as toplam_adet
From MenuUrun as mu
Join SiparisDetay as sd on mu.urun_id = sd.urun_id
Group By mu.urun_id, mu.ad