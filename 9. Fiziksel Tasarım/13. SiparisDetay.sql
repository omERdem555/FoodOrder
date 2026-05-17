CREATE TABLE SiparisDetay (
    siparis_detay_id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT CHECK (adet > 0),
    birim_fiyat DECIMAL(10,2) CHECK (birim_fiyat > 0),

    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id),
    FOREIGN KEY (urun_id) REFERENCES MenuUrun(urun_id)
);