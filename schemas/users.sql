# This SQL schema is used for testing purposes (when run with docker-compose)

CREATE DATABASE IF NOT EXISTS `proftpd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE 'proftpd';

CREATE TABLE IF NOT EXISTS `users` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(32) NOT NULL DEFAULT '',
    `passwd` varchar(255) NOT NULL DEFAULT '',
    `pubkey` text NOT NULL,
    `uid` smallint(6) NOT NULL DEFAULT '9999',
    `gid` smallint(6) NOT NULL DEFAULT '9999',
    `homedir` varchar(255) NOT NULL DEFAULT '',
    `shell` varchar(16) NOT NULL DEFAULT '/sbin/nologin',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `passwd`, `pubkey`, `uid`, `gid`, `homedir`, `shell`) VALUES
(1, 'test', '$6$nzowCMgv7N$dgIs5EVuW4BSZF/D2ss2/eeCz5BlQCsNmMD7OfYV20hvkrcoRxUvS.yIZqh1E/PufCselyHZ1Sjp8dgJm8BpT.', '---- BEGIN SSH2 PUBLIC KEY ----\r\nComment: \"2048-bit RSA, converted by fili@Dodo from OpenSSH\"\r\nAAAAB3NzaC1yc2EAAAADAQABAAABAQCpiwbT1JESGUEU4ky7lv5nX9f/xJiaATH2wQHHQL\r\nWXJ62utxbQMWQbcW13Jo5M4iAxT9KvndqvtOi3tzPYJV6DUjJskjIYzrR9bryHvlDqDUlI\r\nzH0u8QbejQlbgUUnbUPUtMBIvPA1R/dcOHMJC01WPKpUyVJrwl0gZXAdeFFPLnvK4+NkDo\r\nRp6UoGDvfST6shyOKkTslLxeBxKFx5Md+ES4RLZSCoJc7qIJf5Hh/6aTYkeMVHUDy5O89L\r\nFBqohUtPLDuDt18IIfBlXVG91a+/Oga/upHNxH5PVDzqqVVvpQGKL2tx4ZzarYsP2JPq16\r\nLV95XuPYfEGg4mfqxCE8j/\r\n---- END SSH2 PUBLIC KEY ----\r\n', 2000, 100, '/home/test/DOMAIN', '/sbin/nologin');
