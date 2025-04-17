-- Database: blog_db
-- Версия схемы: 1.0

DROP DATABASE IF EXISTS blog_db;
CREATE DATABASE blog_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE blog_db;

-- Таблица пользователей
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE COMMENT 'Логин пользователя',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email',
    password VARCHAR(100) NOT NULL COMMENT 'Хэшированный пароль',
    role ENUM('USER', 'ADMIN') DEFAULT 'USER' COMMENT 'Роль в системе',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата регистрации'
) COMMENT 'Пользователи блога';

-- Таблица постов
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL COMMENT 'Заголовок поста',
    content TEXT NOT NULL COMMENT 'Текст поста',
    user_id INT NOT NULL COMMENT 'Автор поста',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) COMMENT 'Посты блога';

-- Таблица комментариев
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL COMMENT 'Текст комментария',
    user_id INT NOT NULL COMMENT 'Автор комментария',
    post_id INT NOT NULL COMMENT 'Пост, к которому оставлен комментарий',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
) COMMENT 'Комментарии к постам';