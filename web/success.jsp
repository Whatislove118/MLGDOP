<%@ page import="User.User" %><%--
  Created by IntelliJ IDEA.
  User: whatislove118
  Date: 06.11.2019
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url("1.jpg");
            color: red;
        }
    </style>
    <script src="jquery-3.4.1.min.js"></script>
    <title></title>
</head>
<body id="body">
<%--Получаем user из сессии, и выводим его имя--%>
<% User user =(User)request.getSession().getAttribute("user"); %>
<h1 id="result"><%= user.getName()%></h1>
<form id="form">
    <a id="a"  href="http://localhost:15200/LAB2DOP_war_exploded/index.jsp">GO BACK</a>
</form>
<script>
    //Проверка , прошло ли все успешно
    if("<%= user.getName()%>"!="Вы были успешно зарегистрированы!Введите логин на предыдущей странице для авторизации!" && "<%= user.getName()%>"!="ЭТО НЕ ВАШ ЛОГИН! В ДОСТУПЕ ОТКАЗАНО!!!" && "<%= user.getName()%>"!="В доступе отказано!"){
        console.log("go");
        $('#result').text('Привет <%= user.getName()%>! Ты был успешно авторизован! Ну, желаю тебе удачи!')
        $('#body').css('background-image','url("2.jpg")');
        $('#body').css("color","green");
        document.getElementById("a").href="http://localhost:15200/LAB2DOP_war_exploded/omg.jsp";
       $('#a').text("OK , LETS DO THIS!");
       //Предупреждение
        $('#a').click(function () {
            alert("ВЫ уверены? Возможны появления разного рода музыки и гифок. НЕ для слабонервных!")
        });
    }
</script>
</body>
</html>
