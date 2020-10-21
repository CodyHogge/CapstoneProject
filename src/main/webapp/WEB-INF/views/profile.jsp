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

	<div class="container mt-5">
		<div class="col-lg-10 text-center ">
			<h3 class="text-success text-center">${msg} Welcome back ${user_account.firstName} 
				<a href="#" data-toggle="modal" data-target="#edits" title="Update my information"> 
					<i class="fa fa-pencil"></i>
				</a>
			</h3>

			<%-- <p>${user_account}</p> --%>

			<table class="table">
				<tr class="text-success">
					<th>Item</th>
					<th>Detail</th>
				</tr>
				<tr class="text-success">
					<td>First name</td>
					<td>${user_account.firstName}</td>
				</tr>
				<tr class="text-success">
					<td>Last Name</td>
					<td>${user_account.lastName}</td>
				</tr>
				<tr class="text-success">
					<td>Username</td>
					<td>${user_account.username}</td>
				</tr>
				<tr class="text-success">
					<td>Email</td>
					<td>${user_account.email}</td>
				</tr>
				<tr class="text-success">
					<td>Division</td>
					<td>${user_account.division}</td>
				</tr>
				<tr class="text-success">
					<td>Password</td>
					<td>${user_account.password}</td>
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
					<form:form action="updatemyinfo" modelAttribute="user" method="post">
						<div class="form-group">
							<label for="firstName">First Name</label>
							<form:input path="firstName" value="${user_account.firstName}"
								class="form-control" placeholder="First Name" />
							<form:input type="hidden" path="userId" value="${user_account.userId}"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="lastName">Last Name</label>
							<form:input path="lastName" value="${user_account.lastName}"
								class="form-control" placeholder="Last Name" />
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<form:input path="password" 
								class="form-control" placeholder="New Password" value="${user_account.password}"/>
						</div>
						<div class="form-group">
							<label for="password2">Confirm Password</label>
							<form:input path="password2" 
								class="form-control" placeholder="Confirm Password" value="${user_account.password}" />
							<form:errors path="password2" class="text-danger text-center"/>
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