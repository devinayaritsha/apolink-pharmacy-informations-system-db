-- create table patient
CREATE TABLE apolink.pasien (
    pasien_id SERIAL PRIMARY KEY,
    nama_pasien VARCHAR(100) NOT NULL,
    jenis_kelamin VARCHAR(10),
    tanggal_lahir DATE,
    alamat TEXT,
    no_telp VARCHAR(20),
    no_rm VARCHAR(30) UNIQUE
);

-- create table product
CREATE TABLE apolink.produk (
    produk_id SERIAL PRIMARY KEY,
    nama_produk VARCHAR(150) NOT NULL,
    kategori VARCHAR(100),
    stok INTEGER NOT NULL DEFAULT 0
);

-- create table supplier
CREATE TABLE apolink.supplier (
    supplier_id SERIAL PRIMARY KEY,
    nama_supplier VARCHAR(150) NOT NULL,
    alamat TEXT,
    no_telp VARCHAR(20)
);

-- create table transaction
CREATE TABLE apolink.transaksi (
    transaksi_id SERIAL PRIMARY KEY,
    pasien_id INTEGER NOT NULL,
    tanggal_transaksi TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_transaksi NUMERIC(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_transaksi_pasien
        FOREIGN KEY (pasien_id)
        REFERENCES apolink.pasien(pasien_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- create table detail transaction
CREATE TABLE apolink.detail_transaksi (
    detailtransaksi_id SERIAL PRIMARY KEY,
    transaksi_id INTEGER NOT NULL,
    produk_id INTEGER NOT NULL,
    jumlah INTEGER NOT NULL,
    harga_jual NUMERIC(12,2) NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    CONSTRAINT fk_detail_transaksi_transaksi
        FOREIGN KEY (transaksi_id)
        REFERENCES apolink.transaksi(transaksi_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_transaksi_produk
        FOREIGN KEY (produk_id)
        REFERENCES apolink.produk(produk_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- create table supplier receiving
CREATE TABLE apolink.penerimaan_barang (
    penerimaan_id SERIAL PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    tanggal_penerimaan DATE NOT NULL DEFAULT CURRENT_DATE,
    no_faktur VARCHAR(50),
    total_nilai NUMERIC(12,2) DEFAULT 0,
    CONSTRAINT fk_penerimaan_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES apolink.supplier(supplier_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- create table detail supplier receiving
CREATE TABLE apolink.detail_penerimaan (
    detailpenerimaan_id SERIAL PRIMARY KEY,
    penerimaan_id INTEGER NOT NULL,
    produk_id INTEGER NOT NULL,
    jumlah_masuk INTEGER NOT NULL,
    harga_beli NUMERIC(12,2) NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    CONSTRAINT fk_detail_penerimaan_penerimaan
        FOREIGN KEY (penerimaan_id)
        REFERENCES apolink.penerimaan_barang(penerimaan_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_penerimaan_produk
        FOREIGN KEY (produk_id)
        REFERENCES apolink.produk(produk_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- create table stock opname
CREATE TABLE apolink.stok_opname (
    stokopname_id SERIAL PRIMARY KEY,
    tanggal_opname DATE NOT NULL DEFAULT CURRENT_DATE,
    keterangan TEXT
);

-- create table detail stock opname
CREATE TABLE apolink.detail_stok_opname (
    detailstokopname_id SERIAL PRIMARY KEY,
    stokopname_id INTEGER NOT NULL,
    produk_id INTEGER NOT NULL,
    stok_sistem INTEGER NOT NULL,
    stok_fisik INTEGER NOT NULL,
    selisih INTEGER NOT NULL,

    CONSTRAINT fk_detail_opname_opname
        FOREIGN KEY (stokopname_id)
        REFERENCES apolink.stok_opname(stokopname_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_detail_opname_produk
        FOREIGN KEY (produk_id)
        REFERENCES apolink.produk(produk_id)
        ON DELETE RESTRICT
);
