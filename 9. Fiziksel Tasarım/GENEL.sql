CREATE TABLE Kullanici (
    kullanici_id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefon VARCHAR(20),
    sifre VARCHAR(255) NOT NULL,
    kayit_tarihi DATETIME NOT NULL DEFAULT GETDATE(),
    aktif_mi BIT NOT NULL DEFAULT 1
);




CREATE TABLE Musteri (
    musteri_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT UNIQUE,
    dogrulanmis_ihtiyac_sahibi BIT NOT NULL DEFAULT 0,

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);




CREATE TABLE Kurye (
    kurye_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT UNIQUE,
    arac_tipi VARCHAR(50),
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);




CREATE TABLE Admin (
    admin_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT UNIQUE,
    yetki_seviyesi INT CHECK (yetki_seviyesi >= 1),

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);




CREATE TABLE Adres (
    adres_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT NULL,
    adres_metni VARCHAR(255) NOT NULL,
    il VARCHAR(50),
    ilce VARCHAR(50),
    posta_kodu VARCHAR(10),

    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id)
);





CREATE TABLE Restoran (
    restoran_id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100) NOT NULL,
    telefon VARCHAR(20),
    adres_id INT,
    puan DECIMAL(2,1) CHECK (puan BETWEEN 0 AND 5),
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (adres_id) REFERENCES Adres(adres_id)
);




CREATE TABLE Menu (
    menu_id INT PRIMARY KEY IDENTITY(1,1),
    restoran_id INT NOT NULL,
    ad VARCHAR(100) NOT NULL,

    FOREIGN KEY (restoran_id) REFERENCES Restoran(restoran_id)
);




CREATE TABLE MenuKategori (
    kategori_id INT PRIMARY KEY IDENTITY(1,1),
    menu_id INT NOT NULL,
    kategori_ad VARCHAR(100) NOT NULL,

    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);




CREATE TABLE MenuUrun (
    urun_id INT PRIMARY KEY IDENTITY(1,1),
    kategori_id INT NOT NULL,
    urun_ad VARCHAR(100) NOT NULL,
    fiyat DECIMAL(10,2) CHECK (fiyat > 0),
    aktif_mi BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (kategori_id) REFERENCES MenuKategori(kategori_id)
);




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




CREATE TABLE SepetDetay (
    sepet_detay_id INT PRIMARY KEY IDENTITY(1,1),
    sepet_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT CHECK (adet > 0),
    birim_fiyat DECIMAL(10,2) CHECK (birim_fiyat > 0),

    FOREIGN KEY (sepet_id) REFERENCES Sepet(sepet_id),
    FOREIGN KEY (urun_id) REFERENCES MenuUrun(urun_id)
);




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




CREATE TABLE SiparisDetay (
    siparis_detay_id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT CHECK (adet > 0),
    birim_fiyat DECIMAL(10,2) CHECK (birim_fiyat > 0),

    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id),
    FOREIGN KEY (urun_id) REFERENCES MenuUrun(urun_id)
);




CREATE TABLE Odeme (
    odeme_id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT UNIQUE,
    odeme_turu VARCHAR(50) CHECK (odeme_turu IN ('kart', 'askida_yemek')),
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    odeme_durumu VARCHAR(50),
    odeme_tarihi DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id)
);




CREATE TABLE AskidaYemekHavuzu (
    havuz_id INT PRIMARY KEY IDENTITY(1,1),
    toplam_bakiye DECIMAL(10,2) CHECK (toplam_bakiye >= 0)
);




CREATE TABLE AskidaYemekBagis (
    bagis_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    havuz_id INT NOT NULL,
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    anonim_mi BIT,
    tarih DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (havuz_id) REFERENCES AskidaYemekHavuzu(havuz_id)
);




CREATE TABLE AskidaYemekKullanim (
    kullanim_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    siparis_id INT UNIQUE,
    havuz_id INT NOT NULL,
    odeme_id INT UNIQUE,
    tutar DECIMAL(10,2) CHECK (tutar > 0),
    tarih DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id),
    FOREIGN KEY (havuz_id) REFERENCES AskidaYemekHavuzu(havuz_id),
    FOREIGN KEY (odeme_id) REFERENCES Odeme(odeme_id)
);




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