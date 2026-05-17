CREATE TABLE Admin (
    admin_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT UNIQUE,
    yetki_seviyesi INT CHECK (yetki_seviyesi >= 1),

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);