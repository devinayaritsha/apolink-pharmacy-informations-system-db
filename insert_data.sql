-- menambahkan data di table pasien
insert into apolink.pasien (nama_pasien, jenis_kelamin, tanggal_lahir, alamat, no_telp, no_rm)
VALUES
('Andi Pratama', 'Laki-laki', '1998-05-10', 'Makassar', '081234567890', 'AP001'),
('Siti Rahma', 'Perempuan', '2000-08-16', 'Surabaya', '081234567891', 'AP002'),
('Budi Santoso', 'Laki-laki', '1995-11-20', 'Semarang', '081234567892', 'AP003'),
('Bahtiar Sirajuddin', 'Laki-Laki', '1970-08-15', 'Gowa', '0876543212', 'AP004'),
('Tata Juwita', 'Perempuan', '1980-12-15', 'Makassar', '089876543221', 'AP005');
select * from apolink.pasien;

-- menambahkan data di table supplier
INSERT INTO apolink.supplier
(nama_supplier, alamat, no_telp)
VALUES
('PT Kimia Farma', 'Jakarta', '021111111'),
('PT Kalbe Farma', 'Jakarta', '021222222'),
('PT Medika Sehat', 'Surabaya', '031333333'),
('PT Sumber Rejeki', 'Samarinda', '041444444');
select * from apolink.supplier;

-- menambahkan data di table produk
INSERT INTO apolink.produk
(nama_produk, kategori, stok)
VALUES
('Paracetamol 500mg', 'Obat', 100),
('Amoxicillin 500mg', 'Obat', 80),
('Vitamin C', 'Obat', 120),
('Masker Medis', 'Alkes', 200),
('Tensimeter Digital', 'Alkes', 10),
('Termometer Digital', 'Alkes', 15),
('Furosemide 40mg', 'Obat', 150),
('Kaos Tangan Operasi', 'Alkes', 30);
select * from apolink.produk;

-- menambahkan data di table penerimaan barang
INSERT INTO apolink.penerimaan_barang
(supplier_id, tanggal_penerimaan, no_faktur, total_nilai)
VALUES
(1, '2026-05-23', 'FKT001', 750),
(2, '2026-05-24', 'FKT002', 1000);
select * from apolink.penerimaan_barang;

-- menambahkan data di table detail penerimaan baranf
INSERT INTO apolink.detail_penerimaan
(detailpenerimaan_id, penerimaan_id, produk_id, jumlah_masuk, harga_beli, subtotal)
VALUES
(1, 1, 1, 100, 5000,500000),
(2, 2, 2, 150, 20000,3000000),
(3, 1, 7, 75, 32500,2400000);
select * from apolink.detail_penerimaan;

-- menambahkan data di table transaksi
INSERT INTO apolink.transaksi
(pasien_id, tanggal_transaksi, total_transaksi)
VALUES
(1, '2026-05-23', 489200),
(2, '2026-05-23', 57500);
select * from apolink.transaksi;

-- menambahkan data di table detail transaksi
INSERT INTO apolink.detail_transaksi
(transaksi_id, produk_id, jumlah, harga_jual, subtotal)
VALUES
(1, 1, 2, 5000, 10000),
(2, 3, 3, 5000, 15000),
(2, 4, 5, 10000, 50000);
select * from apolink.detail_transaksi;

-- menambahkan data di table stok opname
INSERT INTO apolink.stok_opname
(stokopname_id, tanggal_opname, keterangan)
VALUES
(1, '2026-04-30', 'rusak'),
(2, '2026-04-30', 'baik');
select * from apolink.stok_opname;

-- menambahkan data di detail stok opname
INSERT INTO apolink.detail_stok_opname
(detailstokopname_id, stokopname_id, produk_id, stok_sistem, stok_fisik, selisih)
VALUES
(1, 1, 3, 50, 100, 50),
(2, 2, 5, 20, 20, 0);
select * from apolink.detail_stok_opname;
