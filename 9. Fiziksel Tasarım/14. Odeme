CREATE TABLE Odeme (
    odeme_id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT UNIQUE,
    odeme_turu VARCHAR(50) CHECK (odeme_turu IN ('kart', 'askida_yemek')),
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    odeme_durumu VARCHAR(50),
    odeme_tarihi DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id)
);