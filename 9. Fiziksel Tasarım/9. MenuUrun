CREATE TABLE MenuUrun (
    urun_id INT PRIMARY KEY IDENTITY(1,1),
    kategori_id INT NOT NULL,
    urun_ad VARCHAR(100) NOT NULL,
    fiyat DECIMAL(10,2) CHECK (fiyat > 0),
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (kategori_id) REFERENCES MenuKategori(kategori_id)
);