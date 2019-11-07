<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="User.User" %>
<%--
  Created by IntelliJ IDEA.
  User: whatislove118
  Date: 05.11.2019
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <style>
      body {
        background-image: url("1.jpg");
        color: red;
      }
    </style>
    <script src="jquery-3.4.1.min.js" type="text/javascript" ></script>
    <title>Lab2Dop</title>
  </head>
  <body>
  <h2>Форма авторизации</h2>
  <form id="form" class="form" action="filter" text-align="center">
      Введите логин:
    <input type="text" value="Введите логин" name="name" id="textName"/>
    <input type="submit" id="submit"/>
  </form>
  <div>
    <p id="checkName"></p>
  </div>
  <script type="text/javascript">
    //Метод, проверяющий корректность ввода
    function check(){
        let check=true;
        if(document.forms['form'].elements['textName'].value.trim()=="Введите логин"){
            alert("Введите корректный логин!");
            document.getElementById('checkName').innerHTML="Логин не был введен!";
            check = false;
        }
        if(/[A-z]/.test(document.forms['form'].elements['textName'].value.trim())){
            check=true;
        }else{
            alert("Логин может содержать только английские заглавные и(или) строчные буквы!!");
            document.getElementById('checkName').innerHTML="Логин не был введен!";
            check=false;
        }
       return check;
    }
    //Проверка, все ли готово к запросу
    $('#form').submit(function () {
        if(!check()){
            return false;
        }
    });

    //скрипт, который возвращает изначальное значение строки ввода, если пользователь ничего не ввел
      $('#textName').focus(function () {
          $('#textName').val("");
          $('#textName').blur(function () {
              if( $('#textName').val()===""){
                  $('#textName').val("Введите логин");
              }
          });
      });
  </script>
  </body>
</html>
