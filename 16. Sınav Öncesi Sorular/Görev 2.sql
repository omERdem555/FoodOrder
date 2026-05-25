Select r.ad as "Restoran Adı" , r.puan as "Restoran Puanı"
From Restoran as r
Where r.aktif_mi = 1
Order By r.puan Desc;