CREATE DATABASE my_db;
CREATE USER 'mkristie'@'%' IDENTIFIED BY 'mkristie';
GRANT ALL PRIVILEGES ON wp_bd.sql TO 'mkristie'@'%';
FLUSH PRIVILEGES;