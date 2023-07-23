<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.tb2 {
    background-color:white;
    
    border:2px solid black;
    
   
 
    
   
   }

   th{
    height: 500px;
    width: 400px;
   
   }
   
   
   .ab1 {
   
   font: 20px Arial;
   color: black;
   font-weight: bold;
   text-shadow:
    
   
   
   }
   .ab2 {
   
    font: 12px Arial;
    font-weight: lighter;
    letter-spacing: 2px;
    color: black;
    text-shadow:

   }
   
   .ab3{
   
      font: 12px Arial;
      font-weight: lighter;
      letter-spacing: 2px;
      color: black;
      opacity: 0.67;
    }
    .ab3:hover{
   
      font: 12px Arial;
      font-weight: lighter;
      letter-spacing: 2px;
      color: black;
      opacity: 1;
    }
    
  .usn {
   
    font: 14px Arial;
    color: black;
    letter-spacing: 1px;
    font-weight: lighter;
    background: transparent;
   
	border: none;
    width: 270px;
     text-align:center;
    
    
    
    }
    .pw {
   
      font: 14px Arial;
      color: black;
      letter-spacing: 1px;
      font-weight: lighter;
      background: transparent;
      border: none;
      width: 270px;
      text-align:center;
      
      
      }
      
      .butlog{

        background-color: white;
        border: 1px solid black;
        color: black;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
        text-shadow:

        
      }
      .butlog:hover {
      
      background-color: black;
        
        color: white;
        border: 1px solid white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
        text-shadow:
      
             
             
     
           }
           
           
             .line {
            width: 300px;
            border: 2px solid black;
        }
</style>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<link rel="stylesheet" href="style.css" type="text/css"></link>
</head>
<body class="mbody">
<%@ include file = "header.html" %>
 <center>
  <table class="tb2">
  <tr>
  <th>
  <center>
    <p class="ab1">Login</p><br><br><br>
    <form method="post" action="loginProcess.jsp">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" class="usn" required>
        <hr class="line" width=300px >
        <br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" class="pw" required>
        <hr class="line" width=300px >
        <br>
        <input type="submit" value="Log In" class="butlog">
        <br>
		<br>
		<a href="createAccount.jsp" class ="ab3" id="text">No account?<b>Sign up!</b></a href>
		<br>
    </form>
</body>
</html>
