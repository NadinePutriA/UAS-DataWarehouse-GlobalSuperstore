# Implementasi Data Warehouse dan OLAP untuk Analisis Efektivitas Diskon terhadap Profit dan Penjualan Retail pada Dataset Global Superstore

## Mata Kuliah Data Warehouse

Program Studi S1 Sains Data  
FMIPA Universitas Negeri Surabaya

### Kelompok 6

| Nama | NIM |
|------|------|
| Cintiya Agustin Nareswari | 24031554218 |
| Nadine Putri Aulia | 24031554094 |
| Nabil Putra Yuan | 24031554126 |
| Rafif Fadhillah Putra Zainuri | 24031554185 |

---

## Deskripsi Proyek

Proyek ini bertujuan untuk membangun Data Warehouse dan sistem OLAP menggunakan dataset Global Superstore. Fokus analisis yang dilakukan adalah melihat hubungan antara pemberian diskon terhadap penjualan (*sales*) dan keuntungan (*profit*) perusahaan retail.

Data transaksi diolah melalui proses ETL (*Extract, Transform, Load*), kemudian disimpan ke dalam PostgreSQL sebagai Data Warehouse dan divisualisasikan menggunakan Atoti untuk menghasilkan dashboard analitis yang interaktif.

---

## Dataset

Dataset yang digunakan adalah **Global Superstore Dataset** yang berisi data transaksi penjualan retail global selama periode 2011–2014.

Atribut utama yang digunakan meliputi:

- Customer
- Product
- Category
- Region
- Sales
- Quantity
- Discount
- Profit
- Shipping Cost
- Order Date

Jumlah data sekitar **51.290 transaksi**.

---

## Arsitektur Data Warehouse

### Grain

Satu record pada tabel fakta merepresentasikan satu transaksi penjualan produk pada suatu order.

### Fact Table

- fact_sales

### Dimension Table

- dim_customer
- dim_product
- dim_date
- dim_region
- dim_shipping

---

## Star Schema

Tambahkan gambar star schema pada bagian ini.

![Star Schema](Dashboard/star_schema.png)

---

## Tahapan Pengerjaan

### 1. Data Understanding

Melakukan eksplorasi dataset untuk memahami struktur data, atribut, dan kualitas data sebelum proses pembangunan Data Warehouse.

### 2. Data Staging

Tahapan yang dilakukan meliputi:

- Data cleaning
- Penghapusan atribut Postal Code
- Konversi format tanggal
- Pembuatan atribut Year, Quarter, dan Month
- Pembentukan tabel dimensi
- Pembentukan tabel fakta

### 3. Data Warehouse

Data Warehouse dibangun menggunakan PostgreSQL dengan pendekatan Star Schema.

### 4. Optimasi PostgreSQL

Optimasi dilakukan menggunakan:

- Indexing
- Materialized View
- EXPLAIN ANALYZE

Tujuannya untuk meningkatkan performa query analitis pada Data Warehouse.

### 5. OLAP dan Dashboard

Data yang telah tersimpan pada Data Warehouse dihubungkan dengan Atoti untuk membangun cube OLAP dan dashboard interaktif.

---

## Dashboard yang Dibuat

1. KPI Overview
2. Sales Trend Analysis
3. Discount vs Profit Analysis
4. Product Performance Analysis
5. Shipping Analysis
6. Customer Analysis
7. Profit by Category
8. OLAP Pivot Analysis

---

## Tools yang Digunakan

- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- Atoti
- GitHub

---

## Struktur Repository

```text
├── Data
│   └── Global_Superstore.csv
│
├── Notebook
│   ├── ETL.ipynb
│   └── OLAP_Atoti.ipynb
│
├── SQL
│   └── postgresql_optimization.sql
│
├── Dashboard
│   ├── dashboard1.png
│   ├── dashboard2.png
│   ├── dashboard3.png
│   ├── dashboard4.png
│   └── star_schema.png
│
├── Laporan
│   └── Laporan_UAS.pdf
│
└── README.md
```

---

## Hasil

Implementasi Data Warehouse dan OLAP berhasil dilakukan menggunakan PostgreSQL dan Atoti. Dashboard yang dihasilkan mampu menampilkan analisis multidimensi terhadap sales, profit, discount, customer, produk, wilayah, dan pengiriman sehingga dapat membantu proses pengambilan keputusan bisnis.

---

## Repository

Repository ini dibuat sebagai pemenuhan tugas Ujian Akhir Semester (UAS) Mata Kuliah Data Warehouse.
