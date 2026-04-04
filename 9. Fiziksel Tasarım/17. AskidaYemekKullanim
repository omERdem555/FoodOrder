CREATE TABLE AskidaYemekKullanim (
    kullanim_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    siparis_id INT UNIQUE,
    havuz_id INT NOT NULL,
    odeme_id INT UNIQUE,
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    tarih DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id),
    FOREIGN KEY (havuz_id) REFERENCES AskidaYemekHavuzu(havuz_id),
    FOREIGN KEY (odeme_id) REFERENCES Odeme(odeme_id)
);