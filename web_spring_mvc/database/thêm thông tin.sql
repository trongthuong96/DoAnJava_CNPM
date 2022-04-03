-- Thêm thể loại
INSERT INTO typeproduct(name) VALUES ('Ram');
INSERT INTO typeproduct(name) VALUES ('Màn hình');
INSERT INTO typeproduct(name) VALUES ('Bàn phím, chuột');
INSERT INTO typeproduct(name) VALUES ('Ổ Cứng');
INSERT INTO typeproduct(name) VALUES ('Pin');
INSERT INTO typeproduct(name) VALUES ('Sạc');
INSERT INTO typeproduct(name) VALUES ('Linh, phụ kiện');

-- Thêm hãng sản xuất
INSERT INTO manufacturer (name) VALUES ('Samsung');
INSERT INTO manufacturer (name) VALUES ('Asus');
INSERT INTO manufacturer (name) VALUES ('Dell');
INSERT INTO manufacturer (name) VALUES ('Hp');
INSERT INTO manufacturer (name) VALUES ('Acer');
INSERT INTO manufacturer (name) VALUES ('Intel');
INSERT INTO manufacturer (name) VALUES ('Amd');
INSERT INTO manufacturer (name) VALUES ('Lenovo');
INSERT INTO manufacturer (name) VALUES ('LG');
INSERT INTO manufacturer (name) VALUES ('Gigabyte');
INSERT INTO manufacturer (name) VALUES ('Microsoft');
INSERT INTO manufacturer (name) VALUES ('MSI');
INSERT INTO manufacturer (name) VALUES ('Kingston');

-- thêm sản phẩm
INSERT INTO product (name, typeId, manufacturerId, decription, quantity, warrantyPeriod, promotion, priceImport, price, image, dateAdded) VALUES 
('Màn hình Laptop 14 inch', 2, 1, 'Kích thước: 14 inch. Độ phân giải: 1366x768', '20', '5 tháng', NULL, 1000000, 1919000, 'manlaptop.jpg', now()),
('Ram Laptop Kingston (KVR26S19S6/8 / KVR26S19S8/8) 8GB (1x8GB) DDR4 2666MHz', 1, 13, 'Dòng Ram dành cho máy tính xách tay. Loại DDR4. Dung lượng 8Gb. Bus 2666Mhz', '2', '36 tháng', NULL, 500000, 1049000, 'ram1.jpg', now()), 
('Ram Laptop Kingston (KVR32S22S8/16) 16GB (1x16GB) DDR4 3200Mhz', 1, 13, 'Dòng Ram dành cho máy tính xách tay. Loại DDR4. Dung lượng 16Gb. Bus 3200Mhz', '2', '36 tháng', NULL, 600000, 1999000, 'ram1.jpg', now()),
('Sạc Laptop Dell 19V-4.74A 90W Chân kim to củ hình chữ nhật', 6, 3, NULL, '12', '6 tháng', NULL, 100000, 299000, 'sacdell.jpg', now());




