-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-06-20 03:20:09
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `login`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `favorite_song` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `URL` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `artists`
--

INSERT INTO `artists` (`id`, `name`, `genre`, `favorite_song`, `location`, `URL`) VALUES
(1, '柊人', 'ヒップホップ・ラップ', '今はまだ', 'Japan', 'https://youtu.be/7_2lI6Ng9n8?si=LT5xU39GMvYiAG-j'),
(2, 'Akon', 'R&B, ヒップホップ, ダンスホール', 'ロックト・アップ', 'USA', 'https://youtu.be/14PgWitIbSk?si=BnqJdTWwbVIufQxz'),
(3, 'Eminem', 'ハードコア・ヒップホップ, ホラーコア, ポップラップ', 'ウィザウト・ミー', 'USA', 'https://youtu.be/YVkUvmDQ3HY?si=vHhf8QizUYMh5acw'),
(4, 'Oasis', 'ブリットポップ, オルタナティブ・ロック', 'Don\'t Look Back In Anger', 'UK', 'https://youtu.be/cmpRLQZkTb8?si=v5qTTwkB9dX090uG'),
(5, 'Kendrick Lamar', 'ウェストコースト・ヒップホップ, ジャズラップ', 'luther', 'USA', 'https://youtu.be/HfWLgELllZs?si=jB0YmEIuETP2pY28'),
(6, 'Conan Gray', 'ポップ, インディー, ベッドルームポップ', 'Killing Me', 'USA', 'https://youtu.be/cQzJWnYVNoQ?si=vPuiDphz2uslrKeS'),
(7, 'Ziggy Marley', 'レゲエ', 'True to Myself', 'Jamaica', 'https://youtu.be/ikzQmC3S-mE?si=-WG0vbWbZTCUdrJt'),
(8, '唾奇', 'チル・ヒップホップ', '道', 'Japan', 'https://youtu.be/j2WHnLToaEw?si=wEHux9QKuoPlVg39'),
(9, 'Michael Jackson', 'ポップ, R&B, ファンク', 'Beat It', 'USA', 'https://youtu.be/oRdxUFDoQe0?si=e9qEWjcPzNhF18MK'),
(10, 'J-REXXX', 'ジャパニーズ・レゲエ, ダンスホール', '私の彼氏はREGGAE DEEJAY', 'Japan', 'https://youtu.be/D7D6Qd9cjhg?si=zBoFyw4ukbshb74P'),
(11, 'Youth of Roots', 'ルーツ・レゲエ', 'Jamaica', 'Japan', 'https://youtu.be/D7D6Qd9cjhg?si=nlS0OHnzumoimiy6'),
(12, '18scott', 'オルタナティブ・ヒップホップ', 'Cry Later', 'Japan', 'https://youtu.be/n8S0t3Lw3WQ?si=1snJcTZB0q21PCYV'),
(13, 'ジャパニーズマゲニーズ', 'ヒップホップ', '最後の一本', 'Japan', 'https://youtu.be/sWhO0tebpFQ?si=pU5Kw49b_nyb-EIV'),
(14, '般若', 'ヒップホップ', 'MOGURA', 'Japan', 'https://youtu.be/3o5eA0VtmdQ?si=s3opiPzpTX_D0x6u'),
(15, 'Motley Crue', 'ハードロック, グラムメタル', 'On with the Show', 'USA', 'https://youtu.be/JXVTax5JAZI?si=HXYy8dm6HF0O8iwu'),
(16, 'Lil Peep', 'エモラップ, オルタナティブロック', 'Yesterday', 'USA', 'https://youtu.be/qI0pJAGgbvo?si=HzcGLwD6hoq8vKVg'),
(17, 'A.SOUND', 'ダブ, レゲエ', 'Everything Good', 'Japan', 'https://youtu.be/YaUptSAUTWo?si=vQoOfzYZZZ0joOoF'),
(18, 'Bob Marley', 'ルーツレゲエ, ダブ', 'Three Little Birds', 'Jamaica', 'https://youtu.be/HNBCVM4KbUM?si=mNyo0GXReCh3H1eI'),
(19, 'Captain Noah', 'レゲエ', 'Bounce', 'Japan', 'https://youtu.be/cfva00LB8PQ?si=MOpNHMYjZd4kjb-7'),
(20, 'Chico Carlito', 'ヒップホップ', 'Let Go', 'Japan', 'https://youtu.be/etw8B3QHmBQ?si=OQAm4twG5fYfgF3F'),
(21, 'CHOUJI', 'ヒップホップ, メッセージラップ', 'バッズマン', 'Japan', 'https://youtu.be/1RkBad11IzA?si=J57BaiWRBaiG-D7x'),
(22, 'Miyauchi', 'ローファイ, 内省的ヒップホップ', '大丈夫', 'Japan', 'https://youtu.be/B7BiI8wDM8k?si=gXYFijT8nrEvRpwy'),
(23, 'MuKuRo', 'ヒップホップ, レゲエ', 'Show me ya LOVE', 'Japan', 'https://youtu.be/NCQwApuuRLU?si=MPjC5IZxRjBeBwIq'),
(24, 'ONEDER', 'チルラップ', '日本人の歌', 'Japan', 'https://youtu.be/hq3DQQ0cy3Q?si=Ca-v5y30Rg1xNIYu'),
(25, 'Rickie-G', 'レゲエ, ソウル', 'ラブソウル', 'Japan', 'https://youtu.be/7uiFRcIOVew?si=-b7S46g3LcgoQ0B2'),
(26, '39-man', 'レゲエ, ヒップホップ', 'What Do You See?', 'Japan', 'https://youtu.be/4L5xBd5HHzI?si=kGfn3KQaUe6BWsK_'),
(27, 'ARIWA', 'ダブ, レゲエ', 'KOTAE', 'Japan', 'https://youtu.be/GgxL4hFAGeY?si=L0JOMrHGcupwdTDP');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `pass`) VALUES
(1, 'aaa', 'aaa'),
(2, 'eibayashi', '1234'),
(4, 'aaaa', '1234'),
(5, 'ssss', '1234');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
