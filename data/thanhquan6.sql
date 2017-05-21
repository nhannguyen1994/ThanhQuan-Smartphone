--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bill (
    bill_id text NOT NULL,
    user_id text,
    payment_id text,
    founded_date time with time zone,
    quantity integer,
    total_cost text,
    status text
);


ALTER TABLE bill OWNER TO postgres;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE carts (
    id integer NOT NULL,
    session_user_id text,
    product_id text,
    qty text
);


ALTER TABLE carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: contact_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contact_feedback (
    contact_feedback_id text NOT NULL,
    name text,
    email text,
    phone_number integer,
    title text,
    content text
);


ALTER TABLE contact_feedback OWNER TO postgres;

--
-- Name: detailed_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detailed_bill (
    detailed_bill_id text NOT NULL,
    product_id text,
    quantity integer,
    prire text,
    total_cost text,
    status text
);


ALTER TABLE detailed_bill OWNER TO postgres;

--
-- Name: detailed_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detailed_orders (
    detailed_orders_id text NOT NULL,
    orders_id text,
    product_id text,
    product_type_id text,
    product_name text,
    quantity integer,
    price text
);


ALTER TABLE detailed_orders OWNER TO postgres;

--
-- Name: field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE field (
    field_id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    description text,
    validation text,
    required boolean,
    field_section_id text
);


ALTER TABLE field OWNER TO postgres;

--
-- Name: field_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE field_section (
    field_section_id text NOT NULL,
    name text NOT NULL,
    product_template_id text NOT NULL
);


ALTER TABLE field_section OWNER TO postgres;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE images (
    image_id text NOT NULL,
    url_image text,
    product_id text
);


ALTER TABLE images OWNER TO postgres;

--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manufacturer (
    manufacturer_id text NOT NULL,
    name text
);


ALTER TABLE manufacturer OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE news (
    news_id text NOT NULL,
    user_id text,
    title text,
    post_date time with time zone,
    content text
);


ALTER TABLE news OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    orders_id text NOT NULL,
    user_id text,
    name text,
    phone text,
    email text,
    address text,
    note text,
    status text,
    total integer,
    payment_id text,
    order_date text,
    delivery_date text
);


ALTER TABLE orders OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment (
    payment_id text NOT NULL,
    method text
);


ALTER TABLE payment OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    product_id text NOT NULL,
    product_name text,
    product_template_id text,
    product_type_id text,
    manufacturer_id text,
    sales_volume integer,
    store_day text,
    price integer,
    quantity integer,
    description json,
    main_property json,
    detail_property json,
    promotion text
);


ALTER TABLE product OWNER TO postgres;

--
-- Name: product_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_template (
    product_template_id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE product_template OWNER TO postgres;

--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_type (
    product_type_id text NOT NULL,
    name text,
    parent text
);


ALTER TABLE product_type OWNER TO postgres;

--
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_account (
    user_id integer NOT NULL,
    email text NOT NULL,
    pass text NOT NULL,
    phone text NOT NULL,
    fullname text NOT NULL,
    gender text,
    address text,
    agreement text
);


ALTER TABLE user_account OWNER TO postgres;

--
-- Name: user_account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_account_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_account_user_id_seq OWNER TO postgres;

--
-- Name: user_account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_account_user_id_seq OWNED BY user_account.user_id;


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: user_account user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_account ALTER COLUMN user_id SET DEFAULT nextval('user_account_user_id_seq'::regclass);


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bill (bill_id, user_id, payment_id, founded_date, quantity, total_cost, status) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carts (id, session_user_id, product_id, qty) FROM stdin;
269	ByQ4MaAl-	rJBsc-wRe	1
\.


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('carts_id_seq', 269, true);


--
-- Data for Name: contact_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contact_feedback (contact_feedback_id, name, email, phone_number, title, content) FROM stdin;
\.


--
-- Data for Name: detailed_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detailed_bill (detailed_bill_id, product_id, quantity, prire, total_cost, status) FROM stdin;
\.


--
-- Data for Name: detailed_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detailed_orders (detailed_orders_id, orders_id, product_id, product_type_id, product_name, quantity, price) FROM stdin;
Bkl_Wr0RxZ	BkOWH0AgZ	rJBsc-wRe	ptdt	Nokia 216 Dual Sim	1	790000
SkxZOOR0gZ	r1WddA0lW	r16uyBP0l	ptpk	Samsung Gear VR 2017	1	2350000
BJM-uO0RgW	r1WddA0lW	rJBsc-wRe	ptdt	Nokia 216 Dual Sim	1	790000
S1bWOORReW	r1WddA0lW	rJ9c9WwCe	ptdt	Samsung Galaxy J7 (2016)	1	3990000
B1e_KOAAxW	HkOFOAAlb	r16uyBP0l	ptpk	Samsung Gear VR 2017	1	2350000
Bk-dFOCRe-	HkOFOAAlb	rJ9c9WwCe	ptdt	Samsung Galaxy J7 (2016)	1	3990000
B1fdYd0Cxb	HkOFOAAlb	rJBsc-wRe	ptdt	Nokia 216 Dual Sim	1	790000
r1eCAfHJWW	H1ARMHyZ-	H1-Bq-v0g	ptdt	Samsung Galaxy S8 Plus	1	20990000
rJWR0GSJb-	H1ARMHyZ-	rJBsc-wRe	ptdt	Nokia 216 Dual Sim	2	790000
\.


--
-- Data for Name: field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY field (field_id, name, type, description, validation, required, field_section_id) FROM stdin;
Fi01	Công nghệ màn hình	text			t	FS01
Fi02	Độ phân giải	text			t	FS01
Fi03	Màn hình rộng	text			t	FS01
Fi04	Mặt kính cảm ứng	text			t	FS01
Fi05	Độ phân giải	text			f	FS02
Fi06	Quay phim	text			t	FS02
Fi07	Đèn Flash	text			f	FS02
Fi08	Chụp ảnh nâng cao	text			t	FS02
Fi09	Độ phân giải	text			t	FS03
Fi10	Videocall	text			t	FS03
Fi11	Thông tin khác	text			f	FS03
Fi12	Hệ điều hành	text			f	FS04
Fi13	Chipset (hãng SX CPU)	text			f	FS04
Fi14	Tốc độ CPU	text			f	FS04
Fi15	Chip đồ họa (GPU)	text			f	FS04
Fi16	RAM	text			f	FS05
Fi17	Bộ nhớ trong	text			f	FS05
Fi18	Bộ nhớ còn lại (khả dụng)	text			f	FS05
Fi19	Thẻ nhớ ngoài	text			f	FS05
Fi20	Mạng di động	text			f	FS06
Fi22	SIM	text			f	FS06
Fi23	Wifi	text			f	FS06
Fi24	GPS	text			f	FS06
Fi25	Bluetooth	text			f	FS06
Fi26	Cổng kết nối/sạc	text			f	FS06
Fi27	Jack tai nghe	text			f	FS06
Fi28	Kết nối khác	text			f	FS06
Fi29	Thiết kế	text			f	FS07
Fi31	Chất liệu	text			f	FS07
Fi32	Kích thước	text			f	FS07
Fi33	Trọng lượng	text			f	FS07
Fi34	Loại pin	text			f	FS08
Fi35	Dung lượng pin	text			f	FS08
Fi36	Công nghệ pin	text			f	FS08
Fi37	Bảo mật nâng cao	text			f	FS09
Fi38	Tính năng đặc biệt	text			f	FS09
Fi39	Ghi âm	text			f	FS09
Fi40	Radio	text			f	FS09
Fi41	Xem phim	text			f	FS09
Fi42	Nghe nhạc	text			f	FS09
Fi43	Loại Tivi	text			f	FS10
Fi44	Kích cỡ màn hình	text			f	FS10
Fi45	Độ phân giải	text			f	FS10
Fi46	Chỉ số hình ảnh	text			f	FS10
Fi47	Chỉ số chuyển động rõ nét	text			f	FS10
Fi48	Kết nối Internet	text			f	FS11
Fi49	Cổng HDMI	text			f	FS11
Fi50	Cổng AV	text			f	FS11
Fi51	Cổng VGA	text			f	FS11
Fi52	Cổng xuất âm thanh	text			f	FS11
Fi53	USB	text			f	FS11
Fi54	Định dạng video TV đọc được	text			f	FS11
Fi55	Định dạng phụ đề TV đọc được	text			f	FS11
Fi56	Định dạng hình ảnh TV đọc được	text			f	FS11
Fi57	Định dạng âm thanh TV đọc được	text			f	FS11
Fi58	Tích hợp đầu thu kỹ thuật số	text			f	FS11
Fi59	Hệ điều hành, giao diện	text			f	FS12
Fi60	Các ứng dụng sẵn có	text			f	FS12
Fi61	Các ứng dụng phổ biến có thể tải thêm	text			f	FS12
Fi62	Remote thông minh	text			f	FS12
Fi63	Điều khiển tivi bằng điện thoại	text			f	FS12
Fi64	Kết nối không dây với điện thoại, máy tính bảng	text			f	FS12
Fi65	Kết nối Bàn phím, chuột	text			f	FS12
Fi66	Tương tác thông minh	text			f	FS12
Fi67	Công nghệ xử lý hình ảnh	text			f	FS13
Fi68	Tivi 3D	text			f	FS13
Fi69	Công nghệ âm thanh	text			f	FS13
Fi70	Tổng công suất loa	text			f	FS13
Fi71	Công suất	text			f	FS14
Fi72	Kích thước có chân, đặt bàn	text			f	FS14
Fi73	Khối lượng có chân	text			f	FS14
Fi74	Kích thước không chân, treo tường	text			f	FS14
Fi75	Khối lượng không chân	text			f	FS14
Fi76	Nơi sản xuất	text			f	FS14
Fi77	Năm sản xuất	text			f	FS14
Fi78	Dung tích tổng	text			f	FS15
Fi79	Dung tích sử dụng	text			f	FS15
Fi80	Số người sử dụng	text			f	FS15
Fi81	Dung tích ngăn đá	text			f	FS15
Fi82	Dung tích ngăn lạnh	text			f	FS15
Fi83	Công nghệ Inverter	text			f	FS15
Fi84	Điện năng tiêu thụ	text			f	FS15
Fi85	Chế độ tiết kiệm điện khác	text			f	FS15
Fi86	Công nghệ làm lạnh	text			f	FS15
Fi87	Công nghệ kháng khuẩn, khử mùi	text			f	FS15
Fi88	Công nghệ bảo quản thực phẩm	text			f	FS15
Fi89	Tiện ích	text			f	FS15
Fi90	Kiểu tủ	text			f	FS15
Fi91	Số cửa	text			f	FS15
Fi92	Chất liệu cửa tủ lạnh	text			f	FS15
Fi93	Chất liệu khay ngăn	text			f	FS15
Fi94	Đèn chiếu sáng	text			f	FS15
Fi95	Kích thước - Khối lượng	text			f	FS15
Fi96	Nơi sản xuất	text			f	FS15
Fi97	Năm sản xuất	text			f	FS15
Fi98	Loại máy giặt	text			f	FS16
Fi99	Lồng giặt	text			f	FS16
Fi100	Khối lượng giặt	text			f	FS16
Fi101	Tốc độ quay vắt	text			f	FS16
Fi102	Lượng nước tiêu thụ chuẩn	text			f	FS16
Fi103	Hiệu suất sử dụng điện	text			f	FS16
Fi104	Kiểu động cơ	text			f	FS16
Fi105	Inverter	text			f	FS16
Fi106	Chương trình hoạt động	text			f	FS17
Fi107	Công nghệ giặt	text			f	FS17
Fi108	Tiện ích	text			f	FS17
Fi109	Chất liệu lồng giặt	text			f	FS18
Fi110	Chất liệu vỏ máy	text			f	FS18
Fi111	Chất liệu nắp máy	text			f	FS18
Fi112	Bảng điều khiển	text			f	FS18
Fi113	Số người sử dụng	text			f	FS18
Fi114	Kích thước - Khối lượng	text			f	FS18
Fi115	Nơi sản xuất	text			f	FS18
Fi116	Năm sản xuất	text			f	FS18
Fi117	Loại nồi	text			f	FS19
Fi118	Dung tích nồi	text			f	FS19
Fi119	Số người ăn	text			f	FS19
Fi120	Chất liệu lòng nồi	text			f	FS19
Fi121	Số mâm nhiệt	text			f	FS19
Fi122	Chức năng nấu	text			f	FS19
Fi123	Tiện ích	text			f	FS19
Fi124	Công nghệ nấu	text			f	FS19
Fi125	Điều khiển	text			f	FS19
Fi126	Dây điện	text			f	FS19
Fi127	Công suất	text			f	FS19
Fi128	Kích thước	text			f	FS19
Fi129	Khối lượng	text			f	FS19
Fi130	Thương hiệu của	text			f	FS19
Fi131	Nơi sản xuất	text			f	FS19
Fi132	Công suất làm lạnh	text			f	FS20
Fi133	Công suất sưởi ấm	text			f	FS20
Fi134	Phạm vi làm lạnh hiệu quả	text			f	FS20
Fi135	Công nghệ Inverter	text			f	FS20
Fi136	Loại máy	text			f	FS20
Fi137	Công suất tiêu thụ điện tối đa	text			f	FS20
Fi138	Nhãn năng lượng tiết kiệm điện	text			f	FS20
Fi139	Tiện ích	text			f	FS21
Fi140	Chế độ tiết kiệm điện	text			f	FS21
Fi141	Kháng khuẩn khử mùi	text			f	FS21
Fi142	Chế độ làm lạnh nhanh	text			f	FS21
Fi143	Chế độ gió	text			f	FS21
Fi144	Thông tin cục lạnh	text			f	FS22
Fi145	Thông tin cục nóng	text			f	FS22
Fi146	Loại Gas sử dụng	text			f	FS22
Fi147	Chiều dài lắp đặt ống đồng	text			f	FS22
Fi148	Chiều cao lắp đặt tối đa giữa cục nóng-lạnh	text			f	FS22
Fi149	Nơi lắp ráp	text			f	FS22
Fi150	Năm sản xuất	text			f	FS22
\.


--
-- Data for Name: field_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY field_section (field_section_id, name, product_template_id) FROM stdin;
FS01	Màn hình	M01
FS02	Camera sau	M01
FS03	Camera trước	M01
FS04	Hệ điều hành - CPU	M01
FS05	Bộ nhớ & Lưu trữ	M01
FS06	Kết nối	M01
FS07	Thiết kế & Trọng lượng	M01
FS08	Thông tin pin & Sạc	M01
FS09	Tiện ích	M01
FS10	Tổng quan	M02
FS11	Kết nối	M02
FS12	Thông tin Smart Tivi/ Internet Tivi	M02
FS13	Công nghệ hình ảnh, âm thanh	M02
FS14	Thông tin chung	M02
FS15	Đặc điểm sản phẩm	M03
FS16	Thông tin chung	M04
FS17	Công nghệ giặt	M04
FS18	Tổng quan	M04
FS19	Đặc điểm sản phẩm	M05
FS20	Tổng quan	M06
FS21	Tính năng	M06
FS22	Thông tin chung	M06
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY images (image_id, url_image, product_id) FROM stdin;
BkZ49WwCl	Bkg45WPRl_0.jpg	Bkg45WPRl
HJeW49WDAg	Bkg45WPRl_1.jpg	Bkg45WPRl
Sk--EqWPRg	Bkg45WPRl_2.jpg	Bkg45WPRl
BJGWNc-vCe	Bkg45WPRl_3.jpg	Bkg45WPRl
rJWMV9-w0l	BkXbEcWvAx_2.jpg	BkXbEcWvAx
rkfN5ZD0x	BkXbEcWvAx_0.jpg	BkXbEcWvAx
BkgM45ZvCl	BkXbEcWvAx_1.jpg	BkXbEcWvAx
S1xtNqbD0l	HkYVc-w0e_0.jpg	HkYVc-w0e
HkMFN9bwCx	HkYVc-w0e_2.jpg	HkYVc-w0e
rkbK4qWwAl	HkYVc-w0e_1.jpg	HkYVc-w0e
rkbbB5ZP0e	H1-Bq-v0g_1.jpg	H1-Bq-v0g
SJxZB9Ww0x	H1-Bq-v0g_0.jpg	H1-Bq-v0g
ByfWH5WDCg	H1-Bq-v0g_2.jpg	H1-Bq-v0g
BymZrcWvAe	H1-Bq-v0g_3.jpg	H1-Bq-v0g
Sy4brcWv0x	H1-Bq-v0g_4.jpg	H1-Bq-v0g
HyZGL9WvRe	r1fL5bvAg_1.jpg	r1fL5bvAg
B1gzUqZwRe	r1fL5bvAg_0.jpg	r1fL5bvAg
HJQz85WDRx	r1fL5bvAg_3.jpg	r1fL5bvAg
B1zzI5ZPCe	r1fL5bvAg_2.jpg	r1fL5bvAg
rJlrUqbwAg	S1HL5WDRl_0.jpg	S1HL5WDRl
By-BI5-vCg	S1HL5WDRl_1.jpg	S1HL5WDRl
rJQSI9WwAl	S1HL5WDRl_3.jpg	S1HL5WDRl
HJNHL9bwAe	S1HL5WDRl_4.jpg	S1HL5WDRl
H1GSLcZPAg	S1HL5WDRl_2.jpg	S1HL5WDRl
Hy3I5bDAg	BycU5ZwAx_0.jpg	BycU5ZwAx
HylnLqbPAe	BycU5ZwAx_1.jpg	BycU5ZwAx
Hk-n89-PCe	BycU5ZwAx_2.jpg	BycU5ZwAx
ryM2L5ZwCx	BycU5ZwAx_3.jpg	BycU5ZwAx
r1m28qWv0g	BycU5ZwAx_4.jpg	BycU5ZwAx
rk42L5WDAx	BycU5ZwAx_5.jpg	BycU5ZwAx
Hkr38cbDAl	BycU5ZwAx_6.jpg	BycU5ZwAx
SJIhI5bw0x	BycU5ZwAx_7.jpg	BycU5ZwAx
Syw2IqZvRe	BycU5ZwAx_8.jpg	BycU5ZwAx
Sku38c-wAg	BycU5ZwAx_9.jpg	BycU5ZwAx
ByxaUc-wAl	SkTL9ZwCg_0.jpg	SkTL9ZwCg
rJzTU5bD0l	SkTL9ZwCg_2.jpg	SkTL9ZwCg
SyWT8cbDAe	SkTL9ZwCg_1.jpg	SkTL9ZwCg
rk768cZwRx	SkTL9ZwCg_3.jpg	SkTL9ZwCg
B1Pv5bDRl	SyLvcWwAg_0.jpg	SyLvcWwAg
r1xvw5ZvRe	SyLvcWwAg_1.jpg	SyLvcWwAg
SJbvDqbPRe	SyLvcWwAg_2.jpg	SyLvcWwAg
rkfDP9WPRl	SyLvcWwAg_3.jpg	SyLvcWwAg
rkQwDqbD0l	SyLvcWwAg_4.jpg	SyLvcWwAg
HydPwcbvAl	SJVvD9-w0g_3.jpg	SJVvD9-w0g
rkwwvqWwAl	SJVvD9-w0g_2.jpg	SJVvD9-w0g
Sy8vD5ZD0e	SJVvD9-w0g_1.jpg	SJVvD9-w0g
S1HDvqWvCl	SJVvD9-w0g_0.jpg	SJVvD9-w0g
rkoDvcWvCx	SJVvD9-w0g_6.jpg	SJVvD9-w0g
HJ9vvqWPCe	SJVvD9-w0g_5.jpg	SJVvD9-w0g
r1tPP5-w0e	SJVvD9-w0g_4.jpg	SJVvD9-w0g
r13Pv9WD0e	SJVvD9-w0g_7.jpg	SJVvD9-w0g
BkxJdcZDAx	HJkuc-D0e_0.jpg	HJkuc-D0e
BJHJdqWPCe	HJkuc-D0e_5.jpg	HJkuc-D0e
ryN1d9-P0l	HJkuc-D0e_4.jpg	HJkuc-D0e
SkZy_9ZwRx	HJkuc-D0e_1.jpg	HJkuc-D0e
r17y_q-w0g	HJkuc-D0e_3.jpg	HJkuc-D0e
HJzyuqbPRl	HJkuc-D0e_2.jpg	HJkuc-D0e
rJ8Jd9ZvCg	HJkuc-D0e_6.jpg	HJkuc-D0e
Syd1d9-DAl	H1DJu9WDCe_0.jpg	H1DJu9WDCe
H151O5bD0g	H1DJu9WDCe_2.jpg	H1DJu9WDCe
S13yO5WPAe	H1DJu9WDCe_4.jpg	H1DJu9WDCe
B1tkO5bPAe	H1DJu9WDCe_1.jpg	H1DJu9WDCe
S1oyu5ZwAe	H1DJu9WDCe_3.jpg	H1DJu9WDCe
rkMud9ZP0x	By__q-D0e_2.jpg	By__q-D0e
r1xuu5-v0e	By__q-D0e_0.jpg	By__q-D0e
B1WudcbPRx	By__q-D0e_1.jpg	By__q-D0e
S1mOd9ZvRg	By__q-D0e_3.jpg	By__q-D0e
SkSu_9-w0x	Hy4d_qZvAx_0.jpg	Hy4d_qZvAx
Sy8uOcWwRg	Hy4d_qZvAx_1.jpg	Hy4d_qZvAx
HyPOucbw0e	Hy4d_qZvAx_2.jpg	Hy4d_qZvAx
BkO_d5-PCg	Hy4d_qZvAx_3.jpg	Hy4d_qZvAx
rkLlKcZD0l	SkxFcWvRe_6.jpg	SkxFcWvRe
BkNgYcWwRl	SkxFcWvRe_4.jpg	SkxFcWvRe
rJzxFcWPRg	SkxFcWvRe_2.jpg	SkxFcWvRe
S1PxtqWv0g	SkxFcWvRe_7.jpg	SkxFcWvRe
HyxeYqZDCe	SkxFcWvRe_0.jpg	SkxFcWvRe
BJHgFcZwCx	SkxFcWvRe_5.jpg	SkxFcWvRe
BJbxFqZwAx	SkxFcWvRe_1.jpg	SkxFcWvRe
Symlt9Wv0g	SkxFcWvRe_3.jpg	SkxFcWvRe
ryeYF9-DCl	ByYK9bwCe_0.jpg	ByYK9bwCe
HJbYFqWvCl	ByYK9bwCe_1.jpg	ByYK9bwCe
H1QFt9WP0e	ByYK9bwCe_3.jpg	ByYK9bwCe
rkEKK9bPRx	ByYK9bwCe_4.jpg	ByYK9bwCe
H1ftY5ZDAl	ByYK9bwCe_2.jpg	ByYK9bwCe
SyOFK9WDCg	ByYK9bwCe_8.jpg	ByYK9bwCe
HyrFtcWDRl	ByYK9bwCe_5.jpg	ByYK9bwCe
ByPtKcWDRg	ByYK9bwCe_7.jpg	ByYK9bwCe
r1FtFcWPCe	ByYK9bwCe_9.jpg	ByYK9bwCe
SkIFt9WwAl	ByYK9bwCe_6.jpg	ByYK9bwCe
BycKtqWDAl	ByYK9bwCe_10.jpg	ByYK9bwCe
Hy6KqbwCe	HknY5ZDAg_0.jpg	HknY5ZDAg
B1z6YqbPRg	HknY5ZDAg_3.jpg	HknY5ZDAg
rJxaKqbPRx	HknY5ZDAg_1.jpg	HknY5ZDAg
rymat5WD0e	HknY5ZDAg_4.jpg	HknY5ZDAg
SyVpY5bw0g	HknY5ZDAg_5.jpg	HknY5ZDAg
Hy-TK5ZvCx	HknY5ZDAg_2.jpg	HknY5ZDAg
ryBpKqZvCl	HknY5ZDAg_6.jpg	HknY5ZDAg
ByvTY5bP0x	HknY5ZDAg_8.jpg	HknY5ZDAg
HJU6YcZwCl	HknY5ZDAg_7.jpg	HknY5ZDAg
Hy-M99Zv0e	SJM9cWPCg_1.jpg	SJM9cWPCg
HJefq5-wAg	SJM9cWPCg_0.jpg	SJM9cWPCg
rk4z9q-w0g	SJM9cWPCg_4.jpg	SJM9cWPCg
H1Gzc5bD0e	SJM9cWPCg_2.jpg	SJM9cWPCg
Hkmf55-P0x	SJM9cWPCg_3.jpg	SJM9cWPCg
ryxB9qWwRe	HyBqcbvRl_0.jpg	HyBqcbvRl
HJbSq5bwRg	HyBqcbvRl_1.jpg	HyBqcbvRl
BJzBqc-DRl	HyBqcbvRl_2.jpg	HyBqcbvRl
BJXBc9-vAx	HyBqcbvRl_3.jpg	HyBqcbvRl
rkx595WPRg	rJ9c9WwCe_0.jpg	rJ9c9WwCe
Hk-qq5Zw0x	rJ9c9WwCe_1.jpg	rJ9c9WwCe
r1zq59WD0l	rJ9c9WwCe_2.jpg	rJ9c9WwCe
SyQqc5-P0l	rJ9c9WwCe_3.jpg	rJ9c9WwCe
BkV559Ww0g	rJ9c9WwCe_4.jpg	rJ9c9WwCe
HJWmjcWw0g	B1mj5ZvAl_1.jpg	B1mj5ZvAl
r1QQs9Wv0e	B1mj5ZvAl_3.jpg	B1mj5ZvAl
BJNmo9WvAl	B1mj5ZvAl_4.jpg	B1mj5ZvAl
rJfQicWP0g	B1mj5ZvAl_2.jpg	B1mj5ZvAl
SySQi5WwRe	B1mj5ZvAl_5.jpg	B1mj5ZvAl
HJlmo9WvAl	B1mj5ZvAl_0.jpg	B1mj5ZvAl
B1lrjqZw0l	rJBsc-wRe_0.jpg	rJBsc-wRe
r1zrjcWPRx	rJBsc-wRe_2.jpg	rJBsc-wRe
SJbrscWw0e	rJBsc-wRe_1.jpg	rJBsc-wRe
SyZmOyrv0e	B1XuySDRl_0.jpg	B1XuySDRl
rJf7_kHvCx	B1XuySDRl_1.jpg	B1XuySDRl
BkQQukHDAg	B1XuySDRl_2.jpg	B1XuySDRl
HkNXuySDAx	B1XuySDRl_3.jpg	B1XuySDRl
ryBmOyrP0x	B1XuySDRl_4.jpg	B1XuySDRl
SkU7_1SPRe	Sye7ukBDRl_0.jpg	Sye7ukBDRl
rJwXO1HDCx	Sye7ukBDRl_1.jpg	Sye7ukBDRl
HkdQ_kSwAx	Sye7ukBDRl_2.jpg	Sye7ukBDRl
B1_tJHDAg	r16uyBP0l_0.jpg	r16uyBP0l
ryl_tySvRe	r16uyBP0l_1.jpg	r16uyBP0l
Hy-OFJSDAg	r16uyBP0l_2.jpg	r16uyBP0l
rkMdKyrvAx	r16uyBP0l_3.jpg	r16uyBP0l
BJlgc1BDCe	B1xqyrPRg_0.jpg	B1xqyrPRg
r1ZxcyBPAg	B1xqyrPRg_1.jpg	B1xqyrPRg
HkMg51rPAe	B1xqyrPRg_2.jpg	B1xqyrPRg
HJl23JBPRl	H1n2ySvCl_0.jpg	H1n2ySvCl
ryb22JHvAe	H1n2ySvCl_1.jpg	H1n2ySvCl
SJG2h1Bw0l	H1n2ySvCl_2.jpg	H1n2ySvCl
r1emJgSDCl	SyXyxBPCx_0.jpg	SyXyxBPCx
SJZQkxBDCx	SyXyxBPCx_1.jpg	SyXyxBPCx
Bk-oylrPCg	H1iyeBPCx_1.jpg	H1iyeBPCx
SyxsygSwRe	H1iyeBPCx_0.jpg	H1iyeBPCx
B1gXggBDCl	B17exrv0x_0.jpg	B17exrv0x
rJ-QegSDAx	B17exrv0x_1.jpg	B17exrv0x
r1MmgxBPCe	B17exrv0x_2.jpg	B17exrv0x
ryXQglrvCg	B17exrv0x_3.jpg	B17exrv0x
Sk4XelBDCe	B17exrv0x_4.jpg	B17exrv0x
HJgBzgHDCe	S1rflrv0g_0.jpg	S1rflrv0g
BJZHMeHDCx	S1rflrv0g_1.jpg	S1rflrv0g
rybUgBDAg	BkiHxrDAx_0.jpg	BkiHxrDAx
BJWbUeHwCe	BkiHxrDAx_2.jpg	BkiHxrDAx
r1ebUlHwAl	BkiHxrDAx_1.jpg	BkiHxrDAx
\.


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY manufacturer (manufacturer_id, name) FROM stdin;
H01	APPLE
H02	SAMSUNG
H03	OPPO
H04	SONY
H05	ASUS
H06	HTC
H07	LENOVO
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news (news_id, user_id, title, post_date, content) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (orders_id, user_id, name, phone, email, address, note, status, total, payment_id, order_date, delivery_date) FROM stdin;
HJ6MgSBgW	1	nhung	0917885996	ltnhung@vnua.edu.vn	HN		pending	45690000	bank	2017-5-14 9:25:25	0000-00-00 00:00:00
BkOWH0AgZ	1	Nguyễn Thị Nhan	0962784131	nhank57tha@gmail.com	gia lam		pending	790000	\N	2017-5-21 15:51:11	0000-00-00 00:00:00
r1WddA0lW	1	Nguyễn Thị Nhan	0962784131	nhank57tha@gmail.com	gia lam-ha noi	mua hang	pending	7130000	\N	2017-5-21 16:5:45	0000-00-00 00:00:00
HkOFOAAlb	1	Nguyễn Thị Nhan	0962784131	nhank57tha@gmail.com	gia lam-ha noi		pending	7130000	\N	2017-5-21 16:6:7	0000-00-00 00:00:00
H1ARMHyZ-	1	Nguyễn Thị Nhan	0962784131	nhank57tha@gmail.com	gia lam-ha noi		pending	22570000	\N	2017-5-21 23:39:49	0000-00-00 00:00:00
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payment (payment_id, method) FROM stdin;
bank	Chuyển khoản ngân hàng
online	Thanh toán trực tuyến
COD	Nhận hàng trả tiền
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (product_id, product_name, product_template_id, product_type_id, manufacturer_id, sales_volume, store_day, price, quantity, description, main_property, detail_property, promotion) FROM stdin;
Bkg45WPRl	Apple iPhone 7 Plus	M01	ptdt	Apple	16	2017-01-16 09:00:00	22850000	2	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"128 GB","Chip xử lý (CPU)":"Apple A10 Fusion","Dung lượng pin (mAh)":"Chưa xác định","Hãng sản xuất":"Apple - iPhone","Hệ điều hành":"iOS","Kích thước màn hình":"5,5 inch","Máy ảnh chính":"2 Camera 12MP","RAM":"3 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, A2DP, LE","Hệ thống định vị GPS":"Có","Hồng ngoại":"Không","Hỗ trợ 3G":"Có hỗ trợ 3G và 4G","Kết nối USB":"Lightning","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"2 Camera 12MP","Máy ảnh phụ":"7 MP","Quay phim tiêu chuẩn":"4K@60fps","Tính năng khác của máy ảnh":"f/1.8, 28mm & f/2.8, 56mm"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.3","Chiều dài (mm)":"158.2","Chiều rộng (mm)":"77.9","Cân nặng (g)":"188"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"128 GB","Dung lượng thẻ nhớ tối đa":"Không hỗ trợ","Loại thẻ nhớ hỗ trợ":"Không hỗ trợ"},"Màn hình & hiển thị":{"Các tính năng khác":"Ion-strengthened glass, oleophobic coating","Cảm ứng":"3D Touch","Kiểu màn hình":"LED-backlit IPS LCD","Kích thước màn hình":"5,5 inch","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"Chưa xác định","Loại pin sử dụng":"Li-ion","Thời gian chờ 3G (giờ)":"384 tiếng","Thời gian đàm thoại 3G (giờ)":"21 tiếng"},"Nhạc chuông":{"Có loa ngoài":"2 loa Stereo","Jack cắm audio":"Lightning"},"Thông tin chung":{"Chip xử lý (CPU)":"Apple A10 Fusion","Hệ điều hành":"iOS","Phiên bản hệ điều hành":"iOS 10","RAM":"3 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"1 SIM (Nano SIM)"}}	
BkXbEcWvAx	Apple iPhone SE	M01	ptdt	Apple	6	2017-04-19 09:00:00	6190000	4	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"16 GB","Chip xử lý (CPU)":"Apple A9 2 nhân 64-bit, Dual-core 1.84 GHz Twister, PowerVR GT7600 (six-core graphics)","Dung lượng pin (mAh)":"1642 mAh","Hãng sản xuất":"Apple - iPhone","Hệ điều hành":"iOS","Kích thước màn hình":"4.0''","Máy ảnh chính":"12 MP, f/2.2","RAM":"2 GB","Độ phân giải màn hình":"640 x 1136px"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.2","Hệ thống định vị GPS":"A-GPS, GLONASS","Hỗ trợ 3G":"HSUPA, 5.76 Mbps, HSDPA, 21 Mbps, Rev. A, up to 3.1 Mbps, LTE, DC-HSDPA, 42 Mbps, 100 Mbps DL","Kết nối USB":"Lightning","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML (Safari)","Wifi":"Wi-Fi 802.11 b/g/n, Wi-Fi hotspot, dual-band"},"Giải trí & Đa phương tiện":{"Kết nối Tivi":"Có","Máy ảnh chính":"12 MP, f/2.2","Máy ảnh phụ":"1.2 MP, f/2.4","Nghe FM Radio":"Có","Nghe nhạc định dạng":"Có hỗ trợ","Quay phim tiêu chuẩn":"2160p@30fps, 1080p@30/60fps, 1080p@120fps, 720p@240fps","Tính năng khác của máy ảnh":"Face detection, 4K video recording (3840 by 2160) at 30 fps, 1080p HD video recording at 30 fps or 60 fps, 720p HD video recording at 30 fps, True Tone flash, Slo‑mo video support for 1080p at 120 fps and 720p at 240 fps, Time‑lapse video with stabilization, Cinematic video stabilization (1080p and 720p), Continuous autofocus video, Improved noise reduction, Take 8-megapixel still photos while recording 4K video, Playback zoom, 3x zoom, Video geotagging","Xem phim định dạng":"Có hỗ trợ","Xem tivi":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.6","Chiều dài (mm)":"123.8","Chiều rộng (mm)":"58.6","Cân nặng (g)":"113"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"16 GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"Không hỗ trợ","Hỗ trợ Email":"Email, Push Email","Hỗ trợ SMS":"MMS, SMS (threaded view), IMessage"},"Màn hình & hiển thị":{"Các tính năng khác":"Full sRGB standard, 500 cd/m2 max brightness (typical), Fingerprint‑resistant oleophobic coating, Support for display of multiple languages and characters simultaneously","Cảm ứng":"Cảm ứng điện dung","Kiểu màn hình":"IPS LCD, Retina Display","Kích thước màn hình":"4.0''","Độ phân giải màn hình":"640 x 1136px"},"Nguồn":{"Dung lượng pin (mAh)":"1642 mAh","Loại pin sử dụng":"Li-Po"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Báo rung, Chuông mp3, Chuông wav","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Có, Bàn phím ảo","Chip xử lý (CPU)":"Apple A9 2 nhân 64-bit, Dual-core 1.84 GHz Twister, PowerVR GT7600 (six-core graphics)","Hệ điều hành":"iOS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"iOS 9.3","Phù hợp với các mạng":"Mobifone, Vinafone, Viettel, Việt Nam Mobile, Gmobile","RAM":"2 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ java":"Không","Hỗ trợ nhiều sim":"1 SIM (Nano SIM)","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Hình ảnh, La bàn số, Ghi âm, Micro chuyên dụng chống ồn, Mạng xã hội ảo, Bản đồ, Twitter và Facebook, iCloud, IBooks, Biên tập video, Quay số","Phần mềm ứng dụng văn phòng":"Xem/chỉnh sửa văn bản","Trò chơi":"Cài đặt sẵn, Co thể cài thêm"}}	
HkYVc-w0e	Apple iPhone 7	M01	ptdt	Apple	7	2017-01-18 09:00:00	19450000	8	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"128 GB","Chip xử lý (CPU)":"Apple A10 Fusion","Dung lượng pin (mAh)":"1960 mAh","Hãng sản xuất":"Apple - iPhone","Hệ điều hành":"iOS","Kích thước màn hình":"4.7 inch","Máy ảnh chính":"12MP, phụ 7MP","RAM":"2 GB","Độ phân giải màn hình":"750 x 1334 pixel"}	{"Dữ liệu & Kết nối":{"Hỗ trợ 3G":"Có hỗ trợ 3G và 4G","Kết nối USB":"Lightning"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"12MP, phụ 7MP","Máy ảnh phụ":"7 MP","Quay phim tiêu chuẩn":"4K@60fps","Tính năng khác của máy ảnh":"f/1.8, OIS, QuadLED"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.1","Chiều dài (mm)":"138.3","Chiều rộng (mm)":"67.1","Cân nặng (g)":"138"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"128 GB","Dung lượng thẻ nhớ tối đa":"Không hỗ trợ","Loại thẻ nhớ hỗ trợ":"Không hỗ trợ"},"Màn hình & hiển thị":{"Các tính năng khác":"Ion-strengthened glass, oleophobic coating","Cảm ứng":"3D Touch","Kiểu màn hình":"LED-backlit LCD 16 triệu màu","Kích thước màn hình":"4.7 inch","Độ phân giải màn hình":"750 x 1334 pixel"},"Nguồn":{"Dung lượng pin (mAh)":"1960 mAh","Loại pin sử dụng":"Li-ion","Thời gian đàm thoại 3G (giờ)":"14 giờ"},"Nhạc chuông":{"Có loa ngoài":"2 loa Stereo","Jack cắm audio":"Lightning"},"Thông tin chung":{"Chip xử lý (CPU)":"Apple A10 Fusion","Hệ điều hành":"iOS","Phiên bản hệ điều hành":"iOS 10","RAM":"2 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"1 SIM (Nano SIM)"}}	
H1-Bq-v0g	Samsung Galaxy S8 Plus	M01	ptdt	Samsung	48	2017-01-22 09:00:00	20990000	39	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"Qualcomm MSM8998 Snapdragon 835 - US model Exynos 8895 Octa - EMEA,Octa-core (4x2.35 GHz Kryo & 4x1.9 GHz Kryo) - US model Octa-core (4x2.3 GHz & 4x1.7 GHz) - EMEA,Adreno 540 - US model","Dung lượng pin (mAh)":"3500 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"6.2''","Máy ảnh chính":"12.0 MP","RAM":"4 GB","Độ phân giải màn hình":"1440 x 2960 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v5.0, A2DP, LE, aptX","Hệ thống định vị GPS":"A-GPS, GLONASS, BDS, GALILEO","Hỗ trợ 3G":"HSDPA 850 / 900 / 1700(AWS) / 1900 / 2100, Hỗ trợ 4G LTE band 1(2100), 2(1900), 3(1800), 4(1700/2100), 5(850), 7(2600), 8(900), 17(700), 20(800), 28(700)","Kết nối USB":"Type-C 1.0","Mạng GPRS":"GSM 850 / 900 / 1800 / 1900 - SIM 1 & SIM 2","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"12.0 MP","Máy ảnh phụ":"8.0 MP","Nghe nhạc định dạng":"MP3/WAV/eAAC+/FLAC player","Quay phim tiêu chuẩn":"2160p@60fps, 1080p@120fps, HDR,","Tính năng khác của máy ảnh":"Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Ghi hình 4K cùng lúc với chụp ảnh 9MP","Xem phim định dạng":"MP4/DivX/XviD/H.265 player"},"Kích thước & khối lượng":{"Chiều cao (mm)":"8.1","Chiều dài (mm)":"159.5","Chiều rộng (mm)":"73.4","Cân nặng (g)":"173"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Các tính năng khác":"Corning Gorilla Glass 5","Kiểu màn hình":"Super AMOLED","Kích thước màn hình":"6.2''","Độ phân giải màn hình":"1440 x 2960 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3500 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Dual stereo speakers","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Qualcomm MSM8998 Snapdragon 835 - US model Exynos 8895 Octa - EMEA,Octa-core (4x2.35 GHz Kryo & 4x1.9 GHz Kryo) - US model Octa-core (4x2.3 GHz & 4x1.7 GHz) - EMEA,Adreno 540 - US model","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"THIẾT KẾ MÀN HÌNH KHÔNG VIỀN","Phiên bản hệ điều hành":"7.0 Nougat","RAM":"4 GB"}}	
BycU5ZwAx	Apple iPhone 6	M01	ptdt	Apple	50	2017-01-17 09:00:00	9590000	38	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"32GB","Chip xử lý (CPU)":"Apple A8 2 nhân 64-bit","Dung lượng pin (mAh)":"1810 mAh","Hãng sản xuất":"Apple - iPhone","Hệ điều hành":"iOS","Kích thước màn hình":"4.7''","Máy ảnh chính":"8.0 MP","RAM":"1 GB","Độ phân giải màn hình":"1334 x 750px"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.0","Hệ thống định vị GPS":"A-GPS, GLONASS","Hỗ trợ 3G":"HSDPA, HSUPA","Kết nối USB":"Lightning","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML (Safari)","Wifi":"Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"8.0 MP","Máy ảnh phụ":"1.2 MP","Nghe FM Radio":"Có","Nghe nhạc định dạng":"mp3, AAC, midi, wma, AMR","Quay phim tiêu chuẩn":"FullHD 1080p@60fps","Tính năng khác của máy ảnh":"Tự động lấy nét, Gắn thẻ địa lý, Chạm lấy nét, Nhận diện khuôn mặt, Tự động chụp khi nhận diện nụ cười, HDR, Panorama, Chống rung quang học","Xem phim định dạng":"mp4, WMV, H.264(MPEG4-AVC), H.263"},"Kích thước & khối lượng":{"Chiều cao (mm)":"6.9","Chiều dài (mm)":"138.1","Chiều rộng (mm)":"67","Cân nặng (g)":"129"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"32GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"Không hỗ trợ","Hỗ trợ Email":".., Google Mail, IMessage, Yahoo mail","Hỗ trợ SMS":"Có"},"Màn hình & hiển thị":{"Cảm ứng":"Cảm ứng điện dung, Đa điểm","Kiểu màn hình":"IPS LCD 16 triệu màu","Kích thước màn hình":"4.7''","Độ phân giải màn hình":"1334 x 750px"},"Nguồn":{"Dung lượng pin (mAh)":"1810 mAh","Loại pin sử dụng":"Li-ion","Thời gian chờ 2G (giờ)":"10 giờ","Thời gian chờ 3G (giờ)":"10 giờ","Thời gian đàm thoại 3G (giờ)":"14 giờ"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Báo rung, Chuông mp3, Chuông wav","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Bàn phím ảo","Chip xử lý (CPU)":"Apple A8 2 nhân 64-bit","Hệ điều hành":"iOS","Kiểu dáng điện thoại":"Thanh ( thẳng )","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"8.0","Phù hợp với các mạng":"Mobifone, Vinafone, Viettel, Việt Nam Mobile, Gmobile","RAM":"1 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"Không","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Cài sẵn và có thể tải thêm tại Hoàng Hà Mobile","Phần mềm ứng dụng văn phòng":".., Keynote, Page, Numbers","Trò chơi":"Cài sẵn và có thể tải thêm tại Hoàng Hà Mobile"}}	
r1fL5bvAg	Sony Xperia XZs	M01	ptdt	Sony	86	2017-01-29 09:00:00	14990000	15	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"Qualcomm MSM8996 Snapdragon 820,Quad-core (2x2.15 GHz Kryo & 2x1.6 GHz Kryo),Adreno 530","Dung lượng pin (mAh)":"2900 mAh","Hãng sản xuất":"Sony","Hệ điều hành":"Android OS","Kích thước màn hình":"5.2 inch","Máy ảnh chính":"19MP","RAM":"4 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"Bluetooth® 4.2","Hệ thống định vị GPS":"A-GPS và GLONASS","Hồng ngoại":"Không","Hỗ trợ 3G":"Có hỗ trợ 3G và 4G","Kết nối USB":"USB type C","Wifi":"802.11a / b / g / n / ac"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"19MP","Máy ảnh phụ":"13 MP","Quay phim tiêu chuẩn":"4k 2160p@30fps","Tính năng khác của máy ảnh":"Chụp chống biến dạng ảnh, Chụp ảnh trong môi trường ánh sáng yếu: ISO12800 /4000 (Video), , Ảnh HDR, Ống kính G rộng 25 mm F2.0, Thu phóng kỹ thuật số 8x, Công nghệ xử lý hình ảnh BIONZ™ cho di động SteadyShot™, Chế độ Chuyển động thông minh (chống rung 5 trục)"},"Kích thước & khối lượng":{"Chiều cao (mm)":"8.1","Chiều dài (mm)":"146","Chiều rộng (mm)":"72","Cân nặng (g)":"161"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Cảm ứng":"Điện dung đa điểm","Kiểu màn hình":"TRILUMINOS™ Display for mobile","Kích thước màn hình":"5.2 inch","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"2900 mAh","Loại pin sử dụng":"Li-ion","Thời gian chờ 2G (giờ)":"610 giờ","Thời gian chờ 3G (giờ)":"600 giờ","Thời gian đàm thoại 2G (giờ)":"17h30p","Thời gian đàm thoại 3G (giờ)":"11h40p"},"Nhạc chuông":{"Có loa ngoài":"High-Resolution Audio","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Qualcomm MSM8996 Snapdragon 820,Quad-core (2x2.15 GHz Kryo & 2x1.6 GHz Kryo),Adreno 530","Hệ điều hành":"Android OS","Phiên bản hệ điều hành":"Android 7.0 (Nougat)","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 SIM (Nano SIM)"}}	
S1HL5WDRl	Samsung Galaxy C9 Pro	M01	ptdt	Samsung	79	2017-04-21 09:00:00	11490000	49	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"8 nhân","Dung lượng pin (mAh)":"4000 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"6\\"","Máy ảnh chính":"16.0 MP","RAM":"6GB","Độ phân giải màn hình":"1920 x 1080 (FHD)"}	{"Dữ liệu & Kết nối":{"Bluetooth":"Bluetooth v4.2","Hệ thống định vị GPS":"Có","Hỗ trợ 3G":"Có hỗ trợ 4G, B1(2100), B2(1900), B5(850), B8(900)","Kết nối USB":"USB 2.0","Mạng GPRS":"GSM850, GSM900, DCS1800","Wifi":"802.11 a/b/g/n/ac 2.4+5GHz"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"16.0 MP","Máy ảnh phụ":"CMOS 16.0 MP","Nghe nhạc định dạng":"MP3, M4A, 3GA, AAC, OGG, OGA, WAV, WMA, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA","Quay phim tiêu chuẩn":"FHD (1920 x 1080)@30fps","Tính năng khác của máy ảnh":"Camera chính - Tự động lấy nét, Camera chính - Khẩu độ f/1.9","Xem phim định dạng":"MP4, M4V, 3GP, 3G2, WMV, ASF, AVI, FLV, MKV, WEBM"},"Kích thước & khối lượng":{"Chiều cao (mm)":"6.9","Chiều dài (mm)":"162.9","Chiều rộng (mm)":"80.7","Cân nặng (g)":"188"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Kiểu màn hình":"Super AMOLED 16 triệu màu","Kích thước màn hình":"6\\"","Độ phân giải màn hình":"1920 x 1080 (FHD)"},"Nguồn":{"Dung lượng pin (mAh)":"4000 mAh"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"8 nhân","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Vỏ hợp kim nhôm nguyên khối","RAM":"6GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"Dual-SIM"}}	
B1XuySDRl	Bao da Clear View Standing Cover Samsung S8 chính hãng		ptpk		36	2017-02-22 09:00:00	890000	1	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
Sye7ukBDRl	Đế Sạc không dây Samsung S8 chính hãng		ptpk		48	2017-02-19 09:00:00	1450000	7	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
SkTL9ZwCg	Oppo F3 Plus	M01	ptdt	OPPO	68	2017-02-16 09:00:00	10690000	11	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"Qualcomm MSM8976 Pro Snapdragon 653, Octa-core, Adreno 510","Dung lượng pin (mAh)":"4000 mAh","Hãng sản xuất":"OPPO","Hệ điều hành":"Android 6.0 (Marshmallow)","Kích thước màn hình":"6\\"","Máy ảnh chính":"Dual :16MB + 8MP","RAM":"4 GB","Độ phân giải màn hình":"Full HD (1080 x 1920 pixels)"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, A2DP, LE","Hệ thống định vị GPS":"A-GPS, GLONASS","Hỗ trợ 3G":"HSDPA 850 / 900 / 1700 / 1900 / 2100","Mạng GPRS":"GSM 850 / 900 / 1800 / 1900 - SIM 1 & SIM 2","Wifi":"Wi-Fi 802.11 b/g/n, Dual-band, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"Dual :16MB + 8MP","Máy ảnh phụ":"16MP","Nghe FM Radio":"Có","Nghe nhạc định dạng":"MP3/WAV/eAAC+/FLAC player","Quay phim tiêu chuẩn":"Quay phim 4K 2160p@30fps","Xem phim định dạng":"MP4/H.264 player"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.35","Chiều dài (mm)":"163.63","Chiều rộng (mm)":"80.8","Cân nặng (g)":"185"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Cảm ứng":"Cảm ứng điện dung đa điểm","Kiểu màn hình":"FHD 16 triệu màu","Kích thước màn hình":"6\\"","Độ phân giải màn hình":"Full HD (1080 x 1920 pixels)"},"Nguồn":{"Dung lượng pin (mAh)":"4000 mAh","Loại pin sử dụng":"Li-Po"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Qualcomm MSM8976 Pro Snapdragon 653, Octa-core, Adreno 510","Hệ điều hành":"Android 6.0 (Marshmallow)","Kiểu dáng điện thoại":"Nguyên khối","Phiên bản hệ điều hành":"Android OS","RAM":"4 GB"}}	
H1DJu9WDCe	Oppo F1s	M01	ptdt	OPPO	8	2017-04-17 09:00:00	6990000	24	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64GB","Chip xử lý (CPU)":"Mediatek MT6750 tám lõi 1.5GHz, Octa-core 1.5 GHz Cortex-A53","Dung lượng pin (mAh)":"3075 mAh","Hãng sản xuất":"OPPO","Hệ điều hành":"Android OS","Kích thước màn hình":"5.5 inch","Máy ảnh chính":"13 MP","RAM":"4 GB","Độ phân giải màn hình":"720 x 1280 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.0","Hệ thống định vị GPS":"A-GPS","Hồng ngoại":"Không","Hỗ trợ 3G":"Hỗ trợ 3G và 4G","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML","Wifi":"Có"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"13 MP","Máy ảnh phụ":"16 MP","Quay phim tiêu chuẩn":"1080p@30fps"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.4","Chiều dài (mm)":"154.5","Chiều rộng (mm)":"76","Cân nặng (g)":"160"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"128 GB","Hỗ trợ Email":"Có","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Các tính năng khác":"Kính cường lực Gorilla Glass 4","Cảm ứng":"Cảm ứng điện dung đa điểm","Kiểu màn hình":"IPS LCD","Kích thước màn hình":"5.5 inch","Độ phân giải màn hình":"720 x 1280 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3075 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có thể tải thêm","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Bàn phím ảo","Chip xử lý (CPU)":"Mediatek MT6750 tám lõi 1.5GHz, Octa-core 1.5 GHz Cortex-A53","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh ( thẳng )","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phù hợp với các mạng":"Đa mạng","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 sim 2 sóng (Nano sim)"}}	
r16uyBP0l	Samsung Gear VR 2017		ptpk		18	2017-01-22 09:00:00	2350000	11	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
SyLvcWwAg	Oppo F1s	M01	ptdt	OPPO	13	2017-01-25 09:00:00	5790000	28	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64GB","Chip xử lý (CPU)":"Mediatek MT6750 tám lõi 1.5GHz, Octa-core 1.5 GHz Cortex-A53","Dung lượng pin (mAh)":"3075 mAh","Hãng sản xuất":"OPPO","Hệ điều hành":"Android OS","Kích thước màn hình":"5.5 inch","Máy ảnh chính":"13 MP","RAM":"4 GB","Độ phân giải màn hình":"720 x 1280 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.0","Hệ thống định vị GPS":"A-GPS","Hồng ngoại":"Không","Hỗ trợ 3G":"Hỗ trợ 3G và 4G","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML","Wifi":"Có"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"13 MP","Máy ảnh phụ":"16 MP","Quay phim tiêu chuẩn":"1080p@30fps"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.4","Chiều dài (mm)":"154.5","Chiều rộng (mm)":"76","Cân nặng (g)":"160"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"128 GB","Hỗ trợ Email":"Có","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Các tính năng khác":"Kính cường lực Gorilla Glass 4","Cảm ứng":"Cảm ứng điện dung đa điểm","Kiểu màn hình":"IPS LCD","Kích thước màn hình":"5.5 inch","Độ phân giải màn hình":"720 x 1280 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3075 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có thể tải thêm","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Bàn phím ảo","Chip xử lý (CPU)":"Mediatek MT6750 tám lõi 1.5GHz, Octa-core 1.5 GHz Cortex-A53","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh ( thẳng )","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phù hợp với các mạng":"Đa mạng","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 sim 2 sóng (Nano sim)"}}	
B1xqyrPRg	Pin Sạc Dự Phòng Remax E5 5000mAh		ptpk		49	2017-04-28 09:00:00	130000	13	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
SJVvD9-w0g	HTC One M9S	M01	ptdt	HTC	56	2017-01-16 09:00:00	4790000	40	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"16 GB","Chip xử lý (CPU)":"Mediatek MT6795 Helio X10, Octa-core 2.2 GHz Cortex-A53, PowerVR G6200","Dung lượng pin (mAh)":"2840 mAh","Hãng sản xuất":"HTC","Hệ điều hành":"Android OS","Kích thước màn hình":"5''","Máy ảnh chính":"13 MP","RAM":"2 GB","Độ phân giải màn hình":"1080 x 1920px"}	{"Dữ liệu & Kết nối":{"Bluetooth":"Có","Hệ thống định vị GPS":"Có hỗ trợ","Hỗ trợ 3G":"Có hỗ trợ","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"Có hỗ trợ","Wifi":"Có hỗ trợ"},"Giải trí & Đa phương tiện":{"Kết nối Tivi":"Có","Máy ảnh chính":"13 MP","Máy ảnh phụ":"4 MP","Nghe FM Radio":"Có","Nghe nhạc định dạng":"mp3","Quay phim tiêu chuẩn":"1080p@30fps","Xem tivi":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"9.6","Chiều dài (mm)":"144.6","Chiều rộng (mm)":"69.7","Cân nặng (g)":"158"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"16 GB","Danh bạ có thể lưu trữ":"Có","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"Có","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Cảm ứng":"Đa điểm, Điện dung","Kiểu màn hình":"Super LCD3 capacitive touchscreen, 16M colors","Kích thước màn hình":"5''","Độ phân giải màn hình":"1080 x 1920px"},"Nguồn":{"Dung lượng pin (mAh)":"2840 mAh","Loại pin sử dụng":"Li-Po"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Có","Chip xử lý (CPU)":"Mediatek MT6795 Helio X10, Octa-core 2.2 GHz Cortex-A53, PowerVR G6200","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Tiếng Việt, Tiếng Anh","Phiên bản hệ điều hành":"v5.1 (Lollipop)","Phù hợp với các mạng":"Viettel, Vinafone, Mobifone, Việt Nam Mobile","RAM":"2 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ java":"Có","Hỗ trợ nhiều sim":"Có","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng văn phòng":"Cài sẵn và có thể tải thêm tại Hoàng Hà Mobile","Trò chơi":"Có sẵn trong máy & có thể cài thêm"}}	
rJ9c9WwCe	Samsung Galaxy J7 (2016)	M01	ptdt	Samsung	34	2017-02-19 09:00:00	3990000	37	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"16 GB","Chip xử lý (CPU)":"Adreno 405, Qualcomm MSM8952 Snapdragon 617, Octa-core (4x1.6 GHz Cortex-A53 & 4x1.0 GHz Cortex-A53)","Dung lượng pin (mAh)":"3300 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.5''","Máy ảnh chính":"13 MP","RAM":"3 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"Có","Hệ thống định vị GPS":"Có","Hồng ngoại":"Có","Hỗ trợ 3G":"Có","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML5","Wifi":"Có"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"13 MP","Máy ảnh phụ":"5.0 MP","Nghe nhạc định dạng":"MP3, M4A, 3GA, AAC, OGG, OGA, WAV, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA","Quay phim tiêu chuẩn":"FullHD 1080p@30fps","Xem phim định dạng":"MP4, M4V, 3GP, 3G2, MKV, WEBM"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.8","Chiều dài (mm)":"151.7","Chiều rộng (mm)":"76","Cân nặng (g)":"170"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"16 GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"128 GB","Hỗ trợ Email":"IM, Google Mail, Yahoo mail","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"MicroSD (T-Flash)"},"Màn hình & hiển thị":{"Các tính năng khác":"Mặt kính thường","Cảm ứng":"Điện rung đa điểm","Kiểu màn hình":"Super AMOLED 16 triệu màu","Kích thước màn hình":"5.5''","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3300 mAh","Loại pin sử dụng":"Pin chuẩn Li-Ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Có","Chip xử lý (CPU)":"Adreno 405, Qualcomm MSM8952 Snapdragon 617, Octa-core (4x1.6 GHz Cortex-A53 & 4x1.0 GHz Cortex-A53)","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"5.1.1","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"3 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ nhiều sim":"2 sim 2 sóng, Micro Sim","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Có thể tải thêm","Phần mềm ứng dụng văn phòng":"Có","Trò chơi":"Có thể cài đặt thêm"}}	
H1n2ySvCl	Sạc dự phòng Veger V12 10000 mAh		ptpk		46	2017-03-21 09:00:00	330000	3	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
HJkuc-D0e	Samsung Galaxy J3 Pro	M01	ptdt	Samsung	8	2017-01-15 09:00:00	2690000	7	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"16 GB","Chip xử lý (CPU)":"Quad-core 1.2 GHz","Dung lượng pin (mAh)":"2600 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.0\\"","Máy ảnh chính":"8.0 MP","RAM":"2 GB","Độ phân giải màn hình":"720 x 1280 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"A2DP, V4.1","Hệ thống định vị GPS":"Có","Hỗ trợ 3G":"Hỗ trợ 3G và 4G LTE","Kết nối USB":"Micro USB","Mạng EDGE":"GSM 850/900/1800/1900","Trình duyệt web":"HTML","Wifi":"Wi-Fi 802.11 b / g / n, Wi-Fi Direct, Hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"8.0 MP","Máy ảnh phụ":"5.0 MP","Nghe nhạc định dạng":"MP3, M4A, 3GA, AAC, OGG, OGA, WAV, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA","Quay phim tiêu chuẩn":"Quay phim FullHD 1080p@30fps","Xem phim định dạng":"MP4, M4V, 3GP, 3G2, MKV, WEBM"},"Kích thước & khối lượng":{"Chiều cao (mm)":"8","Chiều dài (mm)":"142,2","Chiều rộng (mm)":"71,3","Cân nặng (g)":"139"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"16 GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"IM, Google Mail, Yahoo mail","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"MicroSD (T-Flash)"},"Màn hình & hiển thị":{"Cảm ứng":"Điện rung đa điểm","Kiểu màn hình":"Super AMOLED 16 triệu màu","Kích thước màn hình":"5.0\\"","Độ phân giải màn hình":"720 x 1280 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"2600 mAh","Loại pin sử dụng":"Pin chuẩn Li-Ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Có","Chip xử lý (CPU)":"Quad-core 1.2 GHz","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"Android 5.1.1 (Lollipop)","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"2 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ nhiều sim":"2 sim 2 sóng, Micro Sim","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Có thể tải thêm","Phần mềm ứng dụng văn phòng":"Có","Trò chơi":"Có thể cài đặt thêm"}}	
HyBqcbvRl	Samsung Galaxy A5 (2017)	M01	ptdt	Samsung	26	2017-02-19 09:00:00	8990000	35	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"32 GB","Chip xử lý (CPU)":"OCTA-CORE 1.9Hz","Dung lượng pin (mAh)":"3000 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android 6.0 (Marshmallow)","Kích thước màn hình":"5.2”","Máy ảnh chính":"16 MP","RAM":"3 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, A2DP, LE, EDR","Hệ thống định vị GPS":"BDS, A-GPS, GLONASS","Hỗ trợ 3G":"HSDPA 3.6 Mbps","Kết nối USB":"USB Type-C","Mạng GPRS":"GSM 850/900/1800/1900","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"16 MP","Máy ảnh phụ":"16 MP","Nghe nhạc định dạng":"Lossless, Midi, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++, eAAC+, OGG, AC3, FLAC","Quay phim tiêu chuẩn":"Quay phim FullHD 1080p@30fps","Tính năng khác của máy ảnh":"Tự động lấy nét, Gắn thẻ địa lý, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama","Xem phim định dạng":"3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC), DivX, WMV9, Xvid"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.9","Chiều dài (mm)":"146.1","Chiều rộng (mm)":"71.4"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"32 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Loại thẻ nhớ hỗ trợ":"MicroSD"},"Màn hình & hiển thị":{"Cảm ứng":"Có","Kiểu màn hình":"Super AMOLED","Kích thước màn hình":"5.2”","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3000 mAh","Loại pin sử dụng":"Pin chuẩn Li-Ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"OCTA-CORE 1.9Hz","Hệ điều hành":"Android 6.0 (Marshmallow)","Kiểu dáng điện thoại":"Nguyên khối","RAM":"3 GB"}}	
S1rflrv0g	Xe Đạp Trợ Lực Điện Xiaomi Yunbike C1 Chính Hãng		ptpk		2	2017-03-16 09:00:00	10800000	5	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
rJBsc-wRe	Nokia 216 Dual Sim	M01	ptdt	Nokia	67	2017-03-28 09:00:00	790000	45	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"","Chip xử lý (CPU)":"","Dung lượng pin (mAh)":"1020 mAh","Hãng sản xuất":"Nokia","Hệ điều hành":"","Kích thước màn hình":"2.4 inches","Máy ảnh chính":"VGA","RAM":"16 MB","Độ phân giải màn hình":"240 x 320 Pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"Có","Hệ thống định vị GPS":"Không","Hỗ trợ 3G":"Không","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Wifi":"Không"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"VGA","Máy ảnh phụ":"VGA","Nghe FM Radio":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"13.5","Chiều dài (mm)":"118","Chiều rộng (mm)":"50.2","Cân nặng (g)":"82.6"},"Lưu trữ & bộ nhớ":{"Danh bạ có thể lưu trữ":"2000 số","Dung lượng thẻ nhớ tối đa":"32 GB"},"Màn hình & hiển thị":{"Kích thước màn hình":"2.4 inches","Độ phân giải màn hình":"240 x 320 Pixels"},"Nguồn":{"Dung lượng pin (mAh)":"1020 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có thể tải thêm","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","RAM":"16 MB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 sim 2 sóng","Lưu trữ cuộc gọi":"Có"}}	
SyXyxBPCx	Bao da S		ptpk		17	2017-01-19 09:00:00	790000	6	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
H1iyeBPCx	Bao da S		ptpk		24	2017-01-15 09:00:00	790000	9	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
By__q-D0e	Samsung Galaxy S7 Edge	M01	ptdt	Samsung	20	2017-02-18 09:00:00	15490000	7	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"32GB","Chip xử lý (CPU)":"Exynos 8890 Octa, Quad-core 2.3 GHz Mongoose + quad-core 1.6 GHz Cortex-A53, Mali-T880 MP12","Dung lượng pin (mAh)":"3600 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.5\\"","Máy ảnh chính":"12 MP","RAM":"4 GB","Độ phân giải màn hình":"1440 x 2560px"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, apt-X, A2DP, LE","Hệ thống định vị GPS":"A-GPS và GLONASS","Hỗ trợ 3G":"Có","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"Có hỗ trợ","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Kết nối Tivi":"Có","Máy ảnh chính":"12 MP","Máy ảnh phụ":"5.0 MP","Nghe FM Radio":"Có","Nghe nhạc định dạng":"Midi, Lossless, MP3, WAV, WMA, eAAC+, AC3, FLAC","Quay phim tiêu chuẩn":"Quay phim 4K 2160p@30fps","Tính năng khác của máy ảnh":"Ảnh Raw, Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học","Xem phim định dạng":"H.265, 3GP, MP4, AVI, H.264(MPEG4-AVC), DivX, WMV9, Xvid","Xem tivi":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.7","Chiều dài (mm)":"150.9","Chiều rộng (mm)":"72.6","Cân nặng (g)":"157"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"32GB","Danh bạ có thể lưu trữ":"Có,Danh bạ hình ảnh","Dung lượng thẻ nhớ tối đa":"200 GB","Hỗ trợ Email":"Có","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"MicroSD (T-Flash)"},"Màn hình & hiển thị":{"Các tính năng khác":"Mặt kính 2.5D Thông báo trên màn hình cong Màn hình Alway On Display Mở khóa nhanh bằng vân tay Chống nước, chống bụi Sạc pin không dây Sạc pin nhanh","Cảm ứng":"Cảm ứng điện dung, Đa điểm","Kiểu màn hình":"Super AMOLED Plus 16 triệu màu","Kích thước màn hình":"5.5\\"","Độ phân giải màn hình":"1440 x 2560px"},"Nguồn":{"Dung lượng pin (mAh)":"3600 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Bàn phím đầy đủ","Chip xử lý (CPU)":"Exynos 8890 Octa, Quad-core 2.3 GHz Mongoose + quad-core 1.6 GHz Cortex-A53, Mali-T880 MP12","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"v6.0 (Marshmallow)","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ java":"Có","Hỗ trợ nhiều sim":"2 SIM hoặc 1 SIM + 1 thẻ nhớ, NanoSIM","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Có sẵn và có thể tải thêm","Phần mềm ứng dụng văn phòng":"Cài sẵn và có thể tải thêm tại Hoàng Hà Mobile","Trò chơi":"Có sẵn trong máy & có thể cài thêm"}}	
SkxFcWvRe	Samsung Galaxy S7 Edge	M01	ptdt	Samsung	39	2017-04-19 09:00:00	15490000	8	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"128GB","Chip xử lý (CPU)":"Exynos 8890 Octa, Quad-core 2.3 GHz Mongoose + quad-core 1.6 GHz Cortex-A53, Mali-T880 MP12","Dung lượng pin (mAh)":"3600 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.5\\"","Máy ảnh chính":"12 MP","RAM":"4 GB","Độ phân giải màn hình":"1440 x 2560px"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, apt-X, A2DP, LE","Hệ thống định vị GPS":"A-GPS và GLONASS","Hỗ trợ 3G":"Có","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"Có hỗ trợ","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Kết nối Tivi":"Có","Máy ảnh chính":"12 MP","Máy ảnh phụ":"5.0 MP","Nghe FM Radio":"Có","Nghe nhạc định dạng":"Midi, Lossless, MP3, WAV, WMA, eAAC+, AC3, FLAC","Quay phim tiêu chuẩn":"Quay phim 4K 2160p@30fps","Tính năng khác của máy ảnh":"Ảnh Raw, Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học","Xem phim định dạng":"H.265, 3GP, MP4, AVI, H.264(MPEG4-AVC), DivX, WMV9, Xvid","Xem tivi":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.7","Chiều dài (mm)":"150.9","Chiều rộng (mm)":"72.6","Cân nặng (g)":"157"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"128GB","Danh bạ có thể lưu trữ":"Có,Danh bạ hình ảnh","Dung lượng thẻ nhớ tối đa":"200 GB","Hỗ trợ Email":"Có","Hỗ trợ SMS":"Có","Loại thẻ nhớ hỗ trợ":"MicroSD (T-Flash)"},"Màn hình & hiển thị":{"Các tính năng khác":"Mặt kính 2.5D Thông báo trên màn hình cong Màn hình Alway On Display Mở khóa nhanh bằng vân tay Chống nước, chống bụi Sạc pin không dây Sạc pin nhanh","Cảm ứng":"Cảm ứng điện dung, Đa điểm","Kiểu màn hình":"Super AMOLED Plus 16 triệu màu","Kích thước màn hình":"5.5\\"","Độ phân giải màn hình":"1440 x 2560px"},"Nguồn":{"Dung lượng pin (mAh)":"3600 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Bàn phím Qwerty hỗ trợ":"Bàn phím đầy đủ","Chip xử lý (CPU)":"Exynos 8890 Octa, Quad-core 2.3 GHz Mongoose + quad-core 1.6 GHz Cortex-A53, Mali-T880 MP12","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"Thanh thẳng + Cảm ứng","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"v6.0 (Marshmallow)","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Ghi âm cuộc gọi":"Có","Hỗ trợ java":"Có","Hỗ trợ nhiều sim":"2 SIM hoặc 1 SIM + 1 thẻ nhớ, NanoSIM","Lưu trữ cuộc gọi":"Có","Phần mềm ứng dụng khác":"Có sẵn và có thể tải thêm","Phần mềm ứng dụng văn phòng":"Cài sẵn và có thể tải thêm tại Hoàng Hà Mobile","Trò chơi":"Có sẵn trong máy & có thể cài thêm"}}	
B1mj5ZvAl	Samsung Galaxy J5 Prime	M01	ptdt	Samsung	62	2017-02-17 09:00:00	4690000	36	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"16 GB","Chip xử lý (CPU)":"Quad-core 1.4 GHz Cortex-A53","Dung lượng pin (mAh)":"2400 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.0 inches","Máy ảnh chính":"13 MP","RAM":"2 GB","Độ phân giải màn hình":"720 x 1280 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, A2DP, LE","Hệ thống định vị GPS":"A-GPS và GLONASS","Hỗ trợ 3G":"Có hỗ trợ 3G và 4G","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Trình duyệt web":"HTML5","Wifi":"Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot"},"Giải trí & Đa phương tiện":{"Kết nối Tivi":"Có","Máy ảnh chính":"13 MP","Máy ảnh phụ":"5.0 MP","Nghe FM Radio":"Có","Quay phim tiêu chuẩn":"1080p@30fps","Xem tivi":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"8.1","Chiều dài (mm)":"142.8","Chiều rộng (mm)":"69.5","Cân nặng (g)":"143"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"16 GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"Có hỗ trợ","Hỗ trợ SMS":"Có hỗ trợ","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Kiểu màn hình":"PLS TFT LCD","Kích thước màn hình":"5.0 inches","Độ phân giải màn hình":"720 x 1280 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"2400 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Có","Có thể tải thêm nhạc chuông":"Có thể tải thêm","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Quad-core 1.4 GHz Cortex-A53","Hệ điều hành":"Android OS","Ngôn ngữ hỗ trợ":"Đa Ngôn Ngữ","Phiên bản hệ điều hành":"v6.0.1 (Marshmallow)","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"2 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 sim 2 sóng","Lưu trữ cuộc gọi":"Có"}}	
B17exrv0x	Tai nghe choàng đầu có MIC Bluetooth Ibomb SKA G50		ptpk		5	2017-01-22 09:00:00	650000	19	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
Hy4d_qZvAx	Samsung Galaxy A7 (2017)	M01	ptdt	Samsung	93	2017-01-16 09:00:00	10990000	43	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"32 GB","Chip xử lý (CPU)":"OCTA-CORE 1.9Hz","Dung lượng pin (mAh)":"3600 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android 6.0 (Marshmallow)","Kích thước màn hình":"5.7''","Máy ảnh chính":"16 MP","RAM":"3 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v4.2, A2DP, LE, EDR","Hệ thống định vị GPS":"BDS, A-GPS, GLONASS","Hỗ trợ 3G":"HSDPA 3.6 Mbps","Kết nối USB":"USB Type-C","Mạng GPRS":"GSM 850/900/1800/1900","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"16 MP","Máy ảnh phụ":"16 MP","Nghe nhạc định dạng":"Lossless, Midi, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++, eAAC+, OGG, AC3, FLAC","Quay phim tiêu chuẩn":"Quay phim FullHD 1080p@30fps","Tính năng khác của máy ảnh":"Tự động lấy nét, Gắn thẻ địa lý, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama","Xem phim định dạng":"3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC), DivX, WMV9, Xvid"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.9","Chiều dài (mm)":"156.8","Chiều rộng (mm)":"77.6"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"32 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Loại thẻ nhớ hỗ trợ":"MicroSD"},"Màn hình & hiển thị":{"Cảm ứng":"Có","Kiểu màn hình":"Super AMOLED","Kích thước màn hình":"5.7''","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3600 mAh","Loại pin sử dụng":"Pin chuẩn Li-Ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"OCTA-CORE 1.9Hz","Hệ điều hành":"Android 6.0 (Marshmallow)","Kiểu dáng điện thoại":"Nguyên khối","RAM":"3 GB"}}	
ByYK9bwCe	HTC Desire 10 Pro	M01	ptdt	HTC	90	2017-04-22 09:00:00	7150000	3	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"Helio P10","Dung lượng pin (mAh)":"3000 mAh","Hãng sản xuất":"HTC","Hệ điều hành":"Android OS","Kích thước màn hình":"5,5 inch","Máy ảnh chính":"20 MP, phụ 13 MP","RAM":"4 GB","Độ phân giải màn hình":"1080 x 1920 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.2, A2DP, LE","Hệ thống định vị GPS":"A-GPS, GLONASS","Hồng ngoại":"Không","Hỗ trợ 3G":"Hỗ trợ 3G và 4G","Kết nối USB":"micro USB 2.0","Mạng EDGE":"Có","Mạng GPRS":"Có","Wifi":"Wi-Fi 802.11 a/b/g/n, dual-band, WiFi Direct, hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"20 MP, phụ 13 MP","Máy ảnh phụ":"13 MP","Quay phim tiêu chuẩn":"1080p@30fps"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.9","Chiều dài (mm)":"165.5","Chiều rộng (mm)":"76","Cân nặng (g)":"165"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"2 TB","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Các tính năng khác":"Gorilla Glass","Kiểu màn hình":"IPS LCD 16 triệu màu","Kích thước màn hình":"5,5 inch","Độ phân giải màn hình":"1080 x 1920 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3000 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Có loa ngoài":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Helio P10","Hệ điều hành":"Android OS","Phiên bản hệ điều hành":"6.0 Marshmallow","RAM":"4 GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 SIM (Nano SIM)"}}	
BkiHxrDAx	Máy lọc không khí Xiaomi Mi Air Purifier 2		ptpk		28	2017-03-30 09:00:00	3190000	20	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{}	{}	{}
HknY5ZDAg	Oppo A39 (Neo 9S)	M01	ptdt	OPPO	34	2017-03-20 09:00:00	4290000	21	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"32 GB","Chip xử lý (CPU)":"MT6750, Octa Core 1.5GHz","Dung lượng pin (mAh)":"2900mAh","Hãng sản xuất":"OPPO","Hệ điều hành":"Android OS","Kích thước màn hình":"5.2 inches","Máy ảnh chính":"13 MP","RAM":"3GB","Độ phân giải màn hình":"720 x 1280 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"4.0","Hệ thống định vị GPS":"Có","Hỗ trợ 3G":"Có hỗ trợ 3G và 4G","Kết nối USB":"Micro USB","Mạng EDGE":"Có","Mạng GPRS":"Có","Wifi":"Có, Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"13 MP","Máy ảnh phụ":"5.0 MP","Nghe FM Radio":"Có"},"Kích thước & khối lượng":{"Chiều cao (mm)":"7.65","Chiều dài (mm)":"149.1","Chiều rộng (mm)":"72.9","Cân nặng (g)":"147"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"32 GB","Danh bạ có thể lưu trữ":"Không giới hạn","Dung lượng thẻ nhớ tối đa":"256 GB","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Kiểu màn hình":"IPS-LCD","Kích thước màn hình":"5.2 inches","Độ phân giải màn hình":"720 x 1280 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"2900mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"MT6750, Octa Core 1.5GHz","Hệ điều hành":"Android OS","Phiên bản hệ điều hành":"5.1 Lollipop","Phù hợp với các mạng":"Tất cả các mạng Việt Nam","RAM":"3GB"},"Ứng dụng & Trò chơi":{"Hỗ trợ nhiều sim":"2 sim 2 sóng (Nano sim)","Lưu trữ cuộc gọi":"Có"}}	
SJM9cWPCg	Samsung Galaxy S8	M01	ptdt	Samsung	88	2017-04-16 09:00:00	18490000	24	{"Bảo hành chính hãng":"Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng","Giao hàng":"Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)","Trong hộp có":"Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp","Đổi hàng":"1 đổi 1 trong 1 tháng với sản phẩm lỗi"}	{"Bộ nhớ trong":"64 GB","Chip xử lý (CPU)":"Qualcomm MSM8998 Snapdragon 835 - US model Exynos 8895 Octa - EMEA,Octa-core (4x2.35 GHz Kryo & 4x1.9 GHz Kryo) - US model Octa-core (4x2.3 GHz & 4x1.7 GHz) - EMEA,Adreno 540 - US model","Dung lượng pin (mAh)":"3000 mAh","Hãng sản xuất":"Samsung","Hệ điều hành":"Android OS","Kích thước màn hình":"5.8''","Máy ảnh chính":"12.0 MP","RAM":"4 GB","Độ phân giải màn hình":"1440 x 2960 pixels"}	{"Dữ liệu & Kết nối":{"Bluetooth":"v5.0, A2DP, LE, aptX","Hệ thống định vị GPS":"A-GPS, GLONASS, BDS, GALILEO","Hỗ trợ 3G":"HSDPA 850 / 900 / 1700(AWS) / 1900 / 2100, Hỗ trợ 4G LTE band 1(2100), 2(1900), 3(1800), 4(1700/2100), 5(850), 7(2600), 8(900), 17(700), 20(800), 28(700)","Kết nối USB":"Type-C 1.0","Mạng GPRS":"GSM 850 / 900 / 1800 / 1900 - SIM 1 & SIM 2","Wifi":"Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot"},"Giải trí & Đa phương tiện":{"Máy ảnh chính":"12.0 MP","Máy ảnh phụ":"8.0 MP","Nghe nhạc định dạng":"MP3/WAV/eAAC+/FLAC player","Quay phim tiêu chuẩn":"2160p@60fps, 1080p@120fps, HDR,","Tính năng khác của máy ảnh":"Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Ghi hình 4K cùng lúc với chụp ảnh 9MP","Xem phim định dạng":"MP4/DivX/XviD/H.265 player"},"Kích thước & khối lượng":{"Chiều cao (mm)":"8","Chiều dài (mm)":"148.9","Chiều rộng (mm)":"68.1","Cân nặng (g)":"155"},"Lưu trữ & bộ nhớ":{"Bộ nhớ trong":"64 GB","Dung lượng thẻ nhớ tối đa":"256 GB","Hỗ trợ Email":"Có","Loại thẻ nhớ hỗ trợ":"Micro SD"},"Màn hình & hiển thị":{"Các tính năng khác":"Corning Gorilla Glass 5","Kiểu màn hình":"Super AMOLED","Kích thước màn hình":"5.8''","Độ phân giải màn hình":"1440 x 2960 pixels"},"Nguồn":{"Dung lượng pin (mAh)":"3000 mAh","Loại pin sử dụng":"Li-ion"},"Nhạc chuông":{"Báo cuộc gọi, tin nhắn":"Có","Có loa ngoài":"Dual stereo speakers","Có thể tải thêm nhạc chuông":"Có","Jack cắm audio":"3.5 mm"},"Thông tin chung":{"Chip xử lý (CPU)":"Qualcomm MSM8998 Snapdragon 835 - US model Exynos 8895 Octa - EMEA,Octa-core (4x2.35 GHz Kryo & 4x1.9 GHz Kryo) - US model Octa-core (4x2.3 GHz & 4x1.7 GHz) - EMEA,Adreno 540 - US model","Hệ điều hành":"Android OS","Kiểu dáng điện thoại":"THIẾT KẾ MÀN HÌNH KHÔNG VIỀN","Phiên bản hệ điều hành":"7.0 Nougat","RAM":"4 GB"}}	
\.


--
-- Data for Name: product_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_template (product_template_id, name) FROM stdin;
M01	Smart phone
M02	Tivi
M03	Tủ lạnh
M04	Máy giặt
M05	Nồi cơm điện
M06	Điều hòa
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_type (product_type_id, name, parent) FROM stdin;
ptdt	Điện thoại	0
ptpk	Phụ kiện	0
ptpin	Pin	ptpk
ptsac	Sạc, cáp	ptpk
ptduphong	Pin sạc dự phòng	ptpk
pttn	Tai nghe	ptpk
ptloa	Loa	ptpk
ptgts	Gậy tự sướng	ptpk
ptthenho	Thẻ nhớ	ptpk
ptoplung	Ốp lưng / Bao da	ptpk
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_account (user_id, email, pass, phone, fullname, gender, address, agreement) FROM stdin;
1	nhank57tha@gmail.com	$2a$05$Jz0UR9mAshHh/6agpxzoauLDQRxRBj6muKr4dRH6pLay95U2rVTSO	0962784131	Nguyễn Thị Nhan	Nữ	gia lam-ha noi	on
\.


--
-- Name: user_account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_account_user_id_seq', 1, true);


--
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (bill_id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: contact_feedback contact_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact_feedback
    ADD CONSTRAINT contact_feedback_pkey PRIMARY KEY (contact_feedback_id);


--
-- Name: detailed_bill detailed_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detailed_bill
    ADD CONSTRAINT detailed_bill_pkey PRIMARY KEY (detailed_bill_id);


--
-- Name: detailed_orders detailed_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detailed_orders
    ADD CONSTRAINT detailed_orders_pkey PRIMARY KEY (detailed_orders_id);


--
-- Name: field field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY field
    ADD CONSTRAINT field_pkey PRIMARY KEY (field_id);


--
-- Name: field_section field_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY field_section
    ADD CONSTRAINT field_section_pkey PRIMARY KEY (field_section_id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturer_id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (news_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product_template product_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_template
    ADD CONSTRAINT product_template_pkey PRIMARY KEY (product_template_id);


--
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);


--
-- Name: user_account user_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_email_key UNIQUE (email);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_id);


--
-- Name: field field_field_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY field
    ADD CONSTRAINT field_field_section_id_fkey FOREIGN KEY (field_section_id) REFERENCES field_section(field_section_id) MATCH FULL;


--
-- Name: field_section field_section_product_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY field_section
    ADD CONSTRAINT field_section_product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES product_template(product_template_id) MATCH FULL;


--
-- Name: images product_images_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT product_images_id FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

