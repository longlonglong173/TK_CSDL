CREATE TABLE GiangVien (
	GV nvarchar(255),
	HoTen nvarchar(255),
	DiaChi nvarchar(255),
	NgaySinh nvarchar(255)
)

CREATE TABLE DeTai (
	DT varchar(255),
	TenDT nvarchar(255),
	Cap nvarchar(255),
	KinhPhi nvarchar(255)
)

CREATE TABLE ThamGia (
	GV nvarchar(255),
	DT nvarchar(255),
	SoGio int
)

INSERT INTO GiangVien (GV, HoTen, DiaChi, NgaySinh)
VALUES ('GV01',N'Vũ Tuyết Trinh',N'Hoàng Mai, Hà Nội','10/10/1975');

INSERT INTO GiangVien (GV, HoTen, DiaChi, NgaySinh)
VALUES ('GV02',N'Nguyễn Nhật Quang',N'Hai Bà Trưng, Hà Nội','03/11/1976');

INSERT INTO GiangVien (GV, HoTen, DiaChi, NgaySinh)
VALUES ('GV03',N'Trần Đức Khánh',N'Đống Đa, Hà Nội','04/06/1977');

INSERT INTO GiangVien (GV, HoTen, DiaChi, NgaySinh)
VALUES ('GV04',N'Nguyễn Hồng Phương',N'Tây Hồ, Hà Nội','10/12/1983');

INSERT INTO GiangVien (GV, HoTen, DiaChi, NgaySinh)
VALUES ('GV05', N'Lê Thanh Hương', N'Hai Bà Trưng, Hà Nội','10/10/1976');

INSERT INTO DeTai (DT, TenDT, Cap, KinhPhi)
VALUES ('DT01',N'Tính toán lưới',N'Nhà nước','700');

INSERT INTO DeTai (DT, TenDT, Cap, KinhPhi)
VALUES ('DT02',N'Phát hiện tri thức',N'Bộ','300');

INSERT INTO DeTai (DT, TenDT, Cap, KinhPhi)
VALUES ('DT03',N'Phân loại văn bản',N'Bộ','270');

INSERT INTO DeTai (DT, TenDT, Cap, KinhPhi)
VALUES ('DT04',N'Dịch tự động Anh Việt',N'Trường','30');

INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV01','DT01','100');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV01','DT02','80');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV01','DT03','80');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV02','DT01','120');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV02','DT03','140');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV03','DT03','150');
INSERT INTO ThamGia (GV, DT, SoGio)
VALUES ('GV04','DT04','180');


--4

SELECT COUNT(GiangVien.GV) AS SoLuongDeTai, GiangVien.GV, GiangVien.HoTen, GiangVien.DiaChi, GiangVien.NgaySinh FROM GiangVien
JOIN ThamGia On GiangVien.GV = ThamGia.GV
JOIN DeTai ON DeTai.DT = ThamGia.DT
GROUP BY GiangVien.GV, GiangVien.HoTen, GiangVien.DiaChi, GiangVien.NgaySinh
HAVING COUNT(GiangVien.GV) > 1

--5
SELECT TOP(1) GiangVien.HoTen FROM GiangVien
JOIN ThamGia On GiangVien.GV = ThamGia.GV
JOIN DeTai ON DeTai.DT = ThamGia.DT
GROUP BY GiangVien.GV, GiangVien.HoTen

select Hoten From GiangVien
where GV in (select GV from ThamGia group by GV having count(GV) >= all(select count(GV) From ThamGia group by GV))

--6
SELECT TOP(1) DeTai.TenDT, DeTai.KinhPhi FROM DeTai
JOIN ThamGia On DeTai.DT = ThamGia.DT
JOIN GiangVien ON GiangVien.GV = ThamGia.GV
GROUP BY DeTai.TenDT, DeTai.KinhPhi
ORDER BY DeTai.KinhPhi DESC
 
 --8 
 select HoTen from GiangVien natural join ThamGia natural join  DeTai where extract(year from NgaySinh)<1980
 and TenDT like n'phân loại văn bản'