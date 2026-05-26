Select r. ad as 'Restoran Adı', r.puan as 'Restoran Puanı',
	Case
		When r.puan < 2 Then 'Düşük Puan'
		When r.puan between 2 and 4 Then 'Orta Seviye'
		Else 'Yüksek Puan'
	End as 'PuanTipi'
From Restoran as r
Order By r.puan Desc