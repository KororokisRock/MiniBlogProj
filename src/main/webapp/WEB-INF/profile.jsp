<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Профиль | ${sessionScope.user.username}</title>
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
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
            background: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: var(--border-radius);
            transition: var(--transition);
        }
        
        .back-link:hover {
            background-color: rgba(67, 97, 238, 0.1);
            text-decoration: underline;
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f1f3f5;
        }
        
        .profile-header h1 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        
        .user-info {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            border-left: 4px solid var(--accent-color);
        }
        
        .user-info h3 {
            color: var(--secondary-color);
            margin-top: 0;
            margin-bottom: 5px;
        }
        
        .user-info small {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .delete-account {
            margin: 30px 0;
            padding: 20px;
            background-color: #fff5f7;
            border-radius: var(--border-radius);
            border-left: 4px solid var(--danger-color);
        }
        
        .delete-account h3 {
            color: var(--danger-color);
            margin-top: 0;
            margin-bottom: 15px;
        }
        
        .delete-btn {
            background: linear-gradient(to right, var(--danger-color), #d1146a);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(247, 37, 133, 0.2);
        }
        
        .posts-section h3 {
            color: var(--primary-color);
            border-bottom: 2px solid var(--accent-color);
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        
        .post-list {
            display: grid;
            gap: 15px;
        }
        
        .post-link {
            display: block;
            padding: 15px;
            background-color: white;
            border: 1px solid #e9ecef;
            border-radius: var(--border-radius);
            color: var(--dark-color);
            text-decoration: none;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
        }
        
        .post-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-color: var(--accent-color);
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/MiniBlogProj/posts" class="back-link">← Вернуться к постам</a>
        
        <div class="profile-header">
            <h1>👤 Профиль пользователя</h1>
        </div>
        
        <div class="user-info">
            <h3>${sessionScope.user.username}</h3>
            <small>📅 Дата регистрации: ${sessionScope.user.createdAt}</small>
        </div>
        
        <div class="delete-account">
            <h3>⚠️ Опасная зона</h3>
            <form action="/MiniBlogProj/profile" method="post" onsubmit="return confirm('Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя отменить!');">
                <button type="submit" class="delete-btn">
                    🗑️ Удалить аккаунт
                </button>
            </form>
        </div>
        
        <div class="posts-section">
            <h3>📝 Ваши статьи:</h3>
            <div class="post-list">
                <c:forEach items="${posts}" var="post">
                    <a href="/MiniBlogProj/posts/comments?id=${post.id}" class="post-link">
                        ${post.title}
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
