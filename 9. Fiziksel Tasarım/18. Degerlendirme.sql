CREATE TABLE Degerlendirme (
    degerlendirme_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    restoran_id INT NOT NULL,
    puan INT CHECK (puan BETWEEN 1 AND 5),
    yorum VARCHAR(500),
    tarih DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (restoran_id) REFERENCES Restoran(restoran_id)
);