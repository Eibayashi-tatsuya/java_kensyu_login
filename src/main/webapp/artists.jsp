<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.ArtistsDTO" %>

<%
    ArrayList<ArtistsDTO> artists = (ArrayList<ArtistsDTO>) session.getAttribute("art");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>アーティスト一覧</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f5f5;
            padding: 40px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #2980b9;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .card h2 {
            margin: 0 0 10px;
            color: #2c3e50;
            text-decoration: underline;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        .empty-message {
            text-align: center;
            color: #888;
            font-size: 16px;
            margin-top: 50px;
        }
        
    </style>
</head>
<body>

<!-- 戻るボタン -->
<div style="text-align: center;">
    <button class="back-button" onclick="history.back();">← 戻る</button>
</div>

<h1>アーティスト一覧</h1>

<% if (artists != null && !artists.isEmpty()) { %>
    <div class="grid">
        <% for (ArtistsDTO artist : artists) { %>
            <div class="card">
    <!-- 仮画像 -->
    <img src="https://placehold.jp/000000/B59658/250x150.jpg" alt="Artist Image" class="artist-image">
    
    <h2><%= artist.getName() %></h2>
    <p><strong>お気に入りの曲:</strong> <%= artist.getSong() %></p>
    <p><strong>出身地:</strong> <%= artist.getLocation() %></p>
    <p><a href="<%=artist.getUrl()%>">曲を聞く</a></p>
    <p>情報:</p>
</div>

        <% } %>
    </div>
<% } else { %>
    <div class="empty-message">アーティスト情報が見つかりません。</div>
<% } %>

</body>
</html>
