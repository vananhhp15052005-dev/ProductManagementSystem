Create database quanlysanpham;
use quanlysanpham;

-- bảng loại sản phẩm

create table Loaisanpham (
maloai int auto_increment primary key,
tenloai varchar(100) not null,
mota varchar(200)

);


-- bảng nhà cung cấp

Create table Nhacungcap (
mancc int auto_increment primary key,
tenncc varchar (150) not null,
sodienthoai varchar(10),
email varchar(100),
diachi varchar(255)

);

--bảng sản phẩm
Create table Sanpham (
masp int auto_increment primary key,
tensp varchar(200) not null,
maloai int not null,
mancc int not null,
docgia Decimal(15,2) not null,
soluongton int not null default 0,
donvitinh varchar(30),

foreign key (maloai)
	references nhacungcap(mancc)
	
);


--bảng khách hàng 
Create table Khachhang (
makh int auto_increment primary key,
hoten varchar(150) not null,
sodienthoai varchar(15),
email varchar(100),
diachi varchar(255)

);

-- bảng hóa đơn 
Create table hoadon (
mahd int auto_increment primary key,
makh int not null,
ngaylap datetime default current_timestamp, 
tongtien decimal(15,2) default 0,
    FOREIGN KEY (makh)
        REFERENCES khachhang(makh)
);

-- bảng chi tiết hóa đơn 
Create table chitiethoadon (
mahd int not null,
masp  int not null,
soluong  int not null,
dongia decimaL(15,2)  not null,

    primary key (mahd, masp),

  foreign key (mahd)
      references hoadon(mahd)
        on delete cascade,
	foreign key (masp)
	references sanpham(masp)
	
);

-- loại sp
insert into loaisanpham (tenloai, mota) VALUES
('Điện thoại', 'Điện thoại thông minh'),
('Laptop', 'Máy tính xách tay'),
('Tai nghe', 'Các loại tai nghe'),
('Bàn phím', 'Bàn phím máy tính'),
('Chuột', 'Chuột máy tính');


-- dữ liệu nhà cung cấp
insert into nhacungcap
(tenncc, sodienthoai, email, diachi) VALUES
('Công ty Tech Việt', '0901234567',
 'techviet@gmail.com', 'TP. Hồ Chí Minh'),

('Công ty Điện tử ABC', '0912345678',
 'abc@gmail.com', 'Cần Thơ'),

('Công ty Minh Phát', '0923456789',
 'minhphat@gmail.com', 'Trà Vinh'),

('Công ty Công nghệ XYZ', '0934567890',
 'xyz@gmail.com', 'Vĩnh Long');


INSERT INTO SanPham
(TenSP, MaLoai, MaNCC, DonGia, SoLuongTon, DonViTinh) VALUES

('iPhone 15', 1, 1, 18000000, 10, 'Cái'),

('Samsung Galaxy S25', 1, 2, 22000000, 8, 'Cái'),

('Dell Inspiron 15', 2, 1, 16500000, 12, 'Cái'),

('ASUS Vivobook 15', 2, 3, 14500000, 7, 'Cái'),

('AirPods Pro 2', 3, 2, 5500000, 15, 'Cái'),

('Logitech K380', 4, 4, 850000, 20, 'Cái'),

('Logitech M331', 5, 4, 500000, 25, 'Cái');


-- tHÊM DỮ LIỆU KHÁCH HÀNG

INSERT INTO KhachHang
(HoTen, SoDienThoai, Email, DiaChi) VALUES

('Nguyễn Văn An', '0981111111',
 'an@gmail.com', 'Trà Vinh'),

('Trần Thị Bình', '0982222222',
 'binh@gmail.com', 'Cần Thơ'),

('Lê Văn Cường', '0983333333',
 'cuong@gmail.com', 'Vĩnh Long'),

('Phạm Thị Dung', '0984444444',
 'dung@gmail.com', 'Bến Tre');


-- thêm dữ liệu hóa đơn


INSERT INTO HoaDon
(MaKH, NgayLap, TongTien) VALUES

(1, '2026-09-10 09:30:00', 18000000),

(2, '2026-09-11 14:20:00', 5500000),

(3, '2026-09-12 10:15:00', 16500000);



-- tHÊM DỮ LIỆU CHI TIẾT HÓA ĐƠN


INSERT INTO ChiTietHoaDon
(MaHD, MaSP, SoLuong, DonGia) VALUES

(1, 1, 1, 18000000),

(2, 5, 1, 5500000),

(3, 3, 1, 16500000);


-- KIỂM TRA DỮ LIỆU
SELECT * FROM LoaiSanPham;

SELECT * FROM NhaCungCap;

SELECT * FROM SanPham;

SELECT * FROM KhachHang;

SELECT * FROM HoaDon;

SELECT * FROM ChiTietHoaDon;



-- hiển thị sp và nhà cung cấp


SELECT 
    sp.MaSP,
    sp.TenSP,
    lsp.TenLoai,
    ncc.TenNCC,
    sp.DonGia,
    sp.SoLuongTon,
    sp.DonViTinh
FROM SanPham sp
JOIN LoaiSanPham lsp
    ON sp.MaLoai = lsp.MaLoai
JOIN NhaCungCap ncc
    ON sp.MaNCC = ncc.MaNCC;



-- tìm kiếm sp


SELECT *
FROM SanPham
WHERE TenSP LIKE '%iPhone%';



-- hiển thị hóa đơn khách hàng


SELECT
    hd.MaHD,
    kh.HoTen,
    kh.SoDienThoai,
    hd.NgayLap,
    hd.TongTien
FROM HoaDon hd
JOIN KhachHang kh
    ON hd.MaKH = kh.MaKH;











