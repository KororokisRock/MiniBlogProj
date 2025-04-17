<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Требуется авторизация</title>
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
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }
        
        .auth-container {
            max-width: 500px;
            width: 90%;
            background: white;
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        .error-message {
            color: var(--danger-color);
            background-color: rgba(247, 37, 133, 0.1);
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            border-left: 4px solid var(--danger-color);
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .auth-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        
        .auth-link {
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            color: white;
            padding: 12px 24px;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .auth-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            text-decoration: none;
        }
        
        .auth-link.login {
            background: linear-gradient(to right, var(--success-color), #3aa8d8);
        }
        
        .auth-link.register {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="error-message">
            ⚠️ Вы не авторизованы! Войдите или зарегистрируйтесь.
        </div>
        
        <div class="auth-links">
            <a href="/MiniBlogProj/login" class="auth-link login">
                🔑 Войти
            </a>
            <a href="/MiniBlogProj/register" class="auth-link register">
                📝 Регистрация
            </a>
        </div>
    </div>
</body>
</html>