<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Редактирование поста</title>
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
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        h1 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        h1:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            border-radius: 3px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            box-sizing: border-box;
            font-family: inherit;
            transition: var(--transition);
        }
        
        input[type="text"]:focus, textarea:focus {
            border-color: var(--accent-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
        }
        
        input[type="text"] {
            height: 45px;
        }
        
        textarea {
            min-height: 200px;
            resize: vertical;
        }
        
        .form-actions {
            display: flex;
            align-items: center;
            margin-top: 30px;
        }
        
        button[type="submit"] {
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
        }
        
        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        .btn-cancel {
            display: inline-block;
            margin-left: 15px;
            padding: 10px 20px;
            color: var(--secondary-color);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-weight: 500;
        }
        
        .btn-cancel:hover {
            background-color: #f1f3f5;
            text-decoration: none;
        }
        
        .error {
            color: var(--danger-color);
            margin-top: 5px;
            font-size: 0.9rem;
            display: inline-block;
            padding: 3px 8px;
            background-color: rgba(247, 37, 133, 0.1);
            border-radius: 4px;
        }
        
        .input-hint {
            font-size: 0.8rem;
            color: #6c757d;
            margin-top: 5px;
        }
        
        .post-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            border-left: 4px solid var(--accent-color);
        }
        
        .post-info p {
            margin: 5px 0;
            color: #495057;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <div class="container">
        <h1>✏️ Редактирование поста</h1>
        
        <div class="post-info">
            <p><strong>Автор:</strong> ${post.username}</p>
            <p><strong>Дата создания:</strong> ${post.createdAt}</p>
        </div>
        
        <form action="/MiniBlogProj/posts/edit" method="post">
            <input type="hidden" name="postId" value="${post.id}">
            
            <div class="form-group">
                <label for="title">Заголовок:</label>
                <input type="text" id="title" name="title" required 
                       placeholder="Введите заголовок поста" maxlength="255" value="${post.title}">
                <div class="input-hint">Максимум 255 символов</div>
                <c:if test="${not empty titleError}">
                    <span class="error">${titleError}</span>
                </c:if>
            </div>
            
            <div class="form-group">
                <label for="content">Содержание:</label>
                <textarea id="content" name="content" required 
                          placeholder="Напишите содержание вашего поста">${post.content}</textarea>
                <c:if test="${not empty contentError}">
                    <span class="error">${contentError}</span>
                </c:if>
            </div>
            
            <div class="form-actions">
                <button type="submit">💾 Сохранить изменения</button>
                <a href="/MiniBlogProj/posts" class="btn-cancel">Отмена</a>
            </div>
        </form>
    </div>
</body>
</html>
