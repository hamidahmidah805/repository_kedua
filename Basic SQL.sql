------------------------------------------------
---				Mengambil Data		 		---
------------------------------------------------
---   SELECT "column_name(s)" FROM "table_name"---
------------------------------------------------
------------------------------------------------

/* kalau tabel berada dalam suatu schema, 
 * maka diawal nama tabel ditambahkan nama schemanya 
 * ("schema_name"."table_name")
 *
 * urutan penulisan kolom mempengaruhi urutan kolom yg nantinya ditampilkan
 * nambahin/hapus kolom (ALTER TABLE) ga bisa sekaligus, harus 1 per-1
 * ngapus baris (DELETE) bisa sekaligus (>1 baris)
 * ; wajid ditambahkan diakhir agar ketika mau run beberapa queri sekaligus bisa 
 * kalo ada kolom/tabel yg ga bisa di select, mungkin nama kolom/tabelnya harus di kasih tanda "" 
 * 
 * 
 * *: semua kolom 
 * AS __ : Singkatan nama tabel
 * LIMIT __ : Jumlah baris yg akan ditampilkan
 * DISTINCT __ : Hanya mengambil unique value
 * ORDER BY __ : mengurutkan berdasarkan kolom tertentu (bisa "column_name" atau urutan kolom (integer)
 * DESC : jika urutannya mau dari besar ke kecil (kalo ASC ga perlu didefinisikan)
 * 
*/


-- Pilih semua kolom dari tabel (dilimitkan barisnya dan tabelnya diinisialkan)--
select * 
from Invoice as i
limit 10;


-- Pilih >1 kolom (urutan tidak sesuai tabel)--
select 
InvoiceDate, CustomerId 
from Invoice;


-- Hanya mengambil nilai-nilai yang unik --
select 
distinct BillingCountry 
from Invoice; 

-- Mengurutkan nilai-nilai pada kolom tertentu --
select 
BillingAddress, Total 
from Invoice
order by Total desc; 


select 
BillingAddress, Total 
from Invoice 
order by 2;


select 
BillingAddress, Total 
from Invoice
order by 2, 1;  


------------------------------------------------------
---   			   Membuat Tabel	   	 		   ---
------------------------------------------------------
---   CREATE TABLE "database"."schema"."table" (   ---
--- 	"column_name1" "tipe data1",               ---  
---  	"column_name2" "tipe data2"                ---
---   )	                                           ---
----------------------------------------------------
----------------------------------------------------

create table Tabel_midah (
id int,
nama varchar,
ktp bigint,
birthdate date,
gaji float,
waktu_pembelian TIMESTAMP
);

-----------------------------------------------------------
---					Memasukkan Datum 					---
-----------------------------------------------------------
---   INSERT INTO "database"."schema"."table" VALUES	---
---   ("","",""),										---		
---   ("","","")										---
-----------------------------------------------------------
-----------------------------------------------------------

insert into Tabel_midah values
(1, 'Siti Hamidah', 3201015330500504, '1999-12-03', 30000000, '2023-02-21 11:40:02'),
(2, 'Nurhasanah', 4201015330500504, '1999-11-29', 25000000,'2023-01-23 13:35:15'),
(3, 'Saepudin',4201015330500504, '2005-12-05', 20000000, '2022-08-23 17:45:34');

select 
*
from Tabel_midah; 

----------------------------------------------
---   		Mengupdate/Ganti Datum         ---
----------------------------------------------
---   UPDATE "database"."schema"."table"   ---
---   SET "column_name" = __			   ---
---   WHERE "column_name" = __			   ---
----------------------------------------------
----------------------------------------------

update Tabel_midah 
set gaji = 26000000
where nama = "Nurhasanah";


---------------------------------------------------
--- 			Menambah/Menghapus Kolom		---
---------------------------------------------------
---   ALTER TABLE "database"."schema"."table"   ---
---   ADD "column_name(s)"	"tipe_data"			---


---   DROP COLUMN "column_name(s)"			    ---
---------------------------------------------------
---------------------------------------------------


-- Menambah kolom --
alter table Tabel_midah 
add address varchar;

alter table Tabel_midah 
add telp bigint;

update Tabel_midah -- mengisi datum-datum pada kolom yg baru
set address = 'Bogor'
where id = 1;

update Tabel_midah 
set address = 'Bandung'
where id = 2;


-- Menghapus kolom --
alter table Tabel_midah 
drop column address;

alter table Tabel_midah
drop column telp;


---------------------------------------------------
---   			Menghapus Baris					---
--------------------------------------------------- 
---   DELETE FROM "database"."schema"."table"   ---
---	  WHERE "column_name" = __					---
---------------------------------------------------
---------------------------------------------------

delete from Tabel_midah 
where birthdate <= '2000-00-00' and gaji <= 28000000;


------------------------------------------------------
--- 			Menghapus semua isi tabel 		   ---
------------------------------------------------------
---   TRUNCATE TABLE "database"."schema"."table"   ---
------------------------------------------------------
------------------------------------------------------

truncate table Tabel_midah 

--------------------------------------------------
--- 			Menghapus tabel 			   ---
--------------------------------------------------
---   DROP TABLE "database"."schema"."table"   ---
--------------------------------------------------
--------------------------------------------------

drop table Tabel_midah; 