# Proftpd with mod_sftp and mod_sql

This image is based on Debian Bullseye and contains a Proftpd setup that is configured with:

- MYSQL support for user information
- SFTP support with password or pubkey authentication

## Usage

To use, please specify the following environment variables when spinning up the container:

|Variable|explanation|
|---|---|
|MYSQL_HOST|Location of database server, example: localhost|
|MYSQL_PORT|Port of database server, example: 3306|
|MYSQL_USER|Mysql user which is allowed access to the database/table |
|MYSQL_PASSWORD|Password of the mysql user|
|MYSQL_DATABASE|Database to use for authentication, example: proftpd|
|MYSQL_TABLE|Table to use for authentication, example: ftpusers|

For example:
```
$ docker run -it --rm \
    --env MYSQL_HOST=localhost \
    --env MYSQL_PORT=3306 \
    --env MYSQL_USER=proftpd \
    --env MYSQL_PASSWORD=1234 \
    --env MYSQL_DATABSE=proftpd \
    --env MYSQL_TABLE=ftpusers \
    proftpd-sftp
```

The SQL schema of the ftpusers table should be:

```sql
CREATE TABLE `users` (
`id` int(10) UNSIGNED NOT NULL,
`name` varchar(32) NOT NULL DEFAULT '',
`passwd` varchar(255) NOT NULL DEFAULT '',
`pubkey` text NOT NULL,
`uid` smallint(6) NOT NULL DEFAULT 9999,
`gid` smallint(6) NOT NULL DEFAULT 9999,
`homedir` varchar(255) NOT NULL DEFAULT '',
`shell` varchar(16) NOT NULL DEFAULT '/sbin/nologin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

User passwords can be generated with:
```
$ mkpasswd -m sha-512 "mypassword"
```

The SSH pubkey needs to be stored in RFC4716 format. You can convert a standard OpenSSH public keys by running: 

```
$ ssh-keygen -e -f /path/to/key.pub
```
