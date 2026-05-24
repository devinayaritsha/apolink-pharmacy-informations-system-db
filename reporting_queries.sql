-- menampilkan laporan produk terlaris
SELECT pr.nama_produk, sum (dt.jumlah) AS total_terjual
FROM apolink.detail_transaksi dt
	JOIN apolink.produk pr ON dt.produk_id = pr.produk_id 
	GROUP BY pr.nama_produk ORDER BY total_terjual DESC;
-- menampilkan laporan stok kritis
SELECT nama_produk, stok FROM apolink.produk WHERE stok < 10;
-- menampilkan total pembelian dari supplier
SELECT s.nama_supplier, sum (pb.total_nilai) AS total_pembelian
FROM apolink.penerimaan_barang pb
	JOIN apolink.supplier s ON pb.supplier_id = s.supplier_id GROUP BY s.nama_supplier;
-- menampilkan total pasien per transaksi
SELECT p.nama_pasien, COUNT (t.transaksi_id) AS jumlah_transaksi
FROM apolink.pasien p
	JOIN apolink.transaksi t ON p.pasien_id = t.pasien_id GROUP BY p.nama_pasien;
