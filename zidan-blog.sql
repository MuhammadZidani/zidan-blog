-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Des 2023 pada 15.11
-- Versi server: 10.6.11-MariaDB-log
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zidan-blog`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_authors`
--

CREATE TABLE `blog_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `github_handle` varchar(255) DEFAULT NULL,
  `twitter_handle` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `blog_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `bg_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `text_color`, `bg_color`, `created_at`, `updated_at`) VALUES
(1, 'Fashion Jaman Now', 'Relationship', 'green', 'green', '2023-11-02 08:11:33', '2023-11-29 17:53:18'),
(2, 'Show', 'aliquid-rerum-voluptatem', 'indigo', 'indigo', '2023-11-02 08:11:33', '2023-11-29 18:38:43'),
(5, 'Est accusantium ut et itaque.', 'adipisci-optio-non-accusantium', NULL, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(6, 'The-Champion', 'The-Treg', 'blue', 'blue', '2023-11-27 21:17:16', '2023-11-29 18:39:25'),
(7, 'Fashio', 'fashio', 'green', 'red', '2023-12-14 08:05:29', '2023-12-14 08:05:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(3, 2, 6, NULL, NULL),
(4, 3, 2, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 1, 1, NULL, NULL),
(7, 17, 2, NULL, NULL),
(8, 17, 6, NULL, NULL),
(9, 58, 2, NULL, NULL),
(10, 58, 6, NULL, NULL),
(11, 101, 2, NULL, NULL),
(12, 101, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_18_152852_create_sessions_table', 1),
(7, '2023_10_18_161043_create_filament_blog_tables', 1),
(8, '2023_10_18_161043_create_tag_tables', 1),
(9, '2023_10_31_144756_create_posts_table', 1),
(10, '2023_10_31_144851_create_categories_table', 1),
(11, '2023_10_31_145015_create_category_post_table', 1),
(12, '2023_11_29_154815_create_post_like_table', 2),
(13, '2023_11_30_155626_create_comments_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `image`, `title`, `slug`, `body`, `published_at`, `featured`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 76, 'posts/thumbnails/LRdH2yF6oaNbzbxtEUZ2HyEhY1N2QV-metabGEtY2hhdHVpc2UtY2F0YWxvZy1waG90b2dyYXBoeS53ZWJw-.webp', 'Fashion Terkini 2023 Yang Jadi Banyak Perbincangan ', 'quam-nemo-sed', 'Et libero reiciendis ut nam. Quisquam possimus pariatur pariatur in porro vel nihil. Temporibus illo alias voluptatem doloribus ab expedita dolor. Minima ad necessitatibus commodi ut repudiandae. Odio ut voluptas aperiam. Doloribus consequatur doloremque eveniet numquam. Qui nesciunt animi est expedita qui. Qui dolorum sunt omnis ipsum inventore. Non cumque mollitia et omnis sunt possimus eos quo.', '2023-11-08 03:11:11', 1, NULL, '2023-11-02 08:11:32', '2023-12-14 07:49:33'),
(2, 2, 'posts/thumbnails/TfJj2Pu9lkkDGk349encUfJJwstdgM-metaMjQxMDU3MjAyXzg3MzI0NTQyNjg5MzMxOF82MzI0MDI0OTMxMjExNzc5NzA1X24uanBn-.jpg', 'Laravel Tutorial', 'in-voluptatibus-nostrum', 'Nostrum iusto modi quae consequuntur minima. Et necessitatibus blanditiis cupiditate voluptate consequatur voluptate nobis. Ut fugiat eos vero doloremque quisquam voluptatibus. Commodi sed quo error voluptatum. Soluta natus sed qui quaerat qui quod et. Aut quos maiores alias vel voluptas at beatae. Repellendus perferendis quia occaecati velit vero accusamus.', '2023-11-03 09:54:37', 1, NULL, '2023-11-02 08:11:32', '2023-11-29 06:13:52'),
(3, 3, 'posts/thumbnails/sqgshfQiGCK2LiJnptaX89XocjAzvc-metaTUEgSklELnBuZw==-.png', 'Bismillah Kenek', 'voluptatem-et-explicabo-facere', 'Ut ducimus earum repudiandae. Dolores adipisci quia quos. Qui explicabo omnis iusto eos et enim. Et non ratione dolorem dolor eos sequi vel. Recusandae ab sed ipsam quam nihil. Aut neque nulla laboriosam qui possimus enim. Ut delectus molestiae nobis dolores voluptas laudantium modi. Qui omnis ut voluptatem quia. Omnis temporibus explicabo sequi harum.', '2023-11-06 10:29:46', 1, NULL, '2023-11-02 08:11:32', '2023-11-29 06:21:23'),
(4, 4, 'https://via.placeholder.com/640x480.png/004455?text=dolor', 'Voluptas corporis deserunt velit esse temporibus dolores.', 'qui-eum-quia', 'Aliquam rerum eos rerum sit at commodi. Incidunt odio mollitia et non voluptate facilis. Aliquam adipisci vero voluptatem. Adipisci ratione magnam id nisi non a quo. Doloremque excepturi quis quibusdam quod autem nobis. Vel molestias doloribus quia id voluptatum iste facilis. Dignissimos aut fuga possimus. Dolores eos ratione cupiditate voluptatem sint fugiat voluptatem voluptatum. Suscipit iusto exercitationem officia et dolor accusantium hic.', '2023-11-08 21:50:03', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(5, 5, 'https://via.placeholder.com/640x480.png/00cc55?text=et', 'Qui sunt dolore perspiciatis incidunt fuga explicabo.', 'debitis-sit-quisquam-dolor', 'Repellat sit inventore quisquam iste. Est aut dolores rerum non suscipit blanditiis eligendi quasi. Voluptatum ducimus nihil reiciendis sed aut tempora ipsum. Sunt est consequatur sed sit voluptatum. Incidunt illum voluptas quidem laboriosam qui. Aut commodi tempora dolores sequi. Et impedit rerum et quia dolorem quam. Molestias ipsam id quo nam. Eum magnam eum qui sed aliquid. Ut voluptatum atque rerum excepturi autem numquam. Dolore est velit aut aperiam reiciendis at asperiores dicta. Quia illo qui assumenda odio incidunt. Nesciunt est enim autem ipsa distinctio libero.', '2023-11-08 18:35:07', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(6, 6, 'https://via.placeholder.com/640x480.png/006699?text=aut', 'Dolore sed ipsum nesciunt.', 'alias-dolorem-repellendus', 'Magni excepturi hic sed et. Laudantium eum omnis a quo qui ullam ut. Nemo laborum totam consequatur aspernatur et. Quisquam adipisci et omnis perspiciatis aliquid provident. Quidem et ipsam dolorum quaerat sit sunt. Ut voluptatem eligendi explicabo cum quae sequi repellat. Omnis ab ullam quos esse quis. Mollitia est dolor illo omnis aut neque dolor. Et debitis qui distinctio cumque. Optio voluptas in ea voluptate.', '2023-11-02 00:23:21', 1, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(7, 7, 'https://via.placeholder.com/640x480.png/0077dd?text=rerum', 'Quisquam adipisci voluptatum quis quod aut qui qui.', 'dolores-excepturi-veritatis', 'Eum voluptate id molestiae et ullam commodi. Provident voluptatibus est quam dolorem. Neque consequatur est consectetur. Eum dolores doloremque vitae debitis consequuntur. Dignissimos voluptatum quaerat temporibus vel. Cupiditate et ex doloribus autem aut temporibus. Placeat nam pariatur iure laborum. Doloremque esse eum non molestias ut autem. Consequatur ut libero fugiat sint voluptatem quia. Voluptatem possimus totam et dolores quia.', '2023-10-26 16:09:10', 1, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(8, 8, 'https://via.placeholder.com/640x480.png/00bb22?text=dolor', 'Perferendis saepe delectus ipsum aperiam voluptate.', 'dicta-tempore-odit', 'Eos iste necessitatibus et qui quia inventore. Nulla aut ipsum est eius aut incidunt enim. Non eum quo et aut voluptate incidunt facere. Quia laboriosam vel quis voluptatem exercitationem qui aut. Aut ea consectetur fugit facere rerum. Exercitationem velit modi nobis eligendi occaecati suscipit libero eum. Voluptatem quo beatae voluptatem aliquam culpa. Quis nesciunt nisi modi nisi dolorem quia. Inventore soluta harum et. Enim totam consequatur inventore est impedit. Blanditiis fugiat hic qui excepturi aut. Quisquam nisi delectus sed consequatur dolore omnis et.', '2023-10-31 06:06:04', 1, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(9, 9, 'https://via.placeholder.com/640x480.png/007700?text=tenetur', 'Tenetur quia facere distinctio cum voluptatem laboriosam.', 'corporis-officiis-id-sequi', 'Alias et consequuntur sint consequuntur cumque commodi. Dignissimos quos ut voluptatem vitae omnis beatae. Quia minima quaerat ut qui cum. Suscipit rerum rerum quam quis sapiente. Architecto qui fugit nulla nihil. Non ducimus pariatur non rerum doloremque impedit. Dolores aliquid ex et quia est occaecati id. Eos dicta enim voluptas. Provident in est corrupti error officiis dolorem aspernatur aspernatur. Repellendus odit doloribus culpa aliquam est. Sit facere fugiat laborum esse. Esse eos dolorem qui aut omnis.', '2023-11-06 17:12:01', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(10, 10, 'https://via.placeholder.com/640x480.png/00ccff?text=reiciendis', 'Est dolore delectus repellendus molestiae quo qui.', 'officia-autem-eaque-dolor', 'Ut libero quaerat beatae ea. Sit beatae hic nam assumenda. Dolorum minus repellat quod non aut qui beatae. Aliquam saepe deleniti et tenetur magni. Doloremque iusto praesentium omnis distinctio dolores omnis adipisci. Deserunt reiciendis ut velit tempora explicabo debitis. Rerum eos labore veniam quasi omnis.', '2023-11-05 16:02:57', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(11, 11, 'https://via.placeholder.com/640x480.png/002299?text=aut', 'Molestiae odio nihil maxime omnis sint beatae distinctio ut.', 'provident-odio-eos-est', 'Repellat ipsam ut nihil minima. Aut est et itaque dolores nisi nostrum totam. Corrupti suscipit aut porro aspernatur. Qui et nesciunt neque exercitationem sint et fugit. Ut dolores similique laboriosam aut non repellat totam facere. Facere iure eos rerum deleniti qui illo libero. Omnis quis qui est nulla. Rerum maxime voluptatibus ut tenetur at et. Amet sunt dolorem sit qui nam fuga ut. Dolorem laudantium minus repellendus cumque nemo. Quia iste occaecati quia praesentium ratione. Ad voluptatem rerum doloribus earum dolor. Corporis voluptatum saepe nam dolorem et beatae et placeat. Harum iste sapiente pariatur similique.', '2023-10-29 20:26:11', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(12, 12, 'https://via.placeholder.com/640x480.png/004477?text=ad', 'Voluptatem temporibus et ut esse debitis.', 'recusandae-optio-ducimus', 'Commodi ipsam architecto officiis eveniet. Soluta inventore eum qui. Omnis quibusdam unde et excepturi itaque amet et esse. Sunt quas incidunt delectus doloremque placeat. Facilis id ipsam qui eius dolorum nisi. Illo voluptates eum dolor adipisci et voluptatem. Aut voluptatem ipsum atque dolorem et dolores aut.', '2023-11-03 14:51:55', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(13, 13, 'https://via.placeholder.com/640x480.png/00dd33?text=eveniet', 'Nostrum non optio repellendus nostrum.', 'explicabo-omnis-unde', 'Ut dolor ut quam explicabo. Omnis voluptatem optio perspiciatis accusamus molestias. Eos sit quia at perferendis delectus. Quidem eaque maiores similique dolores aut. Quo doloribus est accusamus. Ut cum excepturi corrupti quaerat aut odio. Deleniti doloremque et at et velit nam dicta. Nemo ut veritatis facere omnis at id. Rem itaque cupiditate in consequatur fugiat. Reprehenderit commodi molestiae exercitationem nulla. Soluta ipsam nam ad explicabo sunt et. Et molestias laudantium pariatur. Voluptas nulla facilis aut quisquam earum cupiditate.', '2023-10-29 03:33:07', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(14, 14, 'https://via.placeholder.com/640x480.png/00ddee?text=id', 'Beatae qui itaque est numquam sunt voluptatem praesentium.', 'beatae-quasi', 'Qui quidem magnam cum maiores culpa. Est et ut dolorem dolorem autem hic est. Repudiandae aut eius est suscipit non iusto. Consectetur est enim est aliquid voluptas fugit. Ipsum quod sequi praesentium saepe iste explicabo maiores eos. Asperiores laborum beatae officiis dolore aliquid eaque doloribus dignissimos. Cupiditate suscipit consequatur iure quo dicta. Repudiandae iure minima rem magni. Delectus libero et nihil saepe magni. Optio nemo repellendus omnis ducimus. Voluptas mollitia ut quae inventore et enim rem.', '2023-11-07 13:43:47', 1, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(15, 15, 'https://via.placeholder.com/640x480.png/0000aa?text=sit', 'Occaecati voluptatem eaque ea sit corporis nihil quia temporibus.', 'incidunt-natus-laborum', 'Dolorem deserunt asperiores velit nobis. Voluptas minus eum autem rerum velit commodi est aut. Dolore facilis nobis dolore rerum iste iusto. Architecto sit natus quia cum. Provident pariatur consequuntur rerum sequi. Odio velit eveniet dolor cum. Aut voluptates vitae voluptate ipsam et.', '2023-10-27 16:08:18', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(16, 16, 'https://via.placeholder.com/640x480.png/00ee44?text=omnis', 'Aut laborum sunt maxime autem.', 'praesentium-nemo-ut-quia-adipisci', 'Voluptatem aut quidem doloremque commodi rerum beatae. Aut sequi omnis et eaque eum in quisquam et. Iusto pariatur dolorem recusandae sit earum facere accusantium. Voluptatem cupiditate vitae voluptatem qui doloremque tempore. Vitae minima mollitia voluptas magni consequatur enim et. Excepturi hic rerum enim consectetur excepturi. Cupiditate placeat quidem vel natus mollitia. Sapiente ut assumenda tenetur eum ut perferendis dignissimos et. Aut rem est suscipit.', '2023-11-02 12:07:38', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(17, 17, 'posts/thumbnails/xd3or2EDczC2UiK9zeFxQRgUGUIaAL-metaaW1hZ2VzLmpwZw==-.jpg', 'The Fashion In Dor', 'perferendis-alias-dolores', 'Tenetur natus voluptas rem recusandae. Natus ullam laboriosam fugit dolor nam. Corporis quos molestiae quisquam neque illo aut. Similique quo vel nobis modi sapiente et molestiae. Aut illo rerum laudantium tempora totam. Voluptatibus eum et laudantium quos dolorem a. Temporibus nemo libero mollitia autem sunt consequuntur non quia. Dolore ullam et ea est voluptate sed delectus omnis. Asperiores quidem magnam ipsa fugiat. Consequuntur inventore qui explicabo dolorem.', '2023-11-03 02:55:42', 1, NULL, '2023-11-02 08:11:32', '2023-12-14 07:46:56'),
(18, 18, 'https://via.placeholder.com/640x480.png/00ddff?text=quia', 'Quis ad odio delectus rerum dicta.', 'eligendi-ipsam-nostrum', 'Nam quaerat adipisci deserunt delectus corrupti exercitationem. Sit eos ab aut est qui. Dolorum veniam at aut commodi ea et. At dicta explicabo autem et ut. Accusantium sed non exercitationem quibusdam exercitationem. Molestias vero aspernatur maiores et beatae aut. Quo nam dolorem ratione et nisi consequatur. Impedit commodi voluptatem nemo rerum. Cupiditate alias aut consequuntur labore non eum modi.', '2023-11-03 04:03:32', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(19, 19, 'https://via.placeholder.com/640x480.png/002299?text=hic', 'Quia perferendis rem vero molestiae maiores nostrum repellendus.', 'aliquid-officiis-eos-impedit', 'Voluptatum sapiente voluptatem distinctio dolore reprehenderit harum. Quia excepturi provident itaque iusto culpa in. Cumque in quia non similique. Voluptatem est voluptas rem possimus nihil ipsam consequatur. Voluptatem quisquam ab quidem est beatae. Fuga doloremque a ratione suscipit officiis quod. Vel ipsam cum praesentium voluptatem molestiae. Praesentium ducimus qui pariatur distinctio non. Vel quo quis fuga excepturi rem. Voluptas aut aperiam quis repellendus magnam quisquam. Quod in non at et. Dolor sunt recusandae ad aliquam in magni nostrum.', '2023-11-03 15:29:36', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(20, 20, 'https://via.placeholder.com/640x480.png/00ee55?text=est', 'Et occaecati alias quia modi cumque pariatur.', 'et-delectus-reprehenderit', 'Voluptates autem et voluptas quidem nam sint. Doloribus et voluptatem voluptatem voluptates ipsa sequi dolores. Consequatur qui mollitia asperiores culpa tempore maiores. Dolores officia exercitationem voluptate quia. Autem est suscipit mollitia optio dolor recusandae. Minus non possimus et quam quae quasi consequatur. Consequatur sed optio enim quam accusamus sit amet. Nulla molestiae aut impedit voluptas enim consequatur. Sit unde eaque fugit tempora qui. Quas incidunt a quia id deleniti.', '2023-11-02 09:37:18', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(21, 21, 'https://via.placeholder.com/640x480.png/002211?text=et', 'Tempore cupiditate facere voluptatem aut necessitatibus ut.', 'quo-qui', 'Rerum sunt tempore illo rem fugiat quia culpa non. Aliquam cum cum porro ut non. Nihil fugiat et voluptatem voluptas architecto omnis facilis. Quia et expedita voluptatem soluta odit ea. Vero voluptatem et occaecati atque facere. Rerum debitis voluptas numquam voluptas nesciunt corporis. Accusantium et corporis autem maxime quia sed amet adipisci. Totam sit sunt inventore alias. Quaerat ex nemo voluptas voluptates molestiae atque modi. Dolorem cumque necessitatibus sed voluptate. Possimus a unde dolore ex perferendis id. Quo qui qui assumenda.', '2023-11-08 16:26:59', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(22, 22, 'https://via.placeholder.com/640x480.png/00ffee?text=aut', 'Illo voluptatem et id eum hic ut.', 'non-qui-ut-eos', 'Sit qui perferendis amet dolores sunt voluptatem. Ut voluptatem a nihil ducimus possimus. Repellat ipsam necessitatibus vel quibusdam. Exercitationem ratione et est ea dicta. Quod quae ut omnis voluptas impedit illum. Ut ad eveniet sint rerum sit. Impedit sint expedita et maiores sint et. Quia autem nostrum sed minus officia magnam.', '2023-11-06 01:36:57', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(23, 23, 'https://via.placeholder.com/640x480.png/00bb44?text=in', 'Et id doloribus totam quae cupiditate.', 'error-sit', 'Dignissimos veritatis vitae tempora accusamus impedit quia similique. Doloremque unde eligendi voluptas debitis. Et ea repellendus sunt ut nihil commodi praesentium. Molestiae cupiditate et harum nostrum necessitatibus quam sed. Alias autem natus vitae est velit et. In aperiam neque laborum cum in. Autem et quasi sit voluptas architecto. Sunt ut facere a exercitationem id esse ut. Est quibusdam rem ullam et qui dolores animi ut. Blanditiis consequatur repudiandae illo qui.', '2023-11-06 18:37:40', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(24, 24, 'https://via.placeholder.com/640x480.png/002200?text=explicabo', 'Minima magnam tempora totam.', 'nulla-sint-quis-blanditiis', 'Soluta aut ullam alias. Dolor consequatur reiciendis sunt rerum ut quas. In inventore quo incidunt qui. Id suscipit necessitatibus quibusdam et. Distinctio dignissimos esse asperiores dignissimos ut maiores fugit. Quia nobis quo vero rerum nihil. Earum ut doloremque quia maiores nihil dolorum. Excepturi temporibus ab nostrum maxime qui quas aliquid.', '2023-11-02 15:52:29', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(25, 25, 'https://via.placeholder.com/640x480.png/00eecc?text=harum', 'Asperiores soluta sit laudantium sunt illum et.', 'quidem-et-eum-nam', 'Cumque molestiae voluptatem minima ut. Omnis quas et quia ab ipsum. Ea minus aliquid in veniam consequatur animi quo. Perferendis et aut enim facere accusamus sit sit. Cupiditate nam fuga exercitationem asperiores qui. Inventore nobis quos optio rerum dolore. Nihil cupiditate deserunt ut aperiam est. Eum natus iste minus deserunt ad explicabo cumque. Minima non saepe vel id. Sit fuga debitis illum.', '2023-10-31 02:50:29', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(26, 26, 'https://via.placeholder.com/640x480.png/000099?text=alias', 'Maiores dolor harum officia cumque ea.', 'est-sunt-et', 'Voluptatem ut et repudiandae quod dolore inventore. Et est minus est pariatur pariatur omnis. Eius fuga in voluptate ducimus. Quia autem rerum et neque. Dolor facilis commodi in iure non. Id sunt accusamus vero enim quis quos. Ipsa quisquam nemo qui. Cumque repellendus nesciunt vel velit eveniet in quaerat. Labore ut qui beatae esse et id.', '2023-11-08 20:01:54', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(27, 27, 'https://via.placeholder.com/640x480.png/0099bb?text=dolorum', 'Officia ut et occaecati.', 'aut-cumque-corrupti', 'Repudiandae placeat esse minima ullam. Itaque quidem non sunt ut. Soluta minus temporibus illo natus veritatis veniam repellendus. Enim eligendi et omnis rerum consequuntur qui eveniet. Odio repudiandae quas voluptate voluptatem temporibus non rerum. Velit perferendis qui quos. Placeat et quibusdam aut. Est qui dolorem quia earum dolorem cupiditate tempore. Sunt in ea laudantium aliquam beatae. Unde rerum dolorem quo molestiae minus non dolore. Et nisi saepe consequatur voluptate explicabo provident ad rerum. Accusantium animi quod explicabo nisi accusamus doloribus voluptatem in. Vitae est quibusdam ipsa illum quam impedit harum iure.', '2023-11-04 20:54:37', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(28, 28, 'https://via.placeholder.com/640x480.png/0077ff?text=consectetur', 'Eos eos necessitatibus perspiciatis voluptatum aliquam temporibus laborum.', 'consectetur-et-culpa', 'Assumenda incidunt laborum at corporis accusantium. Non rem eligendi ipsa et quos nemo. Vero culpa suscipit quis doloremque vero in perspiciatis. Illo consectetur eveniet velit natus provident dolorum voluptatem. Perferendis architecto sed in autem vel aperiam. Facere itaque et ullam animi. Reiciendis nesciunt quam eos neque dolorum sequi.', '2023-10-29 17:29:40', 1, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(29, 29, 'https://via.placeholder.com/640x480.png/009988?text=sapiente', 'Ex assumenda qui id iure et est rerum rem.', 'enim-quis', 'Reprehenderit at consequatur minus vel. Voluptatem deserunt minus magni qui. Asperiores consequatur placeat asperiores possimus accusamus porro voluptatum. Inventore quia est quod laborum expedita voluptas voluptatem. Est ea molestiae officiis ut et eaque repudiandae. Itaque vel adipisci eaque facilis debitis rerum sed ea. Omnis non et et sint. Deserunt ab voluptates voluptas sed. Et non rerum dolore tempora quas dolores. Officiis perferendis hic tenetur placeat ad quis. Sit libero deleniti aperiam dolores impedit. Similique hic nostrum nihil soluta.', '2023-11-03 05:40:44', 0, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(30, 30, 'https://via.placeholder.com/640x480.png/0044aa?text=quo', 'Illum corporis qui nam.', 'officiis-in-aut', 'Officia quod minus eum ut ut dolor. Non quo asperiores aut quia quidem quae corrupti cumque. Consequatur iste mollitia quisquam aliquid qui occaecati. Qui et dolore eius possimus. Sed repudiandae est velit dolores. Itaque placeat aspernatur deleniti officia cum amet numquam animi. Blanditiis consequatur voluptatibus magni aut. Voluptas dolor omnis qui sed necessitatibus vitae. Reprehenderit maxime explicabo debitis at veritatis nemo quod.', '2023-10-29 15:07:49', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(31, 31, 'https://via.placeholder.com/640x480.png/00aacc?text=vel', 'Sit qui quo dolores est temporibus quaerat.', 'rem-numquam-veritatis-sit-magni', 'Necessitatibus impedit molestias sequi distinctio nesciunt ea omnis. Doloremque aliquam quis quis ut. Illo cupiditate quia facere facere voluptas numquam. Qui in sint voluptatem quis. Modi placeat iure vitae voluptatum qui accusantium sint. Non delectus nobis molestiae quia ullam illo ut. Non nihil aut est. Nam voluptate praesentium repellendus repellat laborum maxime est. Distinctio illum veniam aut. Voluptatem ipsum vel necessitatibus saepe cum. Corrupti vel molestiae nisi. Reprehenderit nemo maiores molestiae eos quo praesentium.', '2023-11-07 01:19:59', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(32, 32, 'https://via.placeholder.com/640x480.png/00dd88?text=enim', 'Rem adipisci commodi ut odio sit totam.', 'tenetur-tempore-ipsum', 'Consequatur quia id vero. Sint sed non corporis officia ab rerum doloribus. Dolorem itaque soluta blanditiis illo et repellat temporibus. Molestias molestias dicta natus earum vero sint soluta. Blanditiis saepe aut et laboriosam delectus. Ipsam corrupti necessitatibus in dolorum omnis. Aut minima quod velit libero. Repellat quisquam et recusandae ducimus sunt et quam. Officiis dolor est maiores ab. Eligendi quo facilis possimus sit ex quis. Aut aut illum architecto fugiat itaque. Quisquam ea eaque qui modi consequatur quos. Veritatis aut dolor iusto consequatur voluptatibus iusto aperiam maiores.', '2023-11-06 12:15:15', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(33, 33, 'https://via.placeholder.com/640x480.png/007777?text=et', 'Quia ab soluta quidem est ratione est.', 'quaerat-et-ea', 'Enim velit voluptates occaecati. Et consequatur ut quos quia iusto sit. Illum odit modi in recusandae repellendus repellendus totam. Officiis maxime error sed accusamus in aliquam facilis. Et libero impedit vel voluptas sunt et sit pariatur. Dolorem accusantium et beatae minus non. Eligendi voluptatum quo aperiam odit natus consectetur sed. Et et quam dolores quo similique eum. Culpa omnis provident cupiditate quibusdam sint non.', '2023-11-01 11:51:08', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(34, 34, 'https://via.placeholder.com/640x480.png/000044?text=repellendus', 'Culpa odio autem voluptates asperiores qui.', 'quae-error-ab-quaerat', 'Quia officiis eveniet corrupti veniam incidunt qui facere. Autem explicabo consequatur nam. Ut iure vel minus amet. Minima exercitationem nemo natus qui illum. Voluptas a eligendi hic ut. Iure provident fuga facere sint. Dolor nemo cupiditate ad ut id. Dolorem sint cum quos dolor. Qui ipsa itaque laboriosam accusantium iusto aut expedita. Qui aut animi corporis rerum possimus. Est est sit non. Qui et atque aut ipsam. Repudiandae fuga repellendus aut unde amet. Praesentium perspiciatis vel sunt est quisquam.', '2023-10-28 12:06:47', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(35, 35, 'https://via.placeholder.com/640x480.png/002266?text=suscipit', 'Fugit rerum doloribus beatae consequatur vel et.', 'vitae-suscipit-dolores', 'Velit facilis eaque mollitia eum nihil doloremque dolorum. Necessitatibus laborum magnam nesciunt blanditiis magni voluptate excepturi exercitationem. Eius quaerat et animi rerum. Expedita iste et deleniti voluptatem officia. Laborum accusantium dolorem enim laborum. Numquam sed rerum non et ut ad. Assumenda esse voluptate reiciendis reiciendis. Aut possimus molestiae voluptatibus soluta. Unde nemo eius ipsa voluptatem.', '2023-11-03 04:48:20', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(36, 36, 'https://via.placeholder.com/640x480.png/009966?text=ipsam', 'Ipsam in dolorem voluptatem qui repellendus.', 'et-nam', 'Laboriosam ut tempore quis eius est vel. Est vitae ea harum corporis. Atque aut optio et fuga. Quas eaque dignissimos possimus officia sit culpa. Rerum ea qui qui dicta quam aut laborum. Quia et et numquam laudantium animi. Sed reiciendis doloremque qui. Magnam nemo omnis enim sint accusantium explicabo nemo. Quibusdam officia et et ex. Ut accusantium vitae nam voluptatum nemo minima sit. Ipsam harum dolorum nihil tenetur quis sint sequi.', '2023-11-08 06:07:25', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(37, 37, 'https://via.placeholder.com/640x480.png/006655?text=perferendis', 'Illum ut eaque omnis dignissimos.', 'ex-nemo-et-non', 'Animi expedita sunt mollitia possimus optio illo. Quibusdam id et voluptatem et dolorum quidem. Ut molestiae occaecati veritatis minus provident temporibus. Deleniti eos quia qui dolor ab. Nihil fugit nisi occaecati voluptas et sit iusto. Minus quod magnam expedita porro autem nulla porro quam. Voluptatum ab in expedita aliquid adipisci consequatur. Tempora sequi sit ducimus pariatur et non voluptatem. Odit qui ipsam sapiente beatae delectus ipsa. Quod accusamus aliquid nesciunt dicta ipsum libero reprehenderit nemo. Voluptates rerum autem porro aut numquam doloremque. Amet sit et quis voluptatem in rerum modi voluptatum.', '2023-10-31 22:42:12', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(38, 38, 'https://via.placeholder.com/640x480.png/0044ff?text=dicta', 'Aperiam officiis laborum assumenda qui.', 'est-voluptatem-fuga', 'Omnis autem et nisi voluptas. Id et iusto molestiae pariatur asperiores ut aut quibusdam. Aut et cumque voluptas quia. Totam est occaecati alias et porro quis nihil. Qui labore alias dolor dignissimos ut occaecati quo quo. Voluptas culpa illo et non. Ea quod tempore et aspernatur. Et ipsa et et quo velit. Perferendis eveniet quidem et quis. Voluptatibus necessitatibus consequuntur accusantium. Sed dignissimos velit ut corrupti laboriosam ut. Et eum sed ut quaerat porro quaerat quisquam.', '2023-11-01 09:21:14', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(39, 39, 'https://via.placeholder.com/640x480.png/006622?text=et', 'Dolores provident quia quaerat.', 'repellat-autem-neque-porro', 'Eos quia ullam qui laboriosam. Voluptatem perspiciatis saepe pariatur atque voluptatem nostrum tenetur et. Nihil nulla nisi numquam illum illo sit. Odio molestiae laboriosam aut est libero minus vero molestiae. Ipsam et dignissimos omnis et. Nostrum voluptatem commodi cupiditate consequuntur fuga asperiores. A velit et qui.', '2023-11-09 03:08:37', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(40, 40, 'https://via.placeholder.com/640x480.png/00ffdd?text=unde', 'Adipisci corrupti ut accusamus aut nulla deleniti delectus.', 'qui-quo-impedit', 'Impedit atque voluptatem libero tenetur. Corrupti eum dicta commodi ut magni rerum voluptas. Magnam quia et numquam libero corrupti similique possimus. Reiciendis voluptate laboriosam nostrum. Unde praesentium aut nisi. Facere libero maxime voluptas velit quo esse. Repudiandae consectetur aut sit modi voluptatum aliquam. Sed expedita et est molestiae illo. Et labore assumenda sit eum culpa omnis. Quis reiciendis soluta iusto. Ad officiis quod quisquam dolores minus repudiandae. Eligendi architecto eum sit. Et et praesentium eos libero quia fugit molestias.', '2023-11-07 13:02:12', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(41, 41, 'https://via.placeholder.com/640x480.png/002266?text=consectetur', 'Qui nesciunt accusamus consequatur voluptatum iure iusto eum.', 'ipsam-asperiores-ab-sed', 'Deleniti magnam at maiores sit voluptatem. Porro libero repellendus est nihil similique aperiam et voluptas. Maxime enim eaque voluptates laborum doloribus rerum aliquam. Dolores sed quia a fuga. Culpa repudiandae voluptatem reprehenderit iusto pariatur. Provident rem quis vitae esse. Et laudantium in omnis tenetur. Perspiciatis cupiditate dolorum quia. Qui consequatur iste ipsum est laudantium. Vel nihil similique quis est commodi. Pariatur non velit eligendi rem. Quia molestiae doloribus maxime dolor consequuntur nesciunt. Aspernatur qui dolorem sed suscipit tenetur error. Et voluptatem incidunt asperiores alias vel nostrum et.', '2023-10-27 16:36:27', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(42, 42, 'https://via.placeholder.com/640x480.png/00ff33?text=itaque', 'Odit quis quia sed id.', 'alias-maxime-et-harum', 'Dolor illum asperiores eveniet qui rerum dolorem ut ex. Incidunt enim dolorum ea reiciendis et. Excepturi quasi ab qui sint aut. Quo non et perspiciatis voluptatem. Rerum iure voluptate suscipit ducimus illum qui. Occaecati nulla est rem laudantium sit nesciunt. Incidunt maxime ipsum ab et possimus ipsam. Harum aut itaque recusandae magni.', '2023-11-08 18:36:50', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(43, 43, 'https://via.placeholder.com/640x480.png/00aaff?text=nesciunt', 'Ea officia quo magni odio autem qui rem.', 'iure-optio-voluptates-accusamus', 'Vel aperiam quos quia harum ipsa. Quia tempora est omnis sunt. Provident quasi et laboriosam ipsam et voluptatem eos aut. Eligendi autem minima rerum. Sed rerum cum velit eos unde id cum ea. Autem voluptatibus et numquam in laboriosam sed minima nobis. Qui et voluptas fuga expedita et ratione aut. At delectus excepturi quis rem quibusdam similique. Voluptates inventore qui et veritatis molestias. Molestiae quaerat cumque aspernatur nihil veniam. Distinctio eos quasi cupiditate commodi.', '2023-10-27 01:22:26', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(44, 44, 'https://via.placeholder.com/640x480.png/00bb11?text=excepturi', 'Sapiente qui ullam distinctio enim voluptatem dolorum.', 'sint-laudantium-omnis', 'Repellat iste unde qui. Dolores nam nostrum aut dolor ut itaque qui consequatur. Sequi sit voluptatibus enim deleniti deserunt. Officiis commodi nobis cupiditate officiis dolores. Porro et veniam nihil et. Repellendus est numquam est ipsa perspiciatis aut accusamus aperiam. Quo quis nisi ex culpa animi reprehenderit vel. Aut eius voluptas suscipit et. Eaque recusandae et eveniet suscipit repellendus cum cupiditate. Assumenda consectetur et numquam ut velit. Fugit consequatur iste expedita iusto a. Iure non laboriosam odit et id nesciunt voluptatem. Odit omnis modi hic voluptatem eveniet.', '2023-11-01 11:46:55', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(45, 45, 'https://via.placeholder.com/640x480.png/007744?text=voluptatem', 'Non aut sint voluptatem aut libero deserunt dolor.', 'alias-ut-qui-ut', 'Eum quo rerum veniam aperiam laboriosam ratione aliquam expedita. Ut reiciendis optio sit earum. Iste ex consectetur dolores et ea aperiam. Expedita nisi cupiditate voluptates fugit. Dicta sequi architecto aut vero tempore. Blanditiis dolores aspernatur corrupti et quia et. Modi aut consequuntur necessitatibus beatae. Consequuntur alias occaecati omnis est sunt. Nobis labore dolores modi debitis ipsam voluptatem eum. Deserunt placeat illo sapiente occaecati eius asperiores quia. Deleniti sint voluptatibus sit omnis culpa voluptatibus perferendis quia.', '2023-11-06 06:47:16', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(46, 46, 'https://via.placeholder.com/640x480.png/00ee99?text=inventore', 'Repellendus molestiae maiores deserunt qui voluptas sed nihil.', 'deserunt-sunt-minima-et', 'Ea aut quia aperiam fugiat ab quis vitae. Ipsam qui nam doloremque ut qui. Modi esse voluptatem aperiam tempore qui. Deleniti doloremque et totam velit neque architecto ut. In sed quaerat ut ea hic omnis. Nisi asperiores voluptatem cumque sint molestiae aliquam aut voluptatem. Vel numquam molestiae porro nihil adipisci. Odit iste saepe id non. Saepe voluptatem doloremque et eum sit sequi. Aperiam sed dolore est et. Quaerat non possimus voluptatibus reprehenderit. Fugit nulla laborum voluptas quod aspernatur.', '2023-11-08 11:13:51', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(47, 47, 'https://via.placeholder.com/640x480.png/0033cc?text=dolorum', 'Non non commodi optio deserunt aut.', 'ut-ipsam-atque-dolorem', 'Ducimus velit iusto quisquam aliquam aut. Aut ut et ut reiciendis sint tempora esse. Aut assumenda nihil distinctio non. Porro rerum ut adipisci est distinctio quo ut. Quas qui suscipit repellendus. Cupiditate illum minus nisi. Alias repellendus enim consectetur velit et neque. Autem unde a et eius aut.', '2023-11-01 08:11:03', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(48, 48, 'https://via.placeholder.com/640x480.png/008822?text=impedit', 'Aliquam omnis et inventore dolor ratione error fuga.', 'aut-neque-quis-illum', 'Occaecati cupiditate quam ea tempore ipsa suscipit. Voluptas reprehenderit inventore quis. Omnis sed veritatis occaecati libero. Consequatur velit debitis numquam officiis dicta officia magnam. Minus autem vel sit ex vel consequatur. Id dolorum explicabo consequuntur sint qui ducimus accusantium. Molestiae provident ad inventore et qui. Sapiente odio ut cum ut est et et culpa. Eos perferendis rem ad qui assumenda voluptatum. Ea itaque qui sint beatae. Velit ex qui fugit qui dolorem. Eum voluptate praesentium eum delectus provident ab quaerat. Nisi exercitationem quisquam minima. Beatae quam odio ut cumque exercitationem provident.', '2023-10-27 22:00:13', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(49, 49, 'https://via.placeholder.com/640x480.png/003366?text=soluta', 'Labore libero voluptatem impedit earum porro.', 'minima-sed-velit-tempore', 'Illum voluptas atque qui eius quas. Reiciendis fugit sit excepturi et quis qui nobis. Assumenda ea quis deleniti perferendis omnis magnam. Velit ea adipisci illum consequatur ipsam rerum. In est ut voluptatibus recusandae. Hic et accusamus nemo. Aut qui doloribus rerum. Dicta non distinctio facilis doloremque voluptatem autem reprehenderit. A ad veniam eos amet eos iure corporis. Iusto rerum fugiat maiores numquam facere aut ipsa. Minima quis ipsum omnis qui aperiam. Corrupti pariatur qui est quasi quia. Debitis suscipit aut consequuntur quibusdam ducimus.', '2023-10-28 19:11:43', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(50, 50, 'https://via.placeholder.com/640x480.png/003366?text=rerum', 'Et similique nemo sint aut fuga id nihil.', 'quaerat-ut-est-nostrum', 'In natus ratione voluptatem est cum neque sunt magnam. Id eum culpa dolorem autem voluptas ipsum. Natus in odio odit voluptates exercitationem pariatur. Et qui sunt doloremque consectetur nobis. Quisquam possimus quisquam rerum facere. Modi ad sed sint tempora iste deleniti. Reiciendis amet enim enim ut tempora quis esse. Voluptatum eaque dolor deleniti et iste. Qui quis rerum sequi doloribus sint. Repellat aut dolores totam sit libero est. Omnis unde dicta facilis nam sed consectetur vitae.', '2023-11-07 09:29:14', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(51, 51, 'https://via.placeholder.com/640x480.png/008855?text=harum', 'Modi sit et accusantium qui sed itaque.', 'quisquam-quos-at-quod', 'Repellendus est enim et sapiente odit corporis. Qui veritatis enim ut velit explicabo occaecati. Expedita adipisci tempore corporis. Facilis aut quaerat aliquid beatae vero. Mollitia consequatur est aliquid in. Similique id maxime officiis dolores vero rerum. Qui est reiciendis dicta nihil ut non. Id sunt itaque libero et. Assumenda ad atque harum nobis in laboriosam optio. Molestias minima magni dicta illum error nesciunt.', '2023-10-27 22:29:28', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(52, 52, 'https://via.placeholder.com/640x480.png/004466?text=rerum', 'Tempore labore aliquam quae repellendus vel sunt corporis qui.', 'delectus-quis-perferendis-ab-animi', 'Et asperiores aut at et ad temporibus. Dolorum quaerat ut eum sunt. Eius eum quo ut sapiente voluptas placeat ratione. Repudiandae itaque expedita quam sed. Rerum tempore et et similique vitae. Ut ut sunt harum quod officia quam. Reiciendis dolorem saepe omnis laudantium non aut ratione. Excepturi est inventore reiciendis alias. Aspernatur porro similique dolores autem sapiente id unde ut. Voluptas esse ut eligendi maxime distinctio voluptatibus. Repudiandae dolorem blanditiis et inventore. Dolores inventore porro assumenda accusamus.', '2023-10-26 15:11:15', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(53, 53, 'https://via.placeholder.com/640x480.png/009955?text=saepe', 'Enim aliquam quidem accusantium alias ut ab deserunt.', 'quia-aut', 'Magni necessitatibus deleniti illum quis error eligendi. Tempore non nulla repudiandae veniam et. Accusamus pariatur aut a. Sit architecto eius placeat hic dicta sunt qui. Est consequatur voluptate voluptas rerum reiciendis dolor recusandae. Quibusdam delectus nisi dolore nam quia consectetur repudiandae. Eum voluptatem similique aperiam. Ratione est voluptatem quaerat et enim maxime qui. Omnis non eligendi ducimus deleniti est. Aut suscipit sed perferendis et illum aut quis. Consequatur et eos eos dolorem.', '2023-10-31 22:06:27', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(54, 54, 'https://via.placeholder.com/640x480.png/008833?text=inventore', 'Ut autem dolore laboriosam.', 'dolorem-magni-perferendis-doloribus-est', 'Voluptate veniam eaque dolores. Aut eum autem accusamus ducimus harum. Dicta praesentium et aut sed. Nostrum eveniet facere debitis odit non. Debitis commodi consectetur non. Dolor tempora sed dolores et nemo voluptatem possimus. Aut temporibus ipsam sit rem ratione.', '2023-11-05 12:44:16', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(55, 55, 'https://via.placeholder.com/640x480.png/009966?text=nostrum', 'Voluptatem non accusantium perspiciatis maiores.', 'voluptatibus-aut-commodi', 'Nisi quia rerum perferendis doloremque magni. Error ad deserunt animi aut optio tenetur qui. Sed expedita et ut eos consequatur inventore vel. Quas voluptate et atque maiores. Eum quod ut impedit sed. Beatae et voluptates dolores magni quis expedita exercitationem. Quaerat dolorum sit quod doloremque numquam voluptates qui. Fugit incidunt iste aut vero assumenda occaecati. Ea aut ut dolor numquam eos dolorem facilis. Minima ratione eum perferendis maxime explicabo dolore. Odit totam eligendi dolores pariatur ullam. Impedit et facere non quae facere.', '2023-10-29 15:03:58', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(56, 56, 'https://via.placeholder.com/640x480.png/000011?text=commodi', 'Error ipsam ea est maiores quos repellendus laboriosam.', 'veritatis-inventore-facere', 'Consequatur atque possimus sed asperiores libero. Quam cum velit dolore nisi fugiat. Cum nulla ut sed sunt et laudantium. Harum qui perspiciatis laudantium est inventore. In est vel quis doloribus. Officiis incidunt nulla impedit. Ex et eveniet enim ab blanditiis sequi dolor et. Doloremque assumenda distinctio dolorum dolorem quia tenetur. Aut explicabo dolorum omnis consequuntur quod aut. Dolores animi enim nam amet molestias quo. Doloribus est neque nulla. Voluptatem veritatis id eos quia placeat harum. Odit sed dolor et praesentium et et.', '2023-10-28 18:50:19', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(57, 57, 'https://via.placeholder.com/640x480.png/001133?text=impedit', 'Voluptas exercitationem facere quam.', 'recusandae-suscipit-distinctio-et', 'Facere voluptas molestiae in distinctio praesentium sequi adipisci ea. Dolorum ut iusto ex possimus vel. Odio in expedita reiciendis qui. Modi nihil eius quisquam nemo modi quis. Atque architecto fuga et est molestias. Vel minima a voluptas amet voluptas necessitatibus quo. Molestiae sed minima magnam. Quasi eum inventore sed eligendi maiores. Nostrum asperiores dolores rerum cupiditate eum magni.', '2023-11-01 03:50:12', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(58, 101, 'posts/thumbnails/JBsk9GJKGpEMQeTO6Ec13Ciefp4FPF-metaaW1hZ2VzLmpwZw==-.jpg', 'This is Fashion Now', 'dolores-quia', 'Aut est necessitatibus qui autem veniam voluptas delectus eveniet. Vel quisquam delectus facilis laborum. Nihil ut asperiores asperiores consequatur fugit libero corporis. Qui ut voluptas blanditiis ducimus tempore. Necessitatibus corrupti autem eius numquam. Harum rerum at debitis sint maiores quibusdam corporis libero. Commodi ullam sit et cum fugit qui blanditiis. Ullam accusantium id sed vel qui. Non fugiat assumenda recusandae ut aut natus asperiores. Eaque dolorem aut et et. Harum sint harum magnam sapiente necessitatibus facilis sed. Ut aspernatur quae tempore sit ullam dolor aut pariatur.', '2023-11-09 04:00:28', 1, NULL, '2023-11-02 08:11:33', '2023-12-14 07:48:59'),
(59, 59, 'https://via.placeholder.com/640x480.png/005555?text=et', 'Consectetur distinctio repudiandae veritatis non eveniet sed repellat.', 'tempore-aut-error', 'Velit debitis nulla nisi id. Et voluptatem id impedit molestias consequatur aut a ea. Similique quaerat et eius culpa vitae maxime. Nam in dolorem sequi rem libero temporibus perspiciatis. Accusantium et delectus suscipit et dolor. Similique quae id placeat et ut quis. Enim nam omnis qui harum commodi quis. Aut unde occaecati dolor qui quaerat laudantium ea velit. Dolores necessitatibus ipsa vero sed. Nesciunt sunt magnam aut libero. Libero error cum voluptatum est reprehenderit. Explicabo in totam recusandae dicta odio occaecati. Magni sunt consequatur quia. Cumque beatae quaerat rerum iusto est quis.', '2023-10-29 03:40:05', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(60, 60, 'https://via.placeholder.com/640x480.png/001111?text=ut', 'Minus hic est reprehenderit ipsum voluptatem eos excepturi modi.', 'animi-sequi-vel-quasi', 'Delectus ab natus veritatis et voluptate. In voluptatum exercitationem cumque nihil dolorem. Alias in sed soluta ea sint aut voluptatibus. Ullam rerum quasi labore quae omnis omnis aut. Qui natus eos aspernatur cupiditate id tempore aut. Deleniti ea est iusto aut dolor quas vel vel. Enim natus dolorem ratione voluptas et animi. Iste enim soluta modi molestias animi. Non eveniet porro sit omnis corporis incidunt alias. Quo numquam qui nulla error magnam tenetur alias soluta. Quod debitis ratione distinctio maxime eligendi. Libero harum qui vel dicta omnis qui perspiciatis velit.', '2023-11-08 13:21:46', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(61, 61, 'https://via.placeholder.com/640x480.png/0022aa?text=nostrum', 'Sequi veniam est at excepturi quis dicta.', 'magni-occaecati-ea', 'Nemo labore provident explicabo nobis sit. Sequi labore autem dolorem est ex. Et ea sit ut sed recusandae. Blanditiis vel aliquid omnis ut. Recusandae voluptas non sit eos nam. Ad est soluta et minus. Ullam quas ea asperiores cumque. Ut dolorum ut adipisci a libero eum.', '2023-11-06 21:21:01', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(62, 62, 'https://via.placeholder.com/640x480.png/0066ff?text=possimus', 'Quia vitae dolor quos natus saepe fugit labore.', 'perferendis-id', 'Nisi ut numquam est reiciendis neque maxime quia eos. Perspiciatis sit dolorem modi molestias eius. Repudiandae non et commodi recusandae. Earum enim amet consequuntur eaque officia et impedit. Culpa a aliquid deleniti quia sit qui. Tenetur rem minus ipsum qui. Adipisci officia eum voluptate expedita. Minima at voluptas et eum excepturi omnis sint. Odit voluptas saepe natus. Velit rerum et corrupti praesentium in et. Fuga beatae qui facere molestiae laboriosam. Sed aperiam quo vel et. Repellat est et corrupti non voluptatem doloribus eveniet. Velit et est saepe ea.', '2023-10-29 16:00:32', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(63, 63, 'https://via.placeholder.com/640x480.png/00aaff?text=ipsum', 'Aut nemo repudiandae dolor repellendus ullam et ullam.', 'perspiciatis-magni-eius-ducimus', 'Perferendis nam quos soluta eius dolorum perferendis ipsa totam. Expedita est nemo esse eum voluptate. Dolores voluptates consequatur similique natus dicta. Eligendi voluptas qui dolorem optio. Quibusdam libero voluptates hic vel nam. Labore reprehenderit exercitationem ipsam vel repudiandae rem. In possimus totam iure. Tenetur fugit tenetur maxime vel assumenda et deleniti. Ipsum vero aut et temporibus aperiam qui. Beatae qui libero quia non aut at quo. Nostrum ipsa perferendis atque. Quas ducimus et dolor architecto.', '2023-11-06 10:52:40', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(64, 64, 'https://via.placeholder.com/640x480.png/001122?text=voluptas', 'Praesentium accusantium accusantium occaecati voluptatibus.', 'earum-quisquam-nulla', 'Eos ullam doloremque consectetur et repellendus excepturi. Nesciunt molestiae et vel est nemo explicabo quis. Omnis consequatur dolores eveniet et illum. Ducimus commodi similique corporis ducimus adipisci provident ab est. Ratione qui recusandae voluptatum deleniti et officia. Recusandae quod error ipsum natus maiores. Rem quasi eius alias optio officiis. A quisquam ut possimus totam eos dolor saepe.', '2023-11-02 17:50:55', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(65, 65, 'https://via.placeholder.com/640x480.png/0099bb?text=quia', 'Officia nostrum culpa ratione.', 'officiis-non-exercitationem-quis-quis', 'Dolorum ut eos laboriosam aut consequatur et quia. Sunt ut voluptates est. Voluptatem porro nihil rem et. Aut laborum repudiandae voluptate aut aut illo est. Pariatur sed ab dolorem voluptatem. Ducimus perspiciatis occaecati mollitia et qui. Quos dolorum iste delectus tenetur doloremque. Totam quaerat nesciunt enim reiciendis nostrum eveniet beatae. Et voluptas placeat aperiam quod.', '2023-11-06 09:14:39', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(66, 66, 'https://via.placeholder.com/640x480.png/002233?text=placeat', 'Aperiam inventore quidem nisi in esse et.', 'natus-sit-accusamus-voluptatem', 'Sit impedit quibusdam accusamus reprehenderit expedita voluptate. Voluptates dolor incidunt tempore qui non assumenda. Saepe incidunt dolorem odit et exercitationem dolores. Ducimus dolores voluptates rerum ea rerum deleniti. Cum quia deleniti exercitationem facilis quis. Odio voluptatem sequi et voluptates. Accusamus perspiciatis ullam minus aut aut. Veritatis animi ut sed illum enim debitis ducimus. Ea et rerum nobis alias. Molestiae vel quo sunt in cupiditate.', '2023-10-27 21:37:04', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(67, 67, 'https://via.placeholder.com/640x480.png/0022bb?text=dolor', 'Officiis fuga architecto est alias omnis exercitationem laborum vel.', 'qui-nobis-sapiente-voluptatem', 'In ipsa ut qui fugiat. Fugiat vel non ipsa veritatis. Assumenda consequatur eveniet vero sed velit sed veritatis. Doloribus voluptatibus voluptatum ut voluptates dolorum. Enim blanditiis aut quos ut impedit commodi. Quia sit consequatur eius pariatur. Repellat vel possimus ab expedita tenetur vel provident. Excepturi facilis deleniti nesciunt earum suscipit sed placeat cumque. Vel consequuntur corrupti exercitationem vitae et itaque. Quia in labore quisquam et veritatis. Quo veritatis recusandae mollitia amet itaque qui in. Quidem numquam maiores eveniet.', '2023-10-29 15:28:10', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(68, 68, 'https://via.placeholder.com/640x480.png/004466?text=deleniti', 'Quia minima at consequatur perferendis suscipit ab.', 'aliquam-vel-at', 'Iste id repellendus rem eos. Ut odio excepturi eos. Minima ipsum qui rem ut. Quasi dolor qui sit hic aut. Possimus mollitia et eos. Ullam ea tenetur optio. Non et ut ea voluptas animi magni eum dolorem. Aut quidem iusto hic quia labore. Quo expedita quis debitis. Molestias ad provident sit aliquid amet iure. Et voluptas dolor nihil expedita. Qui assumenda et aut quis. Reprehenderit et rerum voluptas fugit nisi inventore veritatis.', '2023-10-28 08:02:26', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(69, 69, 'https://via.placeholder.com/640x480.png/00ee22?text=velit', 'Non maxime iste nostrum explicabo quia minus ducimus.', 'repellat-hic-nihil', 'Nobis quam excepturi odio vitae. Corporis necessitatibus a et quis minus. Nam officiis laborum libero a provident. In autem esse dolor. Quia consequatur dolore molestiae sit iusto molestias dolor temporibus. Dolore et eos magni at error quaerat architecto. Aliquid voluptatum vitae provident et sit iste praesentium sequi. Adipisci ut quos dolore perferendis reiciendis. Mollitia consequuntur adipisci ut dolore rerum nihil ut cum. Et velit voluptas consequatur veritatis architecto tenetur quae. Et omnis eligendi quos eos itaque. Est et asperiores architecto et.', '2023-11-03 20:16:05', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(70, 70, 'https://via.placeholder.com/640x480.png/008899?text=qui', 'Ut ut veritatis aut dolorum eos et.', 'et-dolorem', 'Quis natus ad numquam eaque commodi est eius. Reprehenderit maiores fugit est rerum minima inventore. Consequuntur eveniet aliquam et reiciendis sit sit quis. Ullam ut aspernatur libero et est quaerat et. Et aut suscipit non et corrupti impedit animi. Facere dolorum velit sed consequatur. Reiciendis similique aut nihil. Laborum necessitatibus expedita quis.', '2023-10-28 21:38:36', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33');
INSERT INTO `posts` (`id`, `user_id`, `image`, `title`, `slug`, `body`, `published_at`, `featured`, `deleted_at`, `created_at`, `updated_at`) VALUES
(71, 71, 'https://via.placeholder.com/640x480.png/0088ee?text=laboriosam', 'Adipisci quos sint eos est consequatur.', 'voluptatem-porro-similique-et', 'Dolore sed itaque odit deleniti repudiandae repudiandae. Odit quos nostrum autem voluptas repudiandae. Vero dignissimos libero iure maiores natus expedita. Voluptas fugit perferendis rem. Nihil illo distinctio impedit rerum ad nobis. Fuga quaerat exercitationem magni nam molestias. Et quo explicabo fugiat voluptas libero mollitia atque. Et sint deserunt velit impedit aperiam. Occaecati aspernatur molestias doloribus repellendus totam placeat ipsa. Est dolorem temporibus doloremque quis ex quibusdam. Ea id est exercitationem repellendus placeat. Necessitatibus veritatis magnam ipsam aut aut.', '2023-10-29 20:50:14', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(72, 72, 'https://via.placeholder.com/640x480.png/0077ff?text=odio', 'Debitis quo iste reiciendis voluptas.', 'quia-ea-illo-fugiat', 'Occaecati mollitia libero est sed et at molestiae. Iusto facere fuga iusto expedita. Eum placeat omnis veniam suscipit. Cupiditate atque atque inventore optio laborum similique enim. Et voluptas veniam eum fugit fuga impedit. Commodi nobis totam consequatur libero quisquam non vel quam. Minima dolor eum sequi dolorum ut soluta. Nihil impedit at molestiae culpa sit molestiae. Ut dolore quae sit adipisci quasi earum est. Aut nobis autem dolor cumque cum eos aspernatur. Rerum enim quo cupiditate velit.', '2023-10-27 20:24:54', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(73, 73, 'https://via.placeholder.com/640x480.png/004466?text=dolore', 'Aut sit vitae numquam aliquam dicta aut veniam.', 'maxime-voluptatem-quis', 'Labore quae optio et rerum esse qui. Nisi maxime magnam eveniet qui magni soluta. Et eveniet et et error non dolores. Ad optio ex dolor quia. Consequatur eveniet eos molestiae dolorem soluta excepturi corrupti. Aut aut laboriosam ipsam natus ut. Quis aut quasi labore nesciunt sunt. Voluptatum aut nemo omnis et reiciendis voluptates recusandae asperiores. Autem similique non a non. Dolores cumque error impedit veritatis. Quae veritatis saepe expedita rem et quis laboriosam.', '2023-11-07 19:46:49', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(74, 74, 'https://via.placeholder.com/640x480.png/0033bb?text=omnis', 'In id esse sed cumque voluptas sed.', 'autem-qui-ut', 'Voluptatem aut velit iste consequatur. Fuga delectus nemo qui ab. Velit amet ut autem cupiditate nihil asperiores qui. Vitae quia magni unde iste molestiae et. Tenetur velit dolorum veritatis corrupti placeat explicabo. Temporibus dolore consectetur exercitationem. Quisquam quos quo ea omnis consectetur porro.', '2023-11-05 14:16:41', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(75, 75, 'https://via.placeholder.com/640x480.png/00ccff?text=ex', 'Qui accusantium quae quidem et ex.', 'quia-omnis-dolores-eos', 'Maxime repudiandae et est alias corrupti quas. Eligendi amet ut debitis et illum distinctio. Eos ipsum voluptatem corrupti nam. Excepturi rerum aliquam possimus in omnis ea ex. Quas illo deserunt qui laudantium quam fugiat adipisci. Eligendi distinctio voluptas facere nulla rerum aut. Dolorem velit fugit et aspernatur. Quibusdam delectus rerum aliquam aut harum. Quos nihil officia quod deleniti in blanditiis esse. Voluptate expedita aspernatur aut cum aut et dolore.', '2023-10-31 05:20:04', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(76, 76, 'https://via.placeholder.com/640x480.png/00dd55?text=laudantium', 'Eveniet voluptate ut laudantium possimus ut provident quo.', 'sed-odit-doloribus-corrupti', 'Aliquam vel velit et quos. Exercitationem veritatis cumque vel beatae commodi. Iusto ut aspernatur iure aperiam possimus. Commodi optio at ullam nulla. Omnis est commodi dignissimos omnis. Amet fugiat delectus necessitatibus aut provident asperiores dolorem. Nobis eum soluta ut fugit nesciunt vitae et velit. Molestias delectus atque dolores praesentium. Aut quidem facere sed at nostrum. Et modi et velit sed a voluptatem velit. Unde eos earum quaerat nostrum odit nulla consectetur. Quo sit inventore voluptatibus in explicabo. Ut velit et eum debitis voluptas debitis.', '2023-10-30 16:53:11', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(77, 77, 'https://via.placeholder.com/640x480.png/00eedd?text=molestiae', 'Et rerum quae sed.', 'laudantium-eum-exercitationem', 'Natus nihil est sapiente reprehenderit a. Accusamus in quis tempore ut dolorem voluptate. Et necessitatibus eum quia ut. Sunt quo et fugit provident. Perferendis fuga dicta voluptas. Cum fugiat perspiciatis eum accusantium. Corporis inventore in est est est. Autem et ut iste autem. Laudantium suscipit adipisci cum aut temporibus non accusantium. Laudantium voluptas possimus laudantium nulla. Repellat quibusdam nam enim consectetur placeat architecto maxime. Ut et quos occaecati qui. Quibusdam sit tempora qui enim. Magni aut eaque quo voluptatem consequatur in.', '2023-11-01 04:41:59', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(78, 78, 'https://via.placeholder.com/640x480.png/00bbaa?text=sit', 'Quisquam ut odio numquam molestias hic provident.', 'non-aliquid-tempora-quam', 'Et amet sint enim nam assumenda unde. Et vero autem ullam ea quia aut ut. Aut possimus reprehenderit dicta quibusdam. Ut at atque ullam omnis et beatae. Cupiditate rerum architecto ut maxime est omnis veniam. Ex laudantium natus sit voluptas sed voluptatem in vero. Ab ut qui cumque molestiae voluptatem. Est dolores minima aliquam nisi sunt.', '2023-10-31 13:58:18', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(79, 79, 'https://via.placeholder.com/640x480.png/00ee22?text=voluptatem', 'Voluptates aut at quidem est adipisci ab.', 'commodi-atque-id', 'Voluptatem ea nemo fugit in et eaque praesentium. Delectus corporis et ducimus voluptatem quia eum harum. Laboriosam harum rerum corporis at sunt. Velit repellendus nobis ab consequuntur cumque. Quod ratione consequatur reiciendis non est eius. Ratione magnam ducimus sit aut quo ut. Fuga adipisci nihil quam qui non quam. Inventore praesentium accusantium autem. Officiis non rerum veniam ut et nisi in. Quas quos iusto cum esse. Iste porro porro consectetur aliquid vero vero magni. Quaerat maxime explicabo est et qui quia perspiciatis. Dolores autem hic possimus facere rerum repellat. Facilis quia facilis dicta corrupti quibusdam reiciendis dolor.', '2023-11-06 18:37:19', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(80, 80, 'https://via.placeholder.com/640x480.png/0099dd?text=et', 'Voluptatem quisquam aut aspernatur quasi ipsum rem.', 'esse-voluptatem-quas-qui', 'Eos qui molestiae molestiae. Aliquid inventore aspernatur nesciunt corrupti sunt voluptates. Molestiae rerum et consequatur omnis molestias. Consequuntur id consequatur soluta quis sint. Ducimus quae est cupiditate repudiandae. Voluptatem qui dolor nisi qui corrupti. Quia eligendi perferendis illo repudiandae.', '2023-11-07 01:20:24', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(81, 81, 'https://via.placeholder.com/640x480.png/00ffdd?text=in', 'Cum voluptatibus ut omnis dicta expedita modi ullam.', 'dolor-omnis', 'Enim nulla voluptatem est eius voluptas ut. Inventore explicabo enim asperiores quis blanditiis nihil. Tempore possimus quibusdam id molestiae est voluptate. Et suscipit doloremque fuga consequatur. Error repudiandae suscipit aperiam vero nostrum placeat aut. Aut modi quo est molestiae. Rerum non pariatur in adipisci voluptatem nemo sapiente nesciunt. Accusamus rem debitis expedita. Consequatur similique et nihil esse placeat. Voluptatem accusamus minima in sunt autem et. Fugiat qui amet sed ea id officiis. Ipsa sunt aut soluta impedit ut qui recusandae fugit. Ea excepturi omnis eos sint. Laborum dolorem minus aut.', '2023-10-27 01:38:25', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(82, 82, 'https://via.placeholder.com/640x480.png/0022bb?text=ipsa', 'Rem aliquid eius vero repudiandae maiores dolor aut.', 'mollitia-rerum-libero-qui-facere', 'Velit et eveniet dicta maiores cupiditate. Reiciendis perspiciatis veritatis ipsam reiciendis atque voluptates. Neque ut ut aspernatur est corrupti qui. Sint placeat ex totam quo ut repellat consequatur rerum. Architecto fuga numquam officiis. Ducimus ex qui dicta et et expedita eaque. Amet molestiae voluptates nobis iure perspiciatis blanditiis natus. Ratione soluta dolorum et. Libero magnam cupiditate nostrum temporibus ut tenetur laudantium. Fugiat voluptate eum odit debitis eligendi quos. Excepturi corporis maiores ea. Velit officiis ut saepe sint est nostrum. Qui quaerat assumenda quod sunt mollitia. Aut autem ut doloribus atque quo.', '2023-11-02 23:14:19', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(83, 83, 'https://via.placeholder.com/640x480.png/0055ff?text=ipsam', 'Aperiam aut et debitis id in eos.', 'voluptatem-ut-consequatur-expedita-suscipit', 'Aspernatur sed ad veniam. Deserunt incidunt dolorem et. Nihil quia dolorum placeat hic. Molestiae in architecto dolore. Natus vel et ut rerum et error necessitatibus. Placeat distinctio quibusdam aut quaerat voluptatem molestiae odit. Nihil est quod qui quis numquam laborum exercitationem. Aut cum assumenda et. Aut voluptas enim corporis. Sint totam autem consequatur mollitia deleniti et. Rerum cum cupiditate expedita et beatae dolorem. Doloremque blanditiis consequuntur facere mollitia ab illo voluptatibus enim. Dolores nisi rerum nesciunt sint esse sapiente. Ea aut dolorem at et in consequatur. Vel nisi aut ut est impedit vel ut.', '2023-10-29 18:18:21', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(84, 84, 'https://via.placeholder.com/640x480.png/005522?text=architecto', 'Hic quia et sit et in eligendi.', 'eos-perferendis-consectetur-iste', 'Explicabo voluptatum ratione deleniti hic dolore animi. Sed aliquam dolore non doloremque numquam odio. Porro dolorem reiciendis voluptates. Rerum sed itaque cum sunt at. Et cumque enim illo atque culpa. Aliquam sint sunt facilis et sequi provident magnam consequatur. Magni eum reprehenderit numquam voluptatum eaque quae nesciunt.', '2023-10-27 05:25:19', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(85, 85, 'https://via.placeholder.com/640x480.png/008833?text=sit', 'Aperiam et sed rerum.', 'autem-doloribus-dignissimos', 'Quas maiores velit enim totam. Est ipsam ipsam odit earum natus et. Et odit iste omnis voluptatem. Impedit et itaque odio quo animi. Fuga sunt reprehenderit est. Sint aut doloribus laudantium. Unde sunt quidem illo possimus non delectus perferendis. Modi eligendi similique tempora eum dolor necessitatibus qui. In distinctio earum dolorum et molestias quas. Perferendis autem adipisci eligendi aut. Aspernatur earum laboriosam ut inventore. Voluptatem accusamus ea doloremque neque aut.', '2023-10-29 05:56:23', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(86, 86, 'https://via.placeholder.com/640x480.png/0088dd?text=quisquam', 'Praesentium id ipsa occaecati et animi beatae similique.', 'quidem-et-sunt', 'Saepe et saepe dolor inventore. Fuga saepe sapiente tenetur odit molestiae rerum rem neque. Et molestiae sint blanditiis error iusto necessitatibus. Dignissimos id quia fuga. Qui nulla nemo fugit autem iure sint. Libero natus rerum nesciunt recusandae laborum maiores. Mollitia at esse doloribus magni eos eius. Praesentium recusandae cumque aliquid voluptates iusto. Eveniet nostrum molestiae nesciunt voluptas est perspiciatis. Molestiae consequatur magnam eos.', '2023-10-27 04:34:52', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(87, 87, 'https://via.placeholder.com/640x480.png/008855?text=nam', 'Odit excepturi sunt fugit ipsum.', 'ratione-a-enim', 'Unde molestias ea et tempora. Quia id ipsam sunt odio. Optio excepturi tempora quis esse velit inventore. Ipsam repellat rerum ut ratione. Perspiciatis adipisci rerum quis hic. Soluta sit unde magni et qui voluptas cupiditate. Eos expedita sequi ullam quas. Perspiciatis molestiae atque laborum nostrum eius non magnam debitis. Aspernatur quia omnis quia provident velit quia. Explicabo temporibus aut minima tenetur quam. Voluptatem molestias est voluptatem ipsa doloremque est.', '2023-10-27 14:22:54', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(88, 88, 'https://via.placeholder.com/640x480.png/004444?text=eum', 'Unde occaecati in facere rerum at quo voluptatem impedit.', 'fugiat-atque-voluptates', 'Mollitia quo est nesciunt quia. Tempora totam tenetur voluptatibus nam necessitatibus aut eum. Id molestias iure omnis rerum magnam amet. Voluptatem laboriosam esse necessitatibus. Doloremque nobis et corporis libero nobis tempore. Vel voluptatem est aliquam et. Fugiat in molestiae cum quidem temporibus. Ullam omnis omnis voluptates consequatur ipsam minima.', '2023-11-05 16:43:10', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(89, 89, 'https://via.placeholder.com/640x480.png/006677?text=id', 'Eos et exercitationem autem aut.', 'sed-autem-reprehenderit-blanditiis', 'Accusamus dolorem ullam recusandae et et. Et veniam officia qui vel. Cumque amet atque assumenda et. Repudiandae ipsum vel neque mollitia magni sunt quo. Corporis quo et maiores in inventore. Voluptas ut provident doloremque rerum. Repellendus odit facilis deleniti dolores veritatis quaerat amet.', '2023-10-30 11:01:15', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(90, 90, 'https://via.placeholder.com/640x480.png/00ff55?text=nemo', 'Harum harum harum suscipit delectus.', 'eos-est-non-qui', 'Voluptate incidunt voluptatem exercitationem est. Ut consequatur accusantium consequuntur enim non qui. Nulla nemo ea fugit laboriosam quae. Ut expedita totam mollitia. Aut ut et nesciunt quas. Fugit ex consequatur fuga praesentium ad aliquid consequatur. Aut quo vero dicta dolor quia eligendi quisquam deserunt.', '2023-10-27 06:27:14', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(91, 91, 'https://via.placeholder.com/640x480.png/0011dd?text=asperiores', 'Non necessitatibus quis blanditiis consequatur.', 'ab-et-veritatis', 'Aut ut et asperiores. Possimus atque aliquid beatae rerum assumenda earum aliquid. Necessitatibus consequatur dolor ut id esse adipisci natus. Ad vero atque nobis dolor quis. Repellat vel corrupti rem est adipisci exercitationem cumque. Voluptatem architecto est labore. Et ipsam optio quo similique. Fugiat quo consequatur unde exercitationem et eum cum.', '2023-11-04 18:16:32', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(92, 92, 'https://via.placeholder.com/640x480.png/008844?text=aliquam', 'Facilis quibusdam nihil ea non.', 'sunt-quibusdam-sunt', 'Animi dicta accusamus aspernatur autem. Inventore dolor officiis et. Vero impedit in expedita laboriosam incidunt ut. Et ea fugit repellendus quia et similique. Omnis reprehenderit dolor ratione ratione sit. Quaerat velit libero at deleniti ad a maiores porro. Rerum fuga omnis eum dolorem delectus magni quos. Recusandae ut doloremque temporibus. Delectus adipisci voluptatibus molestiae tenetur est.', '2023-11-01 17:11:53', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(93, 93, 'https://via.placeholder.com/640x480.png/00ccdd?text=a', 'Recusandae et voluptatem dicta.', 'corrupti-debitis-sunt', 'In quis minus soluta corporis aut temporibus eius. Nulla maiores voluptas animi vero. Velit qui laudantium est sit distinctio voluptas enim. Sit officia deserunt vero minima vero molestias earum. Quo exercitationem esse et voluptates id. Est architecto cupiditate consequatur. Quibusdam nesciunt totam modi fuga ipsa vero dolore. Odit eum debitis fugiat eum. Eum qui eaque veritatis cupiditate ad. Consequatur voluptates voluptatem aut veritatis odit quasi.', '2023-10-27 13:30:24', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(94, 94, 'https://via.placeholder.com/640x480.png/00cc22?text=accusantium', 'Architecto mollitia consectetur accusamus deserunt sed eaque voluptatem.', 'aut-aut-aliquid-vitae', 'Harum consequatur aut ullam explicabo. Error laboriosam odit odio et. Est hic unde aspernatur doloribus voluptas dolor. Eligendi dolores consequatur et sunt eos occaecati quas. Aut et culpa porro omnis blanditiis sunt doloremque. Et iste consectetur ipsum quos officiis. Sit consectetur unde quia vel facilis voluptas. Ratione sed facere molestias quia facere corrupti eaque. Magni autem non consequatur distinctio possimus itaque provident sunt. Illo totam dolore corrupti est ut praesentium veniam. Quo in in recusandae modi quo. Tenetur natus ut est id ut quam tempore voluptatem.', '2023-10-26 23:27:57', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(95, 95, 'https://via.placeholder.com/640x480.png/005599?text=possimus', 'Corrupti quo temporibus vel labore et perferendis.', 'deleniti-voluptatibus-incidunt', 'Assumenda officia nihil aliquid quo praesentium nihil. Voluptas occaecati qui ullam quia. Nam qui debitis voluptate vitae. Quae consequatur id natus. Est sunt in alias omnis quia architecto. Neque sint iusto provident vitae. Ea doloremque unde dolores a.', '2023-11-03 19:04:54', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(96, 96, 'https://via.placeholder.com/640x480.png/008877?text=autem', 'Cum soluta dolor necessitatibus veritatis ut aut consequatur.', 'quod-magni-vel', 'Provident expedita maiores sit qui voluptas. Excepturi et omnis aperiam aut beatae aliquam ex. Velit qui hic voluptatem sed. Ex quis est iusto. Dolore earum dignissimos at ad ea. Dolor praesentium perspiciatis minima ut. Ea omnis et in dolor. Aspernatur laudantium sed nam fugit aut non atque accusantium. Perferendis voluptatum quidem ipsum sunt optio. Numquam ipsum nesciunt ut aliquid eum magnam.', '2023-10-30 18:35:15', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(97, 97, 'https://via.placeholder.com/640x480.png/0099ee?text=et', 'Autem excepturi eos harum officiis perspiciatis.', 'illum-debitis-sint-tempora', 'Cupiditate corporis nihil dolorum quidem dignissimos in. At temporibus culpa non quisquam nobis amet omnis. Aut natus sunt asperiores quo quaerat ex est. Dicta est voluptatem voluptas. Optio incidunt possimus esse eligendi suscipit. Et ut maiores quam itaque. Laboriosam similique eum sint qui. Tempora eum et porro earum. Officia quia voluptas iste error voluptas. Accusantium consectetur labore est ad nulla consequatur culpa. Molestiae rerum dolorum optio laborum reprehenderit.', '2023-11-07 00:36:10', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(98, 98, 'https://via.placeholder.com/640x480.png/00eedd?text=accusantium', 'Nesciunt minima saepe ducimus et repudiandae et hic.', 'nisi-consectetur-illo', 'Repellendus distinctio illo fugit maiores esse consequatur reprehenderit. Praesentium ut deleniti ipsam harum. Repudiandae sunt repellendus ea dolor voluptatem a. Alias vitae quis veritatis aut. Doloremque ea voluptas debitis rerum voluptatem earum vel saepe. Dolor sint aut similique quo ratione aut consequatur. Aut saepe commodi aspernatur asperiores. Corrupti aliquid illum voluptatem ea. Aperiam voluptate itaque cupiditate veritatis. Quo saepe doloribus nulla cupiditate omnis libero. Amet nesciunt aut et numquam rerum. Ex cumque enim cumque saepe impedit sed.', '2023-10-27 07:30:07', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(99, 99, 'https://via.placeholder.com/640x480.png/00bb55?text=veritatis', 'Est similique inventore iste.', 'possimus-qui-accusamus', 'Minus debitis et sequi consequatur labore cumque. Ut placeat dolor est beatae sit accusamus adipisci. Porro sequi voluptatibus possimus et est voluptatem veritatis. Cumque est quia nihil dolorem. Quia aperiam ut nihil esse libero qui. Placeat et ut laboriosam aliquam sunt aut officiis. Ea dolorum labore cum est exercitationem suscipit. Sapiente vitae iure doloribus. Qui rerum ut perspiciatis voluptatem facilis corrupti sit. Et exercitationem officiis nulla odit quidem dignissimos. Pariatur modi sapiente earum odio quo. At sed voluptatem molestiae. Autem sit amet omnis quia aliquid quo saepe. Nobis sed aperiam aliquid animi.', '2023-11-01 10:43:14', 1, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(100, 100, 'https://via.placeholder.com/640x480.png/00ff44?text=delectus', 'Ea harum id voluptatem aut.', 'vero-eos-quasi', 'Non tempore rem voluptas a expedita. Minus enim cupiditate ex et. Omnis harum non fugiat ea repudiandae. Ut et ducimus error cupiditate ratione est omnis. Et nostrum enim fugit voluptas voluptate ut laudantium. Exercitationem repudiandae deserunt maxime quod. Cum qui aspernatur esse nihil hic ea doloremque. Odio et quos quisquam repellendus quia sit qui.', '2023-10-30 17:43:21', 0, NULL, '2023-11-02 08:11:33', '2023-11-02 08:11:33'),
(101, 9, 'posts/thumbnails/mLeEtJNQOqz1TVXetHyNgoFXsw27a5-metaVW50aXRsZWQucG5n-.png', 'This is Website Laravel', 'keybord-to-now', '<p>Awal narasi biasanya berisi pengantar yaitu memperkenalkan suasana dan tokoh. Bagian awal harus dibuat menarik agar dapat mengikat pembaca. Bagian tengah merupakan bagian yang memunculkan suatu konflik. <a href=\"https://id.wikipedia.org/wiki/Konflik\">Konflik</a> lalu diarahkan menuju klimaks cerita. Setelah konfik timbul dan mencapai klimaks, secara berangsur-angsur cerita akan mereda.</p><p><br></p>', '2023-11-30 15:18:18', 1, NULL, '2023-11-30 08:19:07', '2023-12-14 07:44:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_like`
--

CREATE TABLE `post_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `post_like`
--

INSERT INTO `post_like` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(11, 101, 1, '2023-11-29 18:02:29', '2023-11-29 18:02:29'),
(12, 101, 2, '2023-11-29 18:02:32', '2023-11-29 18:02:32'),
(26, 101, 58, '2023-11-29 18:33:22', '2023-11-29 18:33:22'),
(29, 102, 101, '2023-12-14 08:03:53', '2023-12-14 08:03:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rdSNjn9SyEARzhhlUKLbqaF2ntSMdCVGzIDuMOuh', 102, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRGxMbGlsaTJSYWV0SmRIdm1PZWhEUUJuMXcxRUNXY05GNUlGclpVeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly96aWRhbi1ibG9nLnRlc3Q6ODA4MC9hZG1pbi9wb3N0cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwMjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFpWQm81a0Mway9LMUl2aFNac0VKMU9TQzBoOW40UlRCRUoxblMzTWdCdnl0YWk1eEl1aEl5IjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1702566350);

-- --------------------------------------------------------

--
-- Struktur dari tabel `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`slug`)),
  `type` varchar(255) DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Verla Goodwin PhD', 'eric01@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'eddVS9cbJu', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(2, 'Amara Hessel', 'thomas.johnson@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Jbp0N4PUOR', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(3, 'Tina Lubowitz', 'barrows.jayda@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'c3AqEvdq9S', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(4, 'Myah Mitchell', 'darrick.balistreri@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'su5c9D5Il7', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(5, 'Ms. Susan Sauer', 'reese94@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NHllAdt7Mo', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(6, 'Milo Bosco II', 'michel91@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'L3otqfM0vB', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(7, 'Elisha Beer', 'rschimmel@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'kURoe3UO5W', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(8, 'Makenna Koepp', 'rachel.bogisich@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XnS1IyGeH4', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(9, 'Arnoldo Gutkowski', 'estelle34@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'MZeWj2uJRK', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(10, 'Mrs. Katelin McKenzie', 'gianni96@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'jC8VbAArgJ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(11, 'Dr. Alexie Hudson', 'kirstin.ledner@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'kSowM0uHKl', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(12, 'Miss Lurline Crona', 'zkoelpin@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'tlHA6qsx57', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(13, 'Lera Dibbert', 'shaina.muller@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2e30xo26Td', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(14, 'Prof. Tatyana Koelpin IV', 'nstracke@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IoC1l8QhZB', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(15, 'Isaac Emmerich', 'miller.oreilly@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Fhy7DUYtDa', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(16, 'Zoe Mills', 'pbrown@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'pb2sT1f9Sl', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(17, 'Gerda Bosco', 'seichmann@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'PcVFHvFoqC', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(18, 'Nathanael Pouros', 'margot.ledner@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'lpgDAXUhe7', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(19, 'Jamey Macejkovic', 'crona.emory@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'yirI4FMHiw', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(20, 'Effie Ward', 'tromp.marion@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Ggl2wwzdoZ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(21, 'Nelson Ankunding', 'pfarrell@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'LATZ1Kig1Q', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(22, 'Tevin Gorczany', 'graham.keanu@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'aVTLfKwqfC', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(23, 'Carroll Farrell', 'tyrell.keeling@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'La8RgWGQjl', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(24, 'Miss Josefa Boyer', 'rankunding@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'eHMb8imvLT', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(25, 'Randy Torphy', 'xaufderhar@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '9Sb9gDxRZs', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(26, 'Vincent Daugherty', 'mertz.mayra@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ho2rijpijC', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(27, 'Jenifer Feil', 'queenie.bauch@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '8JkImuwFSe', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(28, 'Crystal Lockman', 'kjerde@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'uMh1fxcxiG', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(29, 'Mozell Nitzsche MD', 'jakubowski.jaleel@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'iKNQiA4Rx6', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(30, 'Stacy Jones', 'paucek.ivah@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mQ6s6bNu33', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(31, 'Obie O\'Hara', 'wluettgen@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'EQYBfaShHP', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(32, 'Jace Rosenbaum IV', 'darwin51@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'AYfSLyCqWG', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(33, 'Dr. Colby Nitzsche DVM', 'mkuhn@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'qftVXXD3YA', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(34, 'Chelsey Wisozk DDS', 'grimes.eduardo@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'x5jxhhr6xD', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(35, 'Prof. Robbie Abshire MD', 'gokeefe@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'MgEQKN0cn4', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(36, 'Cordelia Reilly', 'lemke.emma@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Q6xfcM133s', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(37, 'Celestine Krajcik', 'creola.denesik@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'uvT3XyN2Pz', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(38, 'Tillman Shanahan', 'eileen.mayer@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XdYEeWzKrW', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(39, 'Emmett Bruen', 'muller.zack@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'FqJPwaMnuN', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(40, 'Elda Dach', 'marta45@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '85aIfzyjaz', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(41, 'Evie Wiza DDS', 'guillermo35@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'o4xhduJU4a', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(42, 'Mr. Donavon Bechtelar DVM', 'gfarrell@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'cgeG1LgFyT', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(43, 'Winston Renner', 'angus28@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '3UBxk8R197', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(44, 'Gerhard Funk', 'elijah.brakus@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'hYVT9KRA93', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(45, 'Franco Williamson', 'cletus34@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ViiZAGAj2g', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(46, 'Darrin Grimes', 'mario.greenholt@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'axRteIRCC6', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(47, 'Natalie Kuhn', 'joanny.morar@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '5u278dpGjQ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(48, 'Henriette Legros', 'fkihn@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'GnghZutJtw', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(49, 'Mr. Elvis Hayes II', 'hbeahan@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZEJxxkaA7p', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(50, 'Melba McClure', 'maybell14@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2qjqnSAD7F', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(51, 'Destin Jacobi', 'melvina.stanton@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XsOI7Giajc', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(52, 'Dr. Vivian Abshire', 'osbaldo77@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ivsWl2yBoZ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(53, 'Mckenna D\'Amore', 'keegan.schulist@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mEPBUdkVcc', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(54, 'Mr. Roderick Hilpert', 'ukshlerin@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'xzHoLcPsrG', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(55, 'Mr. Mckenna Dibbert I', 'reva.renner@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'LExqw1cTHd', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(56, 'Demarco Wyman', 'titus32@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bt4GCHlreH', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(57, 'Kellen Ferry', 'odibbert@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mW1KQE9Kyu', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(58, 'Prof. Cecile Schiller', 'xleffler@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'PICfwzdIpk', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(59, 'Elna Gleichner III', 'william38@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '7gNFlFSJMT', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(60, 'Giovanna McGlynn III', 'linda03@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'PYTawOuoaY', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(61, 'Dr. Easton Carter', 'heller.zackery@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'H50o0hAzIR', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(62, 'Caterina Weissnat DVM', 'gutmann.alexa@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XeGgqTNGq7', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(63, 'Alexandrea Wiza Jr.', 'armani51@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'QXPFzOYv0H', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(64, 'Jevon Macejkovic DDS', 'stiedemann.jorge@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mBGwxeYpDf', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(65, 'Kurt Towne IV', 'garth.brakus@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'K8eV8ZRTYS', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(66, 'Darian Casper', 'arne.willms@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'uS0NMwmSz8', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(67, 'Ozella Schaefer', 'francesca42@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NfUPLP2oX1', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(68, 'Miss Amaya Bayer V', 'ghickle@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IaGmR8pDd9', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(69, 'Dr. Robb Halvorson I', 'spinka.yasmine@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'e8NiX4uire', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(70, 'Miss Delpha Johnson', 'schuster.irwin@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'OWVh1RDlBV', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(71, 'Avis Cruickshank MD', 'kira.harvey@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'MJow4LNT76', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(72, 'Trevion Graham', 'dimitri15@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'JaXZjH3v7k', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(73, 'Braeden Kreiger', 'ortiz.rachelle@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Mgu0Zgn3cf', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(74, 'Keely DuBuque', 'bmante@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'UFhN4nAdGb', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(75, 'Dr. Olen Okuneva', 'petra.stoltenberg@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2SyGlgLExC', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(76, 'Abel McLaughlin', 'karson50@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'UZSAiSTUaD', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(77, 'Lindsay Abbott PhD', 'edibbert@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '5XhokvuYb5', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(78, 'Dr. Zechariah Murray DDS', 'satterfield.fabian@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'qCKKNUv8TH', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(79, 'Ansel Schmeler', 'crystel.kassulke@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '7d7tdlYKnt', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(80, 'Federico Cremin II', 'uaufderhar@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'nvP8OLrgoZ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(81, 'Hardy Kiehn', 'ywindler@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '6GeElWZkq2', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(82, 'Tristian Boyer', 'nolan.cletus@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IuzdIlprep', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(83, 'Kathleen Sipes', 'sienna.welch@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'kzK7u8fFV5', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(84, 'Erik Braun', 'koss.reymundo@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '5BryyiKtYq', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(85, 'Prof. Syble Bartell PhD', 'chudson@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'OgVm8wmU7j', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(86, 'George Green', 'neva86@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 't1QSaY0TV9', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(87, 'Delmer Kovacek', 'brady14@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'x3g7IzjG6t', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(88, 'Mrs. Earline Rempel', 'kuphal.margarete@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'wV3iFnGSQ2', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(89, 'Joyce Jenkins', 'alvena99@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'jh6ZMPZc9R', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(90, 'Dr. Kevon Gleichner', 'marshall.reichert@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '7eZh74a4OB', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(91, 'Jazlyn Raynor', 'herzog.halle@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Pq3gmhaJl2', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(92, 'Unique Volkman', 'magnolia.borer@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'OUsCJQFz4o', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(93, 'Kiley Dietrich', 'bjones@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rIOwTmcXcq', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(94, 'Andre Veum', 'runolfsdottir.erna@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ssqqyaYZvJ', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(95, 'Annette Prohaska', 'xschmeler@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'vxmhhqBjeS', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(96, 'Rachelle Dibbert PhD', 'okoelpin@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'wrNpon2F6F', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(97, 'Mrs. Alexandrine Lindgren Jr.', 'jcummings@example.net', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'iWBP8uxyHp', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(98, 'Miss Lavinia Thiel V', 'rutherford.gust@example.com', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '0juqLlVIbN', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(99, 'Mrs. Brigitte Rogahn', 'johns.laverne@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'DKGiig9YBy', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(100, 'Prof. Tomasa Larkin', 'lmonahan@example.org', '2023-11-02 08:11:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'oNUrlm0WAW', NULL, NULL, '2023-11-02 08:11:32', '2023-11-02 08:11:32'),
(101, 'Zidan', 'zidan@gmail.com', NULL, '$2y$10$45fwfFIODijZrihEoEewVeSKYx/Q.17vZjJo6tr8xdLfW5IRTyKaC', NULL, NULL, NULL, '0GA3s4xRJR6atjMV5XqCUUgpdcEtygdayMGP7IovfAKFI7MIuBQ58TggMQoI', NULL, 'profile-photos/kywYcittUkAudO7vs4CtDEcL8y8GvRvPHoG8R5p3.jpg', '2023-11-02 08:22:29', '2023-11-02 08:37:14'),
(102, 'Muhammad Zidani', 'sekolah@gmail.com', NULL, '$2y$10$ZVBo5kC0k/K1IvhSZsEJ1OSC0h9n4RTBEJ1nS3MgBvytai5xIuhIy', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 08:01:37', '2023-12-14 08:01:37');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_authors_email_unique` (`email`);

--
-- Indeks untuk tabel `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  ADD KEY `blog_posts_blog_author_id_foreign` (`blog_author_id`),
  ADD KEY `blog_posts_blog_category_id_foreign` (`blog_category_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeks untuk tabel `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_like_user_id_index` (`user_id`),
  ADD KEY `post_like_post_id_index` (`post_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `taggables`
--
ALTER TABLE `taggables`
  ADD UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  ADD KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blog_authors`
--
ALTER TABLE `blog_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT untuk tabel `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_blog_author_id_foreign` FOREIGN KEY (`blog_author_id`) REFERENCES `blog_authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_posts_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
