CREATE TABLE Kurye (
    kurye_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT UNIQUE,
    arac_tipi VARCHAR(50),
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);