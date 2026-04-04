CREATE TABLE Sepet (
    sepet_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    restoran_id INT NOT NULL,
    olusturma_tarihi DATETIME DEFAULT GETDATE(),
    guncelleme_tarihi DATETIME,
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (restoran_id) REFERENCES Restoran(restoran_id)
);