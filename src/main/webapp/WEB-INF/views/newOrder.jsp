<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Order</title>
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
    <form:form class="form-signin" action="newOrder" modelAttribute="orders" method="post">
		<img class="mb-4" src="static/images/SEW Logo.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">New Order</h1>
		<div class="form-row row">
			<div class="form-group col">		
				<label for="customerName">Customer Name</label>
				<form:input type="text" path="customerName"  class="form-control" placeholder="Customer"/>
			</div>
		</div>
		<div class="form-group">
			<label for="requestedDate">Date Requested</label>
			<form:input type="text" path="requestedDate"  class="form-control" placeholder="Requested Date (MM/DD/YY)"/>
			
		</div>
		<div class="form-row row">
			<div class="form-group col">
				<label for="div1">Primary Division</label>
				<form:select path="div1" name="div1" class="form-control" placeholder="Primary Division">
					<option value=""></option>
					<option value="EMB">Embroidery</option>
					<option value="LAS">Laser</option>
					<option value="SCR">ScreenPrint</option>
					<option value="VIN">Vinyl</option>
				</form:select>
			</div>
			<div class="form-group col">
				<label for="div2">Secondary Division</label>
				<form:select path="div2" name="div2"  class="form-control" placeholder="Secondary Division">
					<option value=""></option>
					<option value="EMB">Embroidery</option>
					<option value="LAS">Laser</option>
					<option value="SCR">ScreenPrint</option>
					<option value="VIN">Vinyl</option>
				</form:select>
			</div>
			<div class="form-group col">
				<label for="div3">Additional Division</label>
				<form:select path="div3" name="div3" class="form-control" placeholder="Secondary Division">
					<option value=""></option>
					<option value="EMB">Embroidery</option>
					<option value="LAS">Laser</option>
					<option value="SCR">ScreenPrint</option>
					<option value="VIN">Vinyl</option>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<form:textarea path="description" name="description" class="form-control" placeholder="Order description."></form:textarea>
		</div>
		<div class="form-group">
			<label for="priority">Order Priority</label>
				<form:select path="priority" name="priority" class="form-control" placeholder="Priority">
					<option value="HIGH">HIGH</option>
					<option value="MEDIUM">MEDIUM</option>
					<option value="LOW">LOW</option>
					<option value="NEW">NEW</option>
				</form:select>
		</div>
    <button class="btn btn-md btn-info btn-block" type="submit">Create Order</button>
<!--   <p class="mt-5 mb-3 text-muted">© 2017-2020</p> -->
	</form:form>
</div>


<jsp:include page="components/footer.jsp"></jsp:include>

<script>
$(document).on("click", ".open-AddBookDialog", function () {
    var myOrderId = $(this).data('id');
    $(".modal-body #orderId").val( myOrderId );
   $('#addBookDialog').modal('show');
});
</script>
</body>
</html>