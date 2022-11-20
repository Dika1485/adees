CREATE TABLE `akun_laundry`(
    `id` CHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `nama_laundry` VARCHAR(255) NOT NULL,
    `no_hp` VARCHAR(255) NOT NULL,
    `alamat` TEXT NOT NULL
);
ALTER TABLE
    `akun_laundry` ADD PRIMARY KEY `akun_laundry_id_primary`(`id`);
ALTER TABLE
    `akun_laundry` ADD UNIQUE `akun_laundry_username_unique`(`username`);
CREATE TABLE `jenis_paket`(
    `id_paket` CHAR(255) NOT NULL,
    `id_laundry` CHAR(255) NOT NULL,
    `nama_paket` VARCHAR(255) NOT NULL,
    `harga` INT NOT NULL,
    `isetrika` TINYINT(1) NOT NULL,
    `estimasi` INT NOT NULL
);
ALTER TABLE
    `jenis_paket` ADD PRIMARY KEY `jenis_paket_id_paket_primary`(`id_paket`);
CREATE TABLE `pesanan`(
    `id_pesanan` CHAR(255) NOT NULL,
    `id_paket` CHAR(255) NOT NULL,
    `nama_pemesan` VARCHAR(255) NOT NULL,
    `no_hp` VARCHAR(255) NOT NULL,
    `berat` INT NOT NULL,
    `alamat_pemesan` TEXT NOT NULL,
    `isjemput` TINYINT(1) NOT NULL,
    `isantar` TINYINT(1) NOT NULL,
    `harga_ongkir` INT NOT NULL,
    `estimasi` DATETIME NOT NULL,
    `tgl_pesan` DATETIME NOT NULL,
    `tgl_selesai` DATETIME NOT NULL
);
ALTER TABLE
    `pesanan` ADD PRIMARY KEY `pesanan_id_pesanan_primary`(`id_pesanan`);
CREATE TABLE `progress`(
    `id_pesanan` CHAR(255) NOT NULL,
    `waktu` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `jenis_paket` ADD CONSTRAINT `jenis_paket_id_laundry_foreign` FOREIGN KEY(`id_laundry`) REFERENCES `akun_laundry`(`id`);
ALTER TABLE
    `pesanan` ADD CONSTRAINT `pesanan_id_paket_foreign` FOREIGN KEY(`id_paket`) REFERENCES `jenis_paket`(`id_paket`);
ALTER TABLE
    `progress` ADD CONSTRAINT `progress_id_pesanan_foreign` FOREIGN KEY(`id_pesanan`) REFERENCES `pesanan`(`id_pesanan`);