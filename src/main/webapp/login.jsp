<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<title>ログイン</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: #444;
}

.login-container {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
	padding: 48px 40px;
	width: 380px;
	box-sizing: border-box;
	position: relative;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	align-items: center;
}

h2 {
	margin: 0 0 36px 0;
	font-weight: 700;
	font-size: 32px;
	text-align: center;
	color: #333;
	letter-spacing: 1.2px;
	user-select: none;
	width: 100%;
}

form {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 24px;
}

.input-group {
	position: relative;
	margin-bottom: 28px;
	width: 100%;
}

.input-group input {
	width: 100%;
	padding: 14px 16px 14px 44px;
	border: 2px solid #ccc;
	border-radius: 12px;
	font-size: 16px;
	transition: border-color 0.3s, box-shadow 0.3s;
	outline: none;
	color: #222;
	background-color: #fafafa;
	box-shadow: inset 1px 1px 3px rgba(255, 255, 255, 0.8);
	box-sizing: border-box;
}

.input-group input:focus {
	border-color: #667eea;
	box-shadow: 0 0 8px rgba(102, 126, 234, 0.6);
	background-color: #fff;
}

.input-group.username::before, .input-group.password::before {
	content: "";
	position: absolute;
	top: 50%;
	left: 16px;
	width: 20px;
	height: 20px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	transform: translateY(-50%);
	opacity: 0.6;
	transition: opacity 0.3s;
	pointer-events: none;
}

.input-group.username::before {
	background-image:
		url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjNjY3ZWVhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCI+PHBhdGggZD0iTTEwIDEwYTIgMiAwIDEgMSAwLTQgMiAyIDAgMCAxIDAgNCIvPjxwYXRoIGQ9Ik0xMCAxMmMtMy4zIDAtNiAyLjctNiA2aDEyYzAtMy4zLTIuNy02LTYtNnptMC0xMWE0IDQgMCAxIDAgMCA4IDQgNCAwIDAgMCAwLTh6Ii8+PC9zdmc+');
}

.input-group.password::before {
	background-image:
		url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjNjY3ZWVhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCI+PHBhdGggZD0iTTE1IDloLTF2LTFhMyAzIDAgMCAwLTYgMXYxaC0xYTEgMSAwIDAgMC0xIDF2OWExIDEgMCAwIDAgMSAxaDEwYTEgMSAwIDAgMCAxLTF2LTZhMyAzIDAgMCAwLTYtMXYxem0tMyAzYS43LjcgMCAxIDEgMS40IDAgLjcuNyAwIDAgMS0xLjQtMHoiLz48L3N2Zz4=');
}

button {
	border-radius: 12px;
	font-weight: 700;
	cursor: pointer;
	transition: background-color 0.3s, box-shadow 0.3s;
	user-select: none;
	border: none;
	box-sizing: border-box;
}

.btn-login {
	background-color: #667eea;
	color: white;
	padding: 14px 0;
	font-size: 18px;
	box-shadow: 0 6px 14px rgba(102, 126, 234, 0.6);
	width: 100%;
	margin: 0;
}

.btn-login:hover, .btn-login:focus {
	background-color: #5563c1;
	box-shadow: 0 8px 20px rgba(85, 99, 193, 0.8);
	outline: none;
}

.btn-register {
	margin-top: 16px;
	font-size: 14px;
	color: #43cea2;
	text-decoration: none;
	user-select: none;
	transition: color 0.3s;
}

.btn-register:hover , back-link:focus {
	color: #2a9d74;
	text-decoration: underline;
	outline: none;
}

.error-message {
	color: #e53935;
	font-size: 14px;
	margin-top: 8px;
	min-height: 22px;
	text-align: center;
	font-weight: 600;
	user-select: none;
	width: 100%;
}

@media ( max-width : 420px) {
	.login-container {
		width: 90%;
		padding: 36px 24px;
	}
}
</style>
</head>
<body>

	<div class="login-container" role="main" aria-label="ログインフォーム">
		<h2>ログイン</h2>
		<form action="LoginServlet" method="post" novalidate>
			<div class="input-group username">
				<input type="text" name="username" placeholder="ユーザー名" required
					autocomplete="username" aria-label="ユーザー名" />
			</div>
			<div class="input-group password">
				<input type="password" name="password" placeholder="パスワード" required
					autocomplete="current-password" aria-label="パスワード" />
			</div>
			<button type="submit" class="btn-login">ログイン</button>
		</form>

		<a href="./sinup.jsp" class="btn-register" aria-label="新規登録画面へ">新規登録</a>

		<div class="error-message" role="alert" aria-live="assertive">
			<%=request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
		</div>
	</div>

</body>
</html>
