<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
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


<div class="text-center col-5 align-items-center mx-auto">
    <form:form class="form-signin" action="newCustomer" modelAttribute="customers" method="post">
		<img class="mb-4" src="static/images/SEW Logo.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Customer Registration</h1>
		<div class="form-row row">
			<div class="form-group col">		
				<label for="firstName">First Name</label>
				<form:input type="text" path="firstName"  class="form-control" placeholder="First Name"/>
				<form:errors path="firstName" class="text-danger text-center"/>
			</div>
			<div class="form-group col">
				<label for="lastName">Last Name</label>
				<form:input type="text" path="lastName"  class="form-control" placeholder="Last Name"/>
				<form:errors path="lastName" class="text-danger text-center"/>
			</div>
		</div>
		<div class="form-group">
			<label for="company">Company Name</label>
			<form:input type="text" path="company"  class="form-control" placeholder="Company Name"/>
			<form:errors path="firstName" class="text-danger text-center"/>
		</div>
		<div class="form-row row">
			<div class="form-group col">
				<label for="email">Email Address</label>
				<form:input type="email" path="email"  class="form-control" placeholder="Email Address"/>
				<form:errors path="email" class="text-danger text-center"/>
			</div>
			<div class="form-group col">
				<label for="phone">Phone Number</label>
				<form:input type="text" path="phone"  class="form-control" placeholder="Phone Number"/>
				<form:errors path="phone" class="text-danger text-center"/>
			</div>
		</div>
		<div class="form-group">
			<label for="priority">Customer Priority</label>
				<form:select path="priority" name="priority" class="form-control" placeholder="Priority">
					<option value="HIGH">HIGH</option>
					<option value="MEDIUM">MEDIUM</option>
					<option value="LOW">LOW</option>
					<option value="NEW">NEW</option>
				</form:select>
		</div>
    <button class="btn btn-md btn-info btn-block" type="submit">Save Customer</button>
<!--   <p class="mt-5 mb-3 text-muted">© 2017-2020</p> -->
	</form:form>
</div>


<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>