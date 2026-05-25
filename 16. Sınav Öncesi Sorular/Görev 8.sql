Select (k.ad + ' ' + k.soyad) as 'Kullanıcı İsmi', r.ad as 'Restoran Adı', s.siparis_tarihi as 'Sipariş Tarihi', s.durum as 'Sipariş Durumu'
From Kullanici as k
Join Musteri as m On k.kullanici_id = m.kullanici_id
Join Siparis as s On m.musteri_id = s.musteri_id
Join Restoran as r On s.restoran_id = r.restoran_id
