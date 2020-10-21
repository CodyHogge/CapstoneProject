<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<!-- font awesome -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>
<body>
<jsp:include page="components/header.jsp" />
<br>

	<div class="container mt-5 justify-content-center">
		<div class="col-lg-10 text-center justify-content-center">
			<h3 class=" text-center">Customer Profile for ${customer_account.firstName} ${customer_account.lastName} 
				<a href="#" data-toggle="modal" data-target="#edits" title="Update my information"> 
					<i class="fa fa-pencil"></i>
				</a>
			</h3>
			<h5 class="text-center text-success">${success}</h5>
			<h5 class="text-center text-danger">${error}</h5>

			<%-- <p>${user_account}</p> --%>

			<table class="table justify-content-center">
				<tr>
					<th>Item</th>
					<th class="text-success">Detail</th>
				</tr>
				<tr>
					<td>First name</td>
					<td class="text-success">${customer_account.firstName}</td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td class="text-success">${customer_account.lastName}</td>
				</tr>
				<tr>
					<td>Company</td>
					<td class="text-success">${customer_account.company}</td>
				</tr>
				<tr>
					<td>Email</td>
					<td class="text-success">${customer_account.email}</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td class="text-success">${customer_account.phone}</td>
				</tr>
				<tr>
					<td><strong>Priority</strong></td>
					<td>
						<c:if test="${customer_account.priority eq 'HIGH'}"><span class="text-danger"><strong>${customer_account.priority}</strong></span></c:if>
						<c:if test="${customer_account.priority eq 'MEDIUM'}"><span class="text-warning"><strong>${customer_account.priority}</strong></span></c:if>
						<c:if test="${customer_account.priority eq 'LOW'}"><span class="text-success"><strong>${customer_account.priority}</strong></span></c:if>
						<c:if test="${customer_account.priority eq 'NEW'}"><span class="text-info"><strong>${customer_account.priority}</strong></span></c:if>
					</td>
				</tr>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- MODAL BEGIN -->
	<div class="modal fade" id="edits">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-">Update Info</h5>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria- hidden="true">×</span>
					</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form:form action="updateCustomerInfo" modelAttribute="customer" method="post">
						<div class="form-row">
							<div class="form-group">
								<label for="firstName">First Name</label>
								<form:input path="firstName" value="${customer_account.firstName}" class="form-control" placeholder="First Name" />
								<form:input type="hidden" path="customerId" value="${customer_account.customerId}" class="form-control" />
							</div>
							<div class="form-group">
								<label for="lastName">Last Name</label>
								<form:input path="lastName" value="${customer_account.lastName}" class="form-control" placeholder="Last Name" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group">
								<label for="company">Company</label>
								<form:input path="company" value="${customer_account.company}" class="form-control" placeholder="Company" />
							</div>
							<div class="form-group">
								<label for="priority">Priority</label>
								<form:select path="priority" class="form-control" placeholder="Company" >
									<option value="${customer_account.priority}">${customer_account.priority}</option>
									<option value="HIGH">HIGH</option>
									<option value="MEDIUM">MEDIUM</option>
									<option value="LOW">LOW</option>
									<option value="NEW">NEW</option>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group">
								<label for="phone">Phone</label>
								<form:input path="phone" class="form-control" placeholder="Phone Number" value="${customer_account.phone}"/>
							</div>
							<div class="form-group">
								<label for="email">Email</label>
								<form:input path="email" class="form-control" placeholder="Confirm Password" value="${customer_account.email}" />
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-user"></i> Save
							</button>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="btn btn-danger">Close</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL END -->
	
	
<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>