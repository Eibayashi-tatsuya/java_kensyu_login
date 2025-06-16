<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>設定メニュー</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .settings-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 48px 40px;
            border-radius: 20px;
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.2);
            width: 360px;
            text-align: center;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h2 {
            margin-bottom: 32px;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .btn-setting {
            display: block;
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            font-size: 16px;
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-setting:hover {
            background-color: rgba(255, 255, 255, 0.4);
            color: #333;
            font-weight: bold;
        }

        @media (max-width: 480px) {
            .settings-container {
                width: 90%;
                padding: 32px 20px;
            }
        }
    </style>
</head>
<body>

<div class="settings-container">
    <h2>設定メニュー</h2>

    <a href="userEdit.jsp" class="btn-setting">登録情報の変更</a>
    <a href="otherSettings.jsp" class="btn-setting">その他の設定</a>
</div>

</body>
</html>
