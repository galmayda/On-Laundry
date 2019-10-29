CREATE TABLE CUSTOMER (
	id_customer char(6) not null,
	nama_customer varchar2(30),
	alamat_customer varchar2(30),
	notelp_customer int,
	email_customer varchar2(30),
	username varchar2(12),
	password varchar2(12),
	CONSTRAINT customer_pk PRIMARY KEY (id_customer) ENABLE
);

CREATE TABLE ADMIN (
	id_admin char(6) not null,
	nama_admin varchar2(30),
	notelp_admin int, 
	email_admin varchar2(30),
	CONSTRAINT admin_pk PRIMARY KEY (id_admin) ENABLE 
);

CREATE TABLE MAMANGDELIV (
	id_mamangdeliv char(6) not null,
	nama_mamangdeliv varchar2(30),
	notelp_mamangdeliv int,
	CONSTRAINT mamangdeliv_pk PRIMARY KEY (id_mamangdeliv) ENABLE
);

CREATE TABLE LAYANAN_LAUNDRY (
	id_layanan char(6) not null,
	nama_layanan varchar2(10),
	nama_parfum varchar2(10),
	harga_layanan int,
	CONSTRAINT layanan_laundry_pk PRIMARY KEY (id_layanan) ENABLE
);

CREATE TABLE PESANAN (
	id_pesanan char(6) not null,
	id_customer char(6) not null,
	id_layanan char(6) not null,
	nama_pesanan varchar2(20),
	tgl_pesanan date,
	CONSTRAINT pesanan_pk PRIMARY KEY (id_pesanan) ENABLE,
	CONSTRAINT pesanan_fk1 FOREIGN KEY (id_customer) REFERENCES customer (id_customer) ON DELETE CASCADE,
	CONSTRAINT pesanan_fk2 FOREIGN KEY (id_layanan) REFERENCES layanan_laundry (id_layanan) ON DELETE CASCADE
);

CREATE TABLE TRANSAKSI (
	id_transaksi char(6) not null,
	id_customer char(6) not null,
	id_layanan char(6) not null,
	id_mamangdeliv char(6) not null,
	id_admin char(6) not null,
	berat_laundry int,
	total_harga int,
	waktu_transaksi varchar2(20),
	CONSTRAINT transaksi_pk PRIMARY KEY (id_transaksi) ENABLE,
	CONSTRAINT transaksi_fk1 FOREIGN KEY (id_layanan) REFERENCES layanan_laundry (id_layanan) ON DELETE CASCADE,
	CONSTRAINT transaksi_fk2 FOREIGN KEY (id_mamangdeliv) REFERENCES mamangdeliv (id_mamangdeliv) ON DELETE CASCADE,
	CONSTRAINT transaksi_fk3 FOREIGN KEY (id_customer) REFERENCES customer (id_customer) ON DELETE CASCADE,
	CONSTRAINT transaksi_fk4 FOREIGN KEY (id_admin) REFERENCES admin (id_admin) ON DELETE CASCADE
);

CREATE TABLE TRANSAKSI_DETIL (
	id_transaksi_detil char(6) not null,
	id_transaksi char(6) not null,
	jumlah_laundryan number,
	CONSTRAINT transaksi_detil_pk PRIMARY KEY (id_transaksi_detil) ENABLE,
	CONSTRAINT transaksi_detil_fk FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi) ON DELETE CASCADE
);

INSERT INTO CUSTOMER VALUES('CS01','JAPRA','SUKAPURA',081399949960,'japra@gmail.com','japraku','1234');
INSERT INTO CUSTOMER VALUES('CS02','RAFIE','SUKABIRUS',081399949961,'rafie@gmail.com','rafie','2345');
INSERT INTO CUSTOMER VALUES('CS03','YULIAN','SUKAPURA',081399949962,'yulian@gmail.com','yulian','5678');
INSERT INTO CUSTOMER VALUES('CS04','KAHFI','SUKAPURA',081399949963,'kahfi@gmail.com','kahfi','6789');
INSERT INTO CUSTOMER VALUES('CS05','IRFAN','SUKABIRUS',081399949964,'irfan@gmail.com','irfan','7890');
INSERT INTO CUSTOMER VALUES('CS06','GOJI','PBB',081399949965,'goji@gmail.com','goji','89021');

INSERT INTO ADMIN VALUES('AD1','JOKO',08139999192,'joko@gmail.com');
INSERT INTO ADMIN VALUES('AD2','BAMBANG',08139999193,'bambang@gmail.com');
INSERT INTO ADMIN VALUES('AD3','METO',08139999194,'meto@gmail.com');
INSERT INTO ADMIN VALUES('AD4','SUKO',08139999195,'suko@gmail.com');
INSERT INTO ADMIN VALUES('AD5','SAPIR',08139999196,'sapir@gmail.com');

INSERT INTO MAMANGDELIV VALUES('MD1','DADANG',08133445566);
INSERT INTO MAMANGDELIV VALUES('MD2','WIRA',08133445567);
INSERT INTO MAMANGDELIV VALUES('MD3','FIKRI',08133445568);
INSERT INTO MAMANGDELIV VALUES('MD4','JAMET',08133445569);
INSERT INTO MAMANGDELIV VALUES('MD5','CUCUT',08133445561);

INSERT INTO LAYANAN_LAUNDRY VALUES('L11','Urgent','Blossom',12000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L21','Special','Blossom',6000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L31','One day','Blossom',4000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L41','Reguler','Blossom',2000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L12','Urgent','Downy',12000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L22','Special','Downy',6000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L32','One day','Downy',4000);
INSERT INTO LAYANAN_LAUNDRY VALUES('L42','Reguler','Downy',2000);

INSERT INTO PESANAN VALUES('P0001','CS02','L21','Antar Jemput',(to_date('03/09/2019','dd/mm/yyyy')));
INSERT INTO PESANAN VALUES('P0002','CS01','L12','Antar',(to_date('03/09/2019','dd/mm/yyyy')));
INSERT INTO PESANAN VALUES('P0003','CS03','L42','Jemput',(to_date('03/09/2019','dd/mm/yyyy')));
INSERT INTO PESANAN VALUES('P0004','CS04','L41','Antar Jemput',(to_date('04/09/2019','dd/mm/yyyy')));
INSERT INTO PESANAN VALUES('P0005','CS05','L31','Antar Jemput',(to_date('04/09/2019','dd/mm/yyyy')));
INSERT INTO PESANAN VALUES('P0006','CS06','L32','Antar',(to_date('05/09/2019','dd/mm/yyyy')));

INSERT INTO TRANSAKSI VALUES('T0001','CS02','L21','MD1','AD1',2,18000,'03/09/2019 15:40:25');
INSERT INTO TRANSAKSI VALUES('T0002','CS01','L12','MD2','AD2',2,48000,'03/09/2019 18:12:20');
INSERT INTO TRANSAKSI VALUES('T0003','CS03','L42','MD3','AD3',3,20000,'03/09/2019 18:51:05');
INSERT INTO TRANSAKSI VALUES('T0004','CS04','L41','MD4','AD4',2,14000,'04/09/2019 12:39:45');
INSERT INTO TRANSAKSI VALUES('T0005','CS05','L31','MD5','AD1',1,10000,'04/09/2019 16:24:08');
INSERT INTO TRANSAKSI VALUES('T0006','CS06','L32','MD1','AD5',1,20000,'05/09/2019 17:31:27');

INSERT INTO TRANSAKSI_DETIL VALUES('D0001','T0001',1);
INSERT INTO TRANSAKSI_DETIL VALUES('D0002','T0002',2);
INSERT INTO TRANSAKSI_DETIL VALUES('D0003','T0003',1);
INSERT INTO TRANSAKSI_DETIL VALUES('D0004','T0004',1);
INSERT INTO TRANSAKSI_DETIL VALUES('D0005','T0005',1);
INSERT INTO TRANSAKSI_DETIL VALUES('D0006','T0006',2);

SELECT * FROM CUSTOMER;

SELECT * FROM ADMIN;

SELECT * FROM TRANSAKSI;

SELECT id_customer,berat_laundry FROM TRANSAKSI;

SELECT id_pesanan,nama_pesanan FROM PESANAN;

SELECT id_customer,total_harga FROM TRANSAKSI WHERE berat_laundry > 1;

SELECT id_pesanan,id_customer,nama_pesanan FROM PESANAN WHERE tgl_pesanan >= (to_date('01/04/2019','dd/mm/yyyy'));

SELECT nama_customer,nama_layanan 
FROM CUSTOMER  
JOIN TRANSAKSI  
USING(id_customer)  
JOIN LAYANAN_LAUNDRY  
USING(id_layanan);

SELECT id_layanan,nama_layanan,harga_layanan  
FROM LAYANAN_LAUNDRY 
ORDER BY harga_layanan;

SELECT COUNT(id_transaksi) AS "JUMLAH TRANSAKSI" 
FROM TRANSAKSI;

SELECT nama_customer, berat_laundry 
FROM CUSTOMER 
JOIN TRANSAKSI 
USING(id_customer) 
WHERE berat_laundry > 1 
AND total_harga < 20000;