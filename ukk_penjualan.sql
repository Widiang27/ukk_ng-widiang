/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424 (10.4.24-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : ukk_penjualan

 Target Server Type    : MySQL
 Target Server Version : 100424 (10.4.24-MariaDB)
 File Encoding         : 65001

 Date: 20/02/2025 14:40:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detail_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `detail_penjualan`;
CREATE TABLE `detail_penjualan`  (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_penjualan` int NOT NULL,
  `id_produk` int NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE,
  INDEX `id_penjualan`(`id_penjualan` ASC) USING BTREE,
  INDEX `id_produk`(`id_produk` ASC) USING BTREE,
  CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detail_penjualan
-- ----------------------------
INSERT INTO `detail_penjualan` VALUES (1, 1, 1, 2, 10000.00);
INSERT INTO `detail_penjualan` VALUES (2, 1, 2, 1, 3000.00);
INSERT INTO `detail_penjualan` VALUES (3, 2, 3, 3, 6000.00);
INSERT INTO `detail_penjualan` VALUES (4, 2, 4, 1, 3000.00);
INSERT INTO `detail_penjualan` VALUES (5, 3, 1, 1, 5000.00);
INSERT INTO `detail_penjualan` VALUES (6, 3, 5, 1, 6000.00);
INSERT INTO `detail_penjualan` VALUES (7, 4, 2, 2, 6000.00);
INSERT INTO `detail_penjualan` VALUES (8, 4, 3, 2, 4000.00);
INSERT INTO `detail_penjualan` VALUES (9, 5, 5, 3, 18000.00);
INSERT INTO `detail_penjualan` VALUES (10, 6, 2, 4, 200000.00);
INSERT INTO `detail_penjualan` VALUES (11, 7, 1, 50, 20000.00);

-- ----------------------------
-- Table structure for histori_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `histori_penjualan`;
CREATE TABLE `histori_penjualan`  (
  `id_histori` int NOT NULL AUTO_INCREMENT,
  `id_penjualan` int NULL DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_histori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of histori_penjualan
-- ----------------------------
INSERT INTO `histori_penjualan` VALUES (1, 6, '2025-02-20 07:43:44', 'Transaksi baru dengan total Rp 200000.00 menggunakan DANA');
INSERT INTO `histori_penjualan` VALUES (2, 7, '2025-02-20 13:34:20', 'Transaksi baru dengan total Rp 20000.00 menggunakan OVO');

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan`  (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
INSERT INTO `pelanggan` VALUES (1, 'ghi', 'sekupang', '081234567890');
INSERT INTO `pelanggan` VALUES (2, 'wid', 'batam center', '082345678901');
INSERT INTO `pelanggan` VALUES (3, 'nic', 'baloi', '083456789012');

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `total_harga` decimal(10, 2) NOT NULL,
  `metode_pembayaran` enum('QRIS','DANA','OVO','Cash') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_penjualan`) USING BTREE,
  INDEX `id_pelanggan`(`id_pelanggan` ASC) USING BTREE,
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES (1, 1, '2025-02-19', 15000.00, 'Cash');
INSERT INTO `penjualan` VALUES (2, 2, '2025-02-19', 9000.00, 'QRIS');
INSERT INTO `penjualan` VALUES (3, 3, '2025-02-20', 12000.00, 'DANA');
INSERT INTO `penjualan` VALUES (4, 1, '2025-02-20', 18000.00, 'OVO');
INSERT INTO `penjualan` VALUES (5, 2, '2025-02-21', 20000.00, 'Cash');
INSERT INTO `penjualan` VALUES (6, 2, '2025-03-13', 200000.00, 'DANA');
INSERT INTO `penjualan` VALUES (7, 2, '2025-02-20', 20000.00, 'OVO');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` decimal(10, 2) NOT NULL,
  `harga_beli` decimal(10, 2) NOT NULL,
  `stok` int NOT NULL,
  PRIMARY KEY (`id_produk`) USING BTREE,
  INDEX `id_produk`(`stok` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 'Buku Tulis', 5000.00, 3000.00, 0);
INSERT INTO `produk` VALUES (2, 'Pulpen', 3000.00, 1500.00, 29);
INSERT INTO `produk` VALUES (3, 'Penghapus', 2000.00, 1000.00, 0);
INSERT INTO `produk` VALUES (4, 'Pensil', 4000.00, 2500.00, 10);
INSERT INTO `produk` VALUES (5, 'Penggaris', 6000.00, 3500.00, 5);

-- ----------------------------
-- Triggers structure for table detail_penjualan
-- ----------------------------
DROP TRIGGER IF EXISTS `cek_stok`;
delimiter ;;
CREATE TRIGGER `cek_stok` BEFORE INSERT ON `detail_penjualan` FOR EACH ROW BEGIN
    DECLARE jumlah_stok INT;

    -- Ambil stok barang
    SELECT stok INTO jumlah_stok FROM produk WHERE id_produk = NEW.id_produk;

    -- Cek apakah stok cukup
    IF jumlah_stok < NEW.jumlah THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stok tidak mencukupi!';
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detail_penjualan
-- ----------------------------
DROP TRIGGER IF EXISTS `kurangi_stok`;
delimiter ;;
CREATE TRIGGER `kurangi_stok` AFTER INSERT ON `detail_penjualan` FOR EACH ROW BEGIN
    UPDATE produk
    SET stok = stok - NEW.jumlah
    WHERE id_produk = NEW.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penjualan
-- ----------------------------
DROP TRIGGER IF EXISTS `simpan_histori`;
delimiter ;;
CREATE TRIGGER `simpan_histori` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
    INSERT INTO histori_penjualan (id_penjualan, deskripsi)
    VALUES (NEW.id_penjualan, CONCAT('Transaksi baru dengan total Rp ', NEW.total_harga, ' menggunakan ', NEW.metode_pembayaran));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
