<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>メニュー画面</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
        }

        /* サイドバー */
        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            padding: 20px;
            box-sizing: border-box;
            position: fixed;
            top: 0;
            left: 0;
        }

        .sidebar h2 {
            margin-top: 0;
            font-size: 20px;
            text-align: center;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            margin: 15px 0;
            font-size: 16px;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        /* メインコンテンツ */
        .main-content {
            margin-left: 220px;
            padding: 40px;
            width: calc(100% - 220px);
            box-sizing: border-box;
            text-align: center;
        }

        .main-content h2 {
            color: #333;
            margin-bottom: 30px;
        }

        .button-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .menu-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            min-width: 200px;
            transition: background-color 0.3s;
        }

        .menu-button:hover {
            background-color: #45a049;
        }

        .logout-button {
            background-color: #e53935;
        }

        .logout-button:hover {
            background-color: #d32f2f;
        }
    </style>

    <script>
        function confirmLogout() {
            return confirm("ログアウトしてもよろしいですか？");
        }

        function showAlert(message) {
            alert(message + " に移動します");
        }
    </script>
</head>

<body>

    <!-- サイドバー -->
    <div class="sidebar">
        <h2>メニュー</h2>
        <a href="DashboardServlet" onclick="showAlert('ダッシュボード画面')">ダッシュボード</a>
        <a href="HelpServlet" onclick="showAlert('ヘルプ画面')">ヘルプ</a>
    </div>

    <!-- メインコンテンツ -->
    <div class="main-content">
        <h2>機能一覧</h2>
        <div class="button-grid">
            <form action="ProfileServlet" method="get" onsubmit="showAlert('プロフィール画面')">
                <input type="submit" class="menu-button" value="プロフィール画面へ">
            </form>

            <form action="SettingsServlet" method="get" onsubmit="showAlert('設定画面')">
                <input type="submit" class="menu-button" value="設定画面へ">
            </form>

            <form action="FromServlet" method="post" onsubmit="return confirmLogout();">
                <input type="submit" class="menu-button logout-button" name="button" value="logout">
            </form>
        </div>
    </div>

</body>
</html>
	