CREATE TABLE Adres (
    adres_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT NULL,
    adres_metni VARCHAR(255) NOT NULL,
    il VARCHAR(50),
    ilce VARCHAR(50),
    posta_kodu VARCHAR(10),

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);