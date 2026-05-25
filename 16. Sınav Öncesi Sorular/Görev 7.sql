Select (k.ad + ' ' + k.soyad) as 'Kullanıcı İsmi', s.siparis_id as 'Sipariş ID', s.siparis_tutari as 'Sipariş Tutarı'
From Kullanici as k
Join Musteri as m On k.kullanici_id = m.kullanici_id
Join Siparis as s On m.musteri_id = s.musteri_id