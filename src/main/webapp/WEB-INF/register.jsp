<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Регистрация в блоге</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .register-container {
            max-width: 450px;
            width: 100%;
            background: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
        }
        
        .btn-back {
            position: absolute;
            top: 20px;
            left: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
        }
        
        .btn-back:hover {
            text-decoration: underline;
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .register-header h1 {
            color: var(--primary-color);
            margin-top: 40px;
            margin-bottom: 10px;
        }
        
        .register-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        
        .form-group label {
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .form-group input {
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            font-family: inherit;
            transition: var(--transition);
        }
        
        .form-group input:focus {
            border-color: var(--accent-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
        }
        
        .register-button {
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            color: white;
            padding: 12px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
            margin-top: 10px;
        }
        
        .register-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        .error-message {
            color: var(--danger-color);
            background-color: rgba(247, 37, 133, 0.1);
            padding: 10px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            text-align: center;
            border-left: 4px solid var(--danger-color);
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        
        .login-link a {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .password-hint {
            font-size: 0.8rem;
            color: #6c757d;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <a href="/MiniBlogProj/posts" class="btn-back">← Назад</a>
        
        <div class="register-header">
            <h1>📝 Регистрация</h1>
            <p>Создайте новый аккаунт</p>
        </div>
        
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        
        <form class="register-form" action="/MiniBlogProj/register" method="post">
            <div class="form-group">
                <label for="username">Имя пользователя:</label>
                <input type="text" id="username" name="username" placeholder="Придумайте логин" required>
            </div>
            
            <div class="form-group">
                <label for="email">Электронная почта:</label>
                <input type="email" id="email" name="email" placeholder="Введите вашу почту" required>
            </div>
            
            <div class="form-group">
                <label for="password1">Пароль:</label>
                <input type="password" id="password1" name="password1" placeholder="Придумайте пароль" required>
                <div class="password-hint">Минимум 6 символов</div>
            </div>
            
            <div class="form-group">
                <label for="password2">Повторите пароль:</label>
                <input type="password" id="password2" name="password2" placeholder="Повторите пароль" required>
            </div>
            
            <button type="submit" class="register-button">Зарегистрироваться</button>
        </form>
        
        <div class="login-link">
            Уже есть аккаунт? <a href="/MiniBlogProj/login">Войдите</a>
        </div>
    </div>
</body>
</html>