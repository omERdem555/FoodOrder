CREATE TABLE SepetDetay (
    sepet_detay_id INT PRIMARY KEY IDENTITY(1,1),
    sepet_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT CHECK (adet > 0),
    birim_fiyat DECIMAL(10,2) CHECK (birim_fiyat > 0),

    FOREIGN KEY (sepet_id) REFERENCES Sepet(sepet_id),
    FOREIGN KEY (urun_id) REFERENCES MenuUrun(urun_id)
);