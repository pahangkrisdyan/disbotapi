-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2019 pada 12.32
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_slot_filliing_v0`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_product`
--

CREATE TABLE `api_product` (
  `id` int(11) NOT NULL,
  `stock_amount` int(11) NOT NULL,
  `product_group_id_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_product`
--

INSERT INTO `api_product` (`id`, `stock_amount`, `product_group_id_id`, `price`) VALUES
(1, 5, 1, 12000),
(2, 10, 1, 12000),
(3, 10, 1, 12000),
(4, 5, 2, 70000),
(5, 3, 2, 70000),
(6, 1, 2, 70000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_productgroup`
--

CREATE TABLE `api_productgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `is_all_price` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_productgroup`
--

INSERT INTO `api_productgroup` (`id`, `name`, `user_id_id`, `is_all_price`, `price`) VALUES
(1, 'Waist Bag', 2, 0, 12000),
(2, 'Tas Gendong', 2, 1, 70000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_productphoto`
--

CREATE TABLE `api_productphoto` (
  `id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `product_group_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_productphoto`
--

INSERT INTO `api_productphoto` (`id`, `url`, `product_group_id_id`) VALUES
(1, 'https://media1.visvalbags.com/5162-thickbox_default/waist-bag-rush-solid-black.jpg', 1),
(2, 'https://media1.visvalbags.com/5168-thickbox_default/waist-bag-rush-yellow.jpg', 1),
(3, 'https://media1.visvalbags.com/5497-thickbox_default/backpack-integra-black.jpg', 2),
(4, 'https://media1.visvalbags.com/5506-thickbox_default/backpack-integra-navy.jpg', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_sfcombination`
--

CREATE TABLE `api_sfcombination` (
  `id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `sf_item_id` int(11) NOT NULL,
  `sf_value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_sfcombination`
--

INSERT INTO `api_sfcombination` (`id`, `product_id_id`, `sf_item_id`, `sf_value_id`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 7),
(3, 2, 1, 5),
(4, 2, 2, 8),
(5, 3, 1, 4),
(6, 3, 2, 7),
(7, 4, 1, 1),
(8, 4, 2, 7),
(9, 5, 2, 9),
(10, 5, 1, 6),
(11, 6, 1, 4),
(12, 6, 2, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_sfitem`
--

CREATE TABLE `api_sfitem` (
  `id` int(11) NOT NULL,
  `typ` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_sfitem`
--

INSERT INTO `api_sfitem` (`id`, `typ`, `value`) VALUES
(1, 'size_a', 'size'),
(2, 'color_a', 'color');

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_sfvalue`
--

CREATE TABLE `api_sfvalue` (
  `id` int(11) NOT NULL,
  `typ` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_sfvalue`
--

INSERT INTO `api_sfvalue` (`id`, `typ`, `value`) VALUES
(1, 'size_a', 'ss'),
(2, 'size_a', 's'),
(3, 'size_a', 'm'),
(4, 'size_a', 'l'),
(5, 'size_a', 'xl'),
(6, 'size_a', 'xxl'),
(7, 'color_a', 'red'),
(8, 'color_a', 'green'),
(9, 'color_a', 'blue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_user`
--

CREATE TABLE `api_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `api_user`
--

INSERT INTO `api_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$miyAJ2jGhpxW$85RZISkJW1pqTze8GgsKMk9RNZONxzqL9/cZ92RXu4s=', '2019-06-03 08:59:19.428404', 1, 'admin', '', '', 'admin@localhost', 1, 1, '2019-06-01 14:10:28.429894'),
(2, 'pbkdf2_sha256$150000$y8t0ngjoSc9C$Bodjc2NJY1tSlp9wIUGMQqyWKsxLTCyNii/EofZJ/Go=', '2019-06-05 04:16:33.588978', 0, 'user1', 'user1', 'user1', 'user1@localhost', 0, 1, '2019-06-01 14:33:48.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_user_groups`
--

CREATE TABLE `api_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_user_user_permissions`
--

CREATE TABLE `api_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add sf item', 7, 'add_sfitem'),
(26, 'Can change sf item', 7, 'change_sfitem'),
(27, 'Can delete sf item', 7, 'delete_sfitem'),
(28, 'Can view sf item', 7, 'view_sfitem'),
(29, 'Can add sf value', 8, 'add_sfvalue'),
(30, 'Can change sf value', 8, 'change_sfvalue'),
(31, 'Can delete sf value', 8, 'delete_sfvalue'),
(32, 'Can view sf value', 8, 'view_sfvalue'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add product group', 10, 'add_productgroup'),
(38, 'Can change product group', 10, 'change_productgroup'),
(39, 'Can delete product group', 10, 'delete_productgroup'),
(40, 'Can view product group', 10, 'view_productgroup'),
(41, 'Can add sf combination', 11, 'add_sfcombination'),
(42, 'Can change sf combination', 11, 'change_sfcombination'),
(43, 'Can delete sf combination', 11, 'delete_sfcombination'),
(44, 'Can view sf combination', 11, 'view_sfcombination'),
(45, 'Can add product photo', 12, 'add_productphoto'),
(46, 'Can change product photo', 12, 'change_productphoto'),
(47, 'Can delete product photo', 12, 'delete_productphoto'),
(48, 'Can view product photo', 12, 'view_productphoto');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-06-01 14:33:49.007276', '2', '', 1, '[{\"added\": {}}]', 6, 1),
(2, '2019-06-01 14:36:33.934200', '2', 'user1@localhost', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'api', 'product'),
(10, 'api', 'productgroup'),
(12, 'api', 'productphoto'),
(11, 'api', 'sfcombination'),
(7, 'api', 'sfitem'),
(8, 'api', 'sfvalue'),
(6, 'api', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-06-01 11:52:15.970125'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-06-01 11:52:17.291966'),
(3, 'auth', '0001_initial', '2019-06-01 11:52:18.618790'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-06-01 11:52:23.602005'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-06-01 11:52:23.695098'),
(6, 'auth', '0004_alter_user_username_opts', '2019-06-01 11:52:23.817367'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-06-01 11:52:23.861634'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-06-01 11:52:23.903593'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-06-01 11:52:23.939868'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-06-01 11:52:23.995908'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-06-01 11:52:24.050999'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-06-01 11:52:25.058560'),
(13, 'auth', '0011_update_proxy_permissions', '2019-06-01 11:52:25.139769'),
(14, 'api', '0001_initial', '2019-06-01 11:52:26.004130'),
(15, 'admin', '0001_initial', '2019-06-01 11:52:36.384992'),
(16, 'admin', '0002_logentry_remove_auto_add', '2019-06-01 11:52:40.410361'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-01 11:52:40.565274'),
(18, 'api', '0002_productgroups_products_sfcombinations_sfitem_sfvalue', '2019-06-01 11:52:43.070984'),
(19, 'api', '0003_auto_20190601_1851', '2019-06-01 11:52:51.603461'),
(20, 'sessions', '0001_initial', '2019-06-01 11:52:52.127288'),
(21, 'api', '0004_productphotos', '2019-06-04 03:01:55.455851'),
(22, 'api', '0005_auto_20190604_1001', '2019-06-04 03:01:57.498995'),
(23, 'api', '0006_auto_20190604_1005', '2019-06-04 03:06:06.587960');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8xhtowviqwjzacpeygvyig1ye6rurjsu', 'YzQ5YjA1YjhjMjczMjQ4M2UxNDBjZjNhMDU5NTJkNDhhOWJlYzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTJhMWEwODExNmI3ZmIxZDliNjUxZTg3MDhmYTZkMjkwYjQyOGI1In0=', '2019-06-19 04:16:33.891132'),
('fmcjrj7r3wg4e4mrv7ukilfzmw21hfqq', 'YzQ5YjA1YjhjMjczMjQ4M2UxNDBjZjNhMDU5NTJkNDhhOWJlYzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTJhMWEwODExNmI3ZmIxZDliNjUxZTg3MDhmYTZkMjkwYjQyOGI1In0=', '2019-06-18 08:26:53.634952'),
('mqtmmtc4pzh2qk7prrt1uwvg175c2c7c', 'OGQxMTQzMDFlN2Y3NDc2ZmI3Mzk5YTc5NzM4YWQ1ODgwNWNiODE5Mjp7fQ==', '2019-06-18 05:10:58.978925'),
('rn21d24xuvmwzhtpj9zbhxefh3xylz7v', 'YzQ5YjA1YjhjMjczMjQ4M2UxNDBjZjNhMDU5NTJkNDhhOWJlYzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTJhMWEwODExNmI3ZmIxZDliNjUxZTg3MDhmYTZkMjkwYjQyOGI1In0=', '2019-06-18 07:14:03.250756'),
('zjnb3nmw22qn6dq0a3nn0lvf16qno32r', 'YzQ5YjA1YjhjMjczMjQ4M2UxNDBjZjNhMDU5NTJkNDhhOWJlYzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTJhMWEwODExNmI3ZmIxZDliNjUxZTg3MDhmYTZkMjkwYjQyOGI1In0=', '2019-06-18 07:13:14.904354');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `api_product`
--
ALTER TABLE `api_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_product_product_group_id_id_e450ca95_fk_api_productgroup_id` (`product_group_id_id`);

--
-- Indeks untuk tabel `api_productgroup`
--
ALTER TABLE `api_productgroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_productgroups_user_id_id_e9a416bb_fk_api_user_id` (`user_id_id`);

--
-- Indeks untuk tabel `api_productphoto`
--
ALTER TABLE `api_productphoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_productphotos_product_group_id_id_5a6e3de3_fk_api_produ` (`product_group_id_id`);

--
-- Indeks untuk tabel `api_sfcombination`
--
ALTER TABLE `api_sfcombination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_sfcombinations_sf_item_id_07cb8f3f_fk_api_sfitem_id` (`sf_item_id`),
  ADD KEY `api_sfcombinations_sf_value_id_84dc4e4d_fk_api_sfvalue_id` (`sf_value_id`),
  ADD KEY `api_sfcombinations_product_id_id_66148781_fk_api_product_id` (`product_id_id`);

--
-- Indeks untuk tabel `api_sfitem`
--
ALTER TABLE `api_sfitem`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `api_sfvalue`
--
ALTER TABLE `api_sfvalue`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `api_user`
--
ALTER TABLE `api_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `api_user_groups`
--
ALTER TABLE `api_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_groups_user_id_group_id_9c7ddfb5_uniq` (`user_id`,`group_id`),
  ADD KEY `api_user_groups_group_id_3af85785_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_user_permissions_user_id_permission_id_a06dd704_uniq` (`user_id`,`permission_id`),
  ADD KEY `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_api_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `api_product`
--
ALTER TABLE `api_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `api_productgroup`
--
ALTER TABLE `api_productgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `api_productphoto`
--
ALTER TABLE `api_productphoto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `api_sfcombination`
--
ALTER TABLE `api_sfcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `api_sfitem`
--
ALTER TABLE `api_sfitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `api_sfvalue`
--
ALTER TABLE `api_sfvalue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `api_user`
--
ALTER TABLE `api_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `api_user_groups`
--
ALTER TABLE `api_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `api_product`
--
ALTER TABLE `api_product`
  ADD CONSTRAINT `api_product_product_group_id_id_e450ca95_fk_api_productgroup_id` FOREIGN KEY (`product_group_id_id`) REFERENCES `api_productgroup` (`id`);

--
-- Ketidakleluasaan untuk tabel `api_productgroup`
--
ALTER TABLE `api_productgroup`
  ADD CONSTRAINT `api_productgroups_user_id_id_e9a416bb_fk_api_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `api_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `api_productphoto`
--
ALTER TABLE `api_productphoto`
  ADD CONSTRAINT `api_productphotos_product_group_id_id_5a6e3de3_fk_api_produ` FOREIGN KEY (`product_group_id_id`) REFERENCES `api_productgroup` (`id`);

--
-- Ketidakleluasaan untuk tabel `api_sfcombination`
--
ALTER TABLE `api_sfcombination`
  ADD CONSTRAINT `api_sfcombinations_product_id_id_66148781_fk_api_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `api_product` (`id`),
  ADD CONSTRAINT `api_sfcombinations_sf_item_id_07cb8f3f_fk_api_sfitem_id` FOREIGN KEY (`sf_item_id`) REFERENCES `api_sfitem` (`id`),
  ADD CONSTRAINT `api_sfcombinations_sf_value_id_84dc4e4d_fk_api_sfvalue_id` FOREIGN KEY (`sf_value_id`) REFERENCES `api_sfvalue` (`id`);

--
-- Ketidakleluasaan untuk tabel `api_user_groups`
--
ALTER TABLE `api_user_groups`
  ADD CONSTRAINT `api_user_groups_group_id_3af85785_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `api_user_groups_user_id_a5ff39fa_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  ADD CONSTRAINT `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `api_user_user_permissions_user_id_f3945d65_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
