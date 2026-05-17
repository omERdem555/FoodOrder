CREATE TABLE AskidaYemekHavuzu (
    havuz_id INT PRIMARY KEY IDENTITY(1,1),
    toplam_bakiye DECIMAL(10,2) CHECK (toplam_bakiye >= 0)
);