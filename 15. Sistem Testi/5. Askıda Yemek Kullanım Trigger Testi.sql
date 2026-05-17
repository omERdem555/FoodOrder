INSERT INTO AskidaYemekKullanim
(musteri_id, siparis_id, havuz_id, odeme_id, tutar)
VALUES
(2, 5, 1, 5, 50);

Amaç:
Kullanım sonrası bakiye düşsün.

Beklenen:
toplam_bakiye -50

Kanıt:
✔ trg_kullanim_havuz_azalt çalışıyor