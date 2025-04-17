<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Блог</title>
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --danger-color: #f72585;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--dark-color);
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 15px 20px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        .header h1 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        .top-right {
            text-align: right;
        }
        
        .top-right a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: 500;
            transition: var(--transition);
        }
        
        .top-right a:hover {
            color: var(--accent-color);
            text-decoration: underline;
        }
        
        .post {
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }
        
        .post:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        .post h2 {
            color: var(--primary-color);
            margin-top: 0;
            margin-bottom: 10px;
        }
        
        .post p {
            margin-bottom: 15px;
            color: #495057;
        }
        
        .post small {
            display: block;
            margin-top: 15px;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .post-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        a {
            color: var(--primary-color);
            text-decoration: none;
            transition: var(--transition);
        }
        
        a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        button, .btn {
            padding: 8px 16px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
        }
        
        button {
            background-color: var(--danger-color);
            color: white;
        }
        
        button:hover {
            background-color: #d1146a;
        }
        
        .btn-edit {
            background-color: var(--accent-color);
            color: white;
            display: inline-block;
            padding: 8px 16px;
        }
        
        .btn-edit:hover {
            background-color: #3a7bc8;
            color: white;
            text-decoration: none;
        }
        
        .btn-comments {
            background-color: var(--success-color);
            color: white;
            display: inline-block;
            padding: 8px 16px;
        }
        
        .btn-comments:hover {
            background-color: #3aa8d8;
            color: white;
            text-decoration: none;
        }
        
        .btn-create {
            background-color: #38b000;
            color: white;
            padding: 10px 20px;
            border-radius: var(--border-radius);
            font-weight: 500;
        }
        
        .btn-create:hover {
            background-color: #2b8800;
            text-decoration: none;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Последние статьи</h1>
            <div class="top-right">
                <c:if test="${not empty sessionScope.user}">
                    <span>Добро пожаловать, <strong>${sessionScope.user.username}</strong>!</span>
                    <a href="/MiniBlogProj/profile">Перейти в профиль</a>
                    <a href="/MiniBlogProj/logout">Выйти</a>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <a href="/MiniBlogProj/login">Войти</a>
                    <a href="/MiniBlogProj/register">Регистрация</a>
                </c:if>
            </div>
        </div>
        
        <c:if test="${not empty sessionScope.user}">
            <p><a href="/MiniBlogProj/posts/create" class="btn-create">✏️ Опубликовать пост</a></p>
        </c:if>
        
        <c:forEach items="${posts}" var="post">
            <div class="post">
                <h2>${post.title}</h2>
                <p>${post.content}</p>
                <div class="post-actions">
                    <c:if test="${post.username == sessionScope.user.username || sessionScope.user.role == 'ADMIN'}">
                        <form action="/MiniBlogProj/posts/delete" method="post" style="margin: 0;">
                            <input type="hidden" name="postId" value="${post.id}">
                            <button type="submit">🗑️ Удалить</button>
                        </form>
                    </c:if>
                    <c:if test="${post.username == sessionScope.user.username}">
                        <a href="/MiniBlogProj/posts/edit?id=${post.id}" class="btn-edit">✏️ Редактировать</a>
                    </c:if>
                    <a href="/MiniBlogProj/posts/comments?id=${post.id}" class="btn-comments">💬 Комментарии</a>
                </div>
                <small>👤 Автор: ${post.username} | 📅 ${post.createdAt}</small>
            </div>
        </c:forEach>
    </div>
</body>
</html>