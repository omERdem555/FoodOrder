CREATE TABLE AskidaYemekBagis (
    bagis_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    havuz_id INT NOT NULL,
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    anonim_mi BIT,
    tarih DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (havuz_id) REFERENCES AskidaYemekHavuzu(havuz_id)
);