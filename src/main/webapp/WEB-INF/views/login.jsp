<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="page" value="Login"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>

<!-- Header -->
<jsp:include page="components/header.jsp"></jsp:include>
<br>

<h1 class="text-success mt-5">${msg1}</h1>
<h3 class="text-success text-centered">${resp}</h3>
<h3 class="text-danger text-centered"><strong>${error}</strong></h3>

<div class="text-center col-3 align-items-center mx-auto">
    <form class="form-signin" action="loginUsername" method="post">
  <img class="mb-4" src="static/images/SEW Logo.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="username">Username</label>
  <input type="text" name="username" id="username" class="form-control" placeholder="Username">
  <label for="password" class="sr-only">Password</label>
  <input type="password" name="password" id="password" class="form-control" placeholder="Password">
  <button class="btn btn-md btn-success btn-block" type="submit">Sign in</button>
  <!-- <p class="mt-5 mb-3 text-muted">© 2017-2020</p> -->
</form>
</div>


<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>