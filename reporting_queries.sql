-- show patient list
select * from apolink.pasien;

-- show product list
select * from apolink.produk;

-- show patient transaction history
select t.transaksi_id, p.nama_pasien, t.tanggal_transaksi, t.total_transaksi
from apolink.transaksi t join apolink.pasien p on t.pasien_id = p.pasien_id;

-- show detail patient transaction 
select p.nama_pasien, pr.nama_produk, dt.jumlah, dt.harga_jual, dt.subtotal
from apolink.detail_transaksi dt 
	join apolink.transaksi t on dt.transaksi_id = t.transaksi_id
	join apolink.pasien p on t.pasien_id = p.pasien_id
	join apolink.produk pr on dt.produk_id = pr.produk_id;

-- show total patient per transaction
select p.nama_pasien, count (t.transaksi_id) as jumlah_transaksi
from apolink.pasien p
	join apolink.transaksi t on p.pasien_id = t.pasien_id group by p.nama_pasien;

-- show best selling product
select pr.nama_produk, sum (dt.jumlah) as total_terjual
from apolink.detail_transaksi dt
	join apolink.produk pr on dt.produk_id = pr.produk_id group by pr.nama_produk 
	order by total_terjual desc;

-- show product stock report
select produk_id, nama_produk, stok
from apolink.produk order by stok asc;

-- show critical stock report
select nama_produk, stok from apolink.produk where stok < 50;

-- show supplier receiving histroy
select pb.penerimaan_id, s.nama_supplier, pb.tanggal_penerimaan, pb.no_faktur
from apolink.penerimaan_barang pb
	join apolink.supplier s on pb.supplier_id = s.supplier_id;

-- show supplier purchase report
select s.nama_supplier, sum (pb.total_nilai) as total_pembelian
from apolink.penerimaan_barang pb
	join apolink.supplier s on pb.supplier_id = s.supplier_id group by s.nama_supplier;

-- show incoming stock card
select p.nama_produk, pb.tanggal_penerimaan,dp.jumlah_masuk,dp.harga_beli
from apolink.detail_penerimaan dp 
	join apolink.produk p on dp.produk_id = p.produk_id
	join apolink.penerimaan_barang pb on dp.penerimaan_id = pb.penerimaan_id
	order by pb.tanggal_penerimaan;

-- show outcoming stock card
select p.nama_produk, t.tanggal_transaksi,dt.jumlah
from apolink.detail_transaksi dt
	join apolink.produk p on dt.produk_id = p.produk_id
	join apolink.transaksi t on dt.transaksi_id = t.transaksi_id
	order by t.tanggal_transaksi;

-- show monthly stock report
select produk_id, nama_produk, stok
from apolink.produk order by nama_produk;

-- show monthly stock opname
select so.tanggal_opname, p.nama_produk, dso.stok_sistem, dso.stok_fisik, dso.selisih
from apolink.detail_stok_opname dso
	join apolink.stok_opname so on dso.stokopname_id = so.stokopname_id
	join apolink.produk p on dso.produk_id = p.produk_id
	order by so.tanggal_opname;
