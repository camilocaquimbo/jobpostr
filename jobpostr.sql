-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-07-2019 a las 21:08:13
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jobpostr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(3, '1563468058085_test_0_schema', 1, '2019-07-18 18:17:43'),
(4, '1503248427885_user', 2, '2019-07-18 18:21:32'),
(5, '1503248427886_token', 2, '2019-07-18 18:21:35'),
(6, '1563473987210_job_schema', 2, '2019-07-18 18:21:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `link`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'My job title', 'http://google.com', 'My job description', 3, '2019-07-18 13:48:54', '2019-07-18 13:48:54'),
(2, 'My job title', 'http://google.com', 'My job description', 1, '2019-07-18 13:49:00', '2019-07-18 13:49:00'),
(3, 'My job title', 'http://google.com', 'My job description', NULL, '2019-07-18 13:49:02', '2019-07-18 13:49:02'),
(4, 'My job title', 'http://google.com', 'My job description', 3, '2019-07-18 13:50:53', '2019-07-18 13:50:53'),
(5, 'Trabajo Modificado', 'http://google.com', 'My job description', 1, '2019-07-18 13:50:54', '2019-07-18 13:50:54'),
(6, 'My job title', 'http://google.com', 'My job description', NULL, '2019-07-18 13:53:51', '2019-07-18 13:53:51'),
(7, 'My job title', 'http://google.com', 'My job description', NULL, '2019-07-18 13:54:51', '2019-07-18 13:54:51'),
(8, 'My job title', 'http://google.com', 'My job description', NULL, '2019-07-18 13:54:55', '2019-07-18 13:54:55'),
(9, 'My job title', 'http://google.com', 'My job description', NULL, '2019-07-18 13:54:55', '2019-07-18 13:54:55'),
(10, 'Eng. ', 'klj', NULL, 1, '2019-07-19 09:59:29', '2019-07-19 09:59:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test_0_s`
--

CREATE TABLE `test_0_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'ingcamiloc1', 'ingcamiloc1@gmail.com', '$2a$10$Yt0bBBAJK34swOOM2qsCL.tsbv5OUzut4v4TMohL.VTznAZ5lzJ.2', '2019-07-18 14:57:50', '2019-07-18 14:57:50'),
(3, 'ingcamiloc222', 'ingcamiloc1@gmail22.com', '$2a$10$Yt0bBBAJK34swOOM2qsCL.tsbv5OUzut4v4TMohL.VTznAZ5lzJ.2', '2019-07-18 14:57:50', '2019-07-18 14:57:50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `test_0_s`
--
ALTER TABLE `test_0_s`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `test_0_s`
--
ALTER TABLE `test_0_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
