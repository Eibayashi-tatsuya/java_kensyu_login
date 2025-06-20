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
            position: relative;
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
            padding: 10px;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        /* ログアウトボタン */
        .logout-wrapper {
            position: absolute;
            bottom: 20px;
            left: 20px;
            right: 20px;
        }

        .logout-button {
            display: block;
            width: 100%;
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px 0;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .logout-button:hover {
            background-color: #c0392b;
        }

        /* メインコンテンツ */
        .main-content {
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
            width: 120px;
            height: 120px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 12px;
            transition: background-color 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            gap: 8px;
        }

        .menu-button:hover {
            background-color: #45a049;
        }

        .menu-button img {
            width: 40px;
            height: 40px;
            object-fit: contain;
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
        <a href="from.jsp">機能一覧</a>
        <a href="DashboardServlet" onclick="showAlert('ダッシュボード画面')">ダッシュボード</a>
        <a href="HelpServlet" onclick="showAlert('ヘルプ画面')">ヘルプ</a>

        <!-- ログアウトボタン -->
        <div class="logout-wrapper">
            <form action="FromServlet" method="post" onsubmit="return confirmLogout();">
                <input type="submit" class="logout-button" name="button" value="logout">
            </form>
        </div>
    </div>

    <!-- メインコンテンツ -->
    <div class="main-content">
        <h2>機能一覧</h2>
        <div class="button-grid">

            <form action="FromServlet" method="get" onsubmit="showAlert('アーティスト一覧画面')">
                <button type="submit" class="menu-button" name="button" value="artist_list">
                    <img src="https://cdn-icons-png.flaticon.com/512/64/64572.png" alt="Artist Icon">
                    artist_list
                </button>
            </form>
            
            <form action="FromServlet" method="get" onsubmit="showAlert('アーティスト一覧画面')">
                <button type="submit" class="menu-button" name="button" value="profile">
                    <img src="" >
                    profile
                </button>
            </form>

            <form action="FromServlet" method="get" onsubmit="showAlert('設定画面')">
                <button type="submit" class="menu-button" name="button" value="setting">
                    <img src="https://cdn-icons-png.flaticon.com/512/2099/2099058.png" alt="Settings Icon">
                    setting
                </button>
            </form>

        </div>
    </div>

</body>
</html>
