# Database Structure

## Описание схемы
Схема БД хранится в `schema.sql`. Основные таблицы:
1. `users` — пользователи
2. `posts` — посты блога
3. `comments` — комментарии

## Как развернуть БД
```bash
mysql -u root -p < src/main/resources/db/schema.sql
mysql -u root -p blog_db < src/main/resources/db/data.sql
```