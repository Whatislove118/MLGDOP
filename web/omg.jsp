<%--
  Created by IntelliJ IDEA.
  User: whatislove118
  Date: 07.11.2019
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="jquery-3.4.1.min.js"></script>

    <style>
        body{
            background:url("start.jpg");
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <title>OMG</title>
</head>
<body id="body">
<input type="button" id="button" value="CLICK ON ME"/>
</body>
<script>
    //MLG CLICK
    $("#button").click(function () {
        alert("Вы точно этого хотите???");
        $('#button').prop('disabled',true);
        var audio = new Audio("mlgmusic.mp3");
        audio.play();
        doThisShit();
        setTimeout("$('#button').prop('disabled',false);",100000);
    });
    function doThisShit() {
        $("#body").css('background','url("start1.jpg');
        setTimeout("$(\"#body\").css('background','url(\"mlg1.gif\")');", 4000);
        setTimeout("$(\"#body\").css('background','url(\"mlg2.gif\")');", 17000);
        setTimeout("$(\"#body\").css('background','url(\"mlg3.gif\")');", 30000);
        setTimeout("$(\"#body\").css('background','url(\"mlg4.gif\")');", 43000);
        setTimeout("$(\"#body\").css('background','url(\"mlg5.gif\")');", 56000);
        setTimeout("$(\"#body\").css('background','url(\"mlg6.gif\")');", 69000);
        setTimeout("$(\"#body\").css('background','url(\"mlg7.gif\")');", 820000);
        setTimeout("$(\"#body\").css('background','url(\"end.png\")');", 95000);
    }


</script>
</html>
