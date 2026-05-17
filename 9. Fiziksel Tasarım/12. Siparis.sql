CREATE TABLE Siparis (
    siparis_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    restoran_id INT NOT NULL,
    kurye_id INT NULL,
    adres_id INT NULL,
    siparis_tutari DECIMAL(10,2) CHECK (siparis_tutari > 0),
    durum VARCHAR(50),
    teslimat_turu VARCHAR(20) CHECK (teslimat_turu IN ('delivery', 'pickup')),
    siparis_tarihi DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (restoran_id) REFERENCES Restoran(restoran_id),
    FOREIGN KEY (kurye_id) REFERENCES Kurye(kurye_id),
    FOREIGN KEY (adres_id) REFERENCES Adres(adres_id)
);