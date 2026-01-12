DROP DATABASE IF EXISTS twitter;
CREATE DATABASE twitter;
USE twitter;

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS follow;
DROP TABLE IF EXISTS tweet;
DROP TABLE IF EXISTS retweet;
DROP TABLE IF EXISTS hashtag;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS block_user;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS bookmark;
DROP TABLE IF EXISTS impression;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS community;
DROP TABLE IF EXISTS user_community;

CREATE TABLE `user` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `role` varchar(255) DEFAULT 'user',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) UNIQUE NOT NULL,
  `display_name` varchar(255),
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `phone` varchar(255) NULL,
  `url` varchar(255) NULL,
  `biography` varchar(255) NULL,
  `city` varchar(255) NULL,
  `country` varchar(255) NULL,
  `genre` varchar(255) NULL,
  `picture` varchar(255) NULL,
  `header` varchar(255) NULL,
  `NSFW` boolean DEFAULT false,
  `is_active` boolean DEFAULT true NOT NULL,
  `is_verified` boolean DEFAULT false NOT NULL,
  `ban` varchar(255) DEFAULT NULL,
  `creation_date` date NOT NULL,
  `verified_date` date DEFAULT NULL,
  `inactive_date` date DEFAULT NULL
);

CREATE TABLE `follow` (
  `id_user_follow` integer NOT NULL,
  `id_user_followed` integer NOT NULL,
  PRIMARY KEY (id_user_follow, id_user_followed), -- clé primaire composite
  FOREIGN KEY (id_user_follow) REFERENCES user(id),
  FOREIGN KEY (id_user_followed) REFERENCES user(id)
);

CREATE TABLE `block_user` (
  `id_user` integer NOT NULL,
  `id_blocked_user` integer NOT NULL,
  PRIMARY KEY (id_user, id_blocked_user), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_blocked_user) REFERENCES user(id)
);

CREATE TABLE `tweet` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_user` integer NOT NULL,
  `reply_to` integer NULL,
  `quote_to` integer NULL,
  `NSFW` boolean DEFAULT false NOT NULL,
  `content` varchar(140) NOT NULL,
  `creation_date` datetime NOT NULL,
  `is_pinned` boolean NOT NULL DEFAULT false,
  `is_community` boolean NOT NULL DEFAULT false,
  `media1` varchar(255) NULL,
  `media2` varchar(255) NULL,
  `media3` varchar(255) NULL,
  `media4` varchar(255) NULL,
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (reply_to) REFERENCES tweet(id),
  FOREIGN KEY (quote_to) REFERENCES tweet(id)
);

CREATE TABLE `bookmark` (
  `id_tweet` integer NOT NULL,
  `id_user` integer NOT NULL,
  PRIMARY KEY (id_tweet, id_user), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_tweet) REFERENCES tweet(id)
);

CREATE TABLE `impression` (
  `id_user` integer NOT NULL,
  `id_tweet` integer NOT NULL,
  PRIMARY KEY (id_user, id_tweet), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_tweet) REFERENCES tweet(id)
);

CREATE TABLE `retweet` (
  `id_user` integer NOT NULL,
  `id_tweet` integer NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (id_user, id_tweet), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_tweet) REFERENCES tweet(id)
);

CREATE TABLE `hashtag` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `report` (
  `id_tweet` integer NOT NULL,
  `id_user` integer NOT NULL,
  `description` varchar(255) DEFAULT null,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (id_tweet, id_user), -- clé primaire composite
  FOREIGN KEY (id_tweet) REFERENCES tweet(id),
  FOREIGN KEY (id_user) REFERENCES user(id)
);

CREATE TABLE `likes` (
  `id_user` integer NOT NULL,
  `id_tweet` integer NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (id_user, id_tweet), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_tweet) REFERENCES tweet(id)
);

CREATE TABLE `message` (
  `id` integer PRIMARY KEY,
  `content` varchar(255) NOT NULL,
  `media` varchar(255) NULL,
  `id_sender` integer NOT NULL,
  `id_receiver` integer NOT NULL,
  `date` datetime NOT NULL,
  `is_hidden` boolean NOT NULL DEFAULT false,
  `is_viewed` boolean NOT NULL DEFAULT false,
  FOREIGN KEY (id_sender) REFERENCES user(id),
  FOREIGN KEY (id_receiver) REFERENCES user(id)
);

CREATE TABLE `community` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `biography` varchar(255),
  `id_creator` integer NOT NULL,
  `cover` varchar(255),
  `date_creation` datetime NOT NULL,
  FOREIGN KEY (id_creator) REFERENCES user(id)
);

CREATE TABLE `user_community` (
  `id_community` integer NOT NULL,
  `id_user` integer NOT NULL,
  `role` varchar(255) DEFAULT 'user',
  PRIMARY KEY (id_community, id_user), -- clé primaire composite
  FOREIGN KEY (id_user) REFERENCES user(id),
  FOREIGN KEY (id_community) REFERENCES community(id)
);

INSERT INTO user (firstname,lastname,username,email,password,birthdate,city,country,creation_date)
VALUES
('Alex','Martin','alexm','test@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','2000-05-15','Paris','France','2025-05-15'),
('Lina','Roche','lina_r','test2@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','2003-06-21','Lyon','France','2024-02-27'),
('Yanis','Moreau','yanis_m','test3@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','2002-12-25','Lille','France','2025-01-19'),
('Sara','Costa','sara_c','demo4@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','1999-03-09','Bordeaux','France','2025-02-01'),
('Noah','Petit','noahp','demo5@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','2001-08-12','Nantes','France','2025-02-03'),
('Maya','Bernard','maya_b','demo6@test.fr','$2y$12$Pytp0u8goNwTBf89id6CrOMy1H5rkbjbaDq8nIJFSLPKsW1k3Gfje','2001-11-22','Marseille','France','2025-02-05');

INSERT INTO follow (id_user_follow, id_user_followed)
VALUES
(1,2), (1,3), (1,4), (1,5),
(2,1), (2,3), (2,6),
(3,1), (3,2), (3,4),
(4,1), (4,2), (4,3), (4,5),
(5,1), (5,4), (5,6),
(6,2), (6,5);

INSERT INTO tweet (id_user, content, creation_date)
VALUES 
(
    1, 'Salut MetaRaid, premier post', '2025-02-15 12:00:00'
),
(
    1, 'Setup termine, on peut build', '2025-02-16 12:00:00'
),
(
    2, 'Petit test des hashtags', '2025-02-15 12:05:00'
),
(
    2, 'Hate de partager mes photos', '2025-02-16 12:10:00'
),
(
    3, 'Hello tout le monde', '2025-02-15 12:03:00'
),
(
    3, 'Cafe, code, repeat', '2025-02-16 12:20:00'
),
(
    4, 'Playlist du moment en boucle', '2025-02-16 12:25:00'
),
(
    5, 'Petit mood du soir', '2025-02-16 12:30:00'
),
(
    6, 'Journaux de bord en cours', '2025-02-16 12:35:00'
);

INSERT INTO tweet (id_user, content, creation_date,media1)
VALUES 
(2, 'Photo du jour', '2025-02-15 12:45:00','../Assets/MediaTweets/67d738a8f4020_718khrgr5bL._UF1000,1000_QL80_.jpg'),
(3, 'Vinyle retrouve', '2025-02-16 13:05:00','../Assets/MediaTweets/67d7378b3914e_b1961.jpg'),
(1, '808s en boucle', '2025-02-16 13:10:00','../Assets/MediaTweets/67d738a900167_808s-Heartbreak-Edition-Collector-Deluxe.jpg'),
(4, 'Cover du jour', '2025-02-16 13:15:00','../Assets/MediaTweets/67d738a9001f5_ab67616d0000b273d9194aa18fa4c9362b47464f.jpeg'),
(5, 'Nouvelle decouverte', '2025-02-16 13:20:00','../Assets/MediaTweets/67d738a900262_61Jr-rvLUDL._UF1000,1000_QL80_.jpg'),
(6, 'Artwork prefere', '2025-02-16 13:25:00','../Assets/MediaTweets/67e2b87a2283d_6OkBsWD.jpg'),
(2, 'Classique intemporel', '2025-02-16 13:30:00','../Assets/MediaTweets/67e2b87a2326c_Thriller.jpg'),
(3, 'Edition speciale', '2025-02-16 13:35:00','../Assets/MediaTweets/67e2b87a231f2_81sBKBIcwvL._UF1000,1000_QL80_.jpg'),
(4, 'Photo de match', '2025-02-16 13:40:00','../Assets/MediaTweets/683f06f970fff_demblee.jpeg'),
(5, 'Autre angle', '2025-02-16 13:45:00','../Assets/MediaTweets/683f077111d6f_demblee.jpeg');

INSERT INTO retweet (id_user, id_tweet, creation_date)
VALUES
(2, 10, '2025-02-16 14:00:00'),
(3, 11, '2025-02-16 14:05:00'),
(4, 12, '2025-02-16 14:10:00'),
(5, 13, '2025-02-16 14:15:00'),
(6, 14, '2025-02-16 14:20:00'),
(1, 15, '2025-02-16 14:25:00'),
(2, 16, '2025-02-16 14:30:00'),
(3, 17, '2025-02-16 14:35:00'),
(4, 18, '2025-02-16 14:40:00'),
(5, 19, '2025-02-16 14:45:00');

UPDATE `user`
SET `picture` = '../Assets/pfdefault.png'
WHERE `id` = 2;

UPDATE `user`
SET `picture` = '../Assets/pfdefault.png'
WHERE `id` = 1;

UPDATE user 
SET header = '../Assets/ProfileHeaders/naruto-baryon-mode-boruto-scaled.jpg' 
WHERE id = 1;

UPDATE user 
SET biography = 'Curieux, joueur, et fan de nouvelles idees' 
WHERE id = 1;
