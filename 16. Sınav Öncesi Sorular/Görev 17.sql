Select s.siparis_id, s.siparis_tutari, 
	Case 
		When s.siparis_tutari < 55 then 'Küçük Sipariş'
		When s.siparis_tutari between 56 and 60 then 'Orta Sipariş'
		Else 'Büyük Sipariş'
	End as 'Sipariş Tipi'
From Siparis as s