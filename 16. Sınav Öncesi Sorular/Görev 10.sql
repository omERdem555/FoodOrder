Select k.ad, k.soyad, s.siparis_tutari, s.durum
From Kullanici as k
Join Musteri as m On k.kullanici_id = m.kullanici_id
Join Kurye as ku On k.kullanici_id = ku.kullanici_id
Left Join Siparis as s On m.musteri_id = s.musteri_id --peki ben bu bağlantıyı kurye üzerinden (kurye_id = s.kurye_id) yaptığımda neden olmadı?
Where s.teslimat_turu = 'pickup'