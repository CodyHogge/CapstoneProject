<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <c:if test="${role ne 'ADMIN'}">
	<c:redirect url="/profile" />
</c:if> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<!-- CSS only -->
<link rel="stylesheet" href="styles/styles.css">
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




<h1 class="text-success mt-4">${welcomeMessage}</h1>
<h4 class="text-danger text-center">${error}</h4>



<div class="text-center col-3 align-items-center mx-auto mt-auto">
    <form:form class="form-signin" action="register" modelAttribute="users" method="post">
		<img class="mb-4" src="static/images/SEW Logo.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 mt-5 font-weight-normal">User Registration</h1>
		<div class="form-group">		
			<label for="firstName">First Name</label>
			<form:input type="text" path="firstName"  class="form-control" placeholder="First Name"/>
			<form:errors path="firstName" class="text-danger text-center"/>
		</div>
		<div class="form-group">
			<label for="lastName">Last Name</label>
			<form:input type="text" path="lastName"  class="form-control" placeholder="Last Name"/>
			<form:errors path="lastName" class="text-danger text-center"/>
		</div>
		<div class="form-group">
			<label for="username">Username</label>
			<form:input type="text" path="username"  class="form-control" placeholder="Username"/>
			<form:errors path="firstName" class="text-danger text-center"/>
		</div>
		<%-- <div class="form-group">
			<label for="email">Email Address</label>
			<form:input type="email" path="email"  class="form-control" placeholder="Email Address"/>
			<form:errors path="email" class="text-danger text-center"/>
		</div> --%>
		<div class="form-group">
			<label for="division">Division</label>
				<form:select path="division" name="division" class="form-control" placeholder="Division">
					<option value="EMB">Embroidery</option>
					<option value="LAS">Laser</option>
					<option value="SCR">ScreenPrint</option>
					<option value="VIN">Vinyl</option>
				</form:select>
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<form:input type="password" path="password"  class="form-control" placeholder=""/>
			<form:errors path="lastName" class="text-danger text-center"/>
		</div>
		<div class="form-group">
			<label for="password2">Confirm Password</label>
			<form:input type="password" path="password2"  class="form-control" placeholder=""/>
			<form:errors path="password2" class="text-danger text-center"/>
		</div>
    <button class="btn btn-md btn-info btn-block" type="submit">Register</button>
<!--   <p class="mt-5 mb-3 text-muted">© 2017-2020</p> -->
</form:form>
</div>


<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>