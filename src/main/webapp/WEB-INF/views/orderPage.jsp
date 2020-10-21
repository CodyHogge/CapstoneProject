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
		<div class="col-lg-20 text-center ">
			<h3 class="text-success text-center">Order information: ${order_info.orderId} 
				<!-- <a href="#" data-toggle="modal" data-target="#edits" title="Update my information"> 
					<i class="fa fa-pencil"></i>
				</a> -->
			</h3>
	<div class="row justify-content-center">
		<div class="card-deck">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Order Info:</h5>
					<h6 class="card-subtitle mb-2 text-muted">OrderId: ${order_info.orderId}</h6>
						<table class="table table-bordered">
							<tr>
								<td>
									Requested Date: ${order_info.requestedDate}
								</td>
								<td>
									Priority: 
										<c:if test="${order_info.priority eq 'HIGH'}"><span class="text-danger"><strong>${order_info.priority}</strong></span></c:if>
										<c:if test="${order_info.priority eq 'MEDIUM'}"><span class="text-warning"><strong>${order_info.priority}</strong></span></c:if>
										<c:if test="${order_info.priority eq 'LOW'}"><span class="text-success"><strong>${order_info.priority}</strong></span></c:if>
										<c:if test="${order_info.priority eq 'NEW'}"><span class="text-info"><strong>${order_info.priority}</strong></span></c:if>
								</td>
							</tr>
							<tr>
								<td>
									Last Update: ${order_info.updatedDate} by <span class="text-info"><strong>${order_info.userId}</strong></span>
								</td>
								<td>          							
          							<form method="POST" action="editOrderStatus">
										<input type="hidden" name="orderId"	value="${order_info.orderId}" />
										<select onchange="this.form.submit()" name="status" class="form-control">
											<option value="${order_info.status}">${order_info.status}</option>
											<option value="NEW">New</option>
											<option value="ACCEPTED">Accepted</option>
											<option value="WORKING">Working</option>
											<option value="ON-HOLD">On Hold</option>
											<option value="PAYMENT">Payment</option>
											<option value="PAID">Paid</option>
											<option value="SHIPPING">Shipping</option>
											<option value="COMPLETE">Complete</option>
										</select>
									</form>          								
          						</td>
          					</tr>
          					<tr>
          						<td>
          							${order_info.div1}, 
          							<c:if test="${order_info.div2 ne null}">${order_info.div2}, </c:if>
          							<c:if test="${order_info.div3 ne null}">${order_info.div3}</c:if>
          						</td>
          						<td>
          							Division accept date: ${order_info.divAcceptedDate}
          						</td>
          					</tr>
						</table>
					<h5>Order Description</h5>	
					<p>${order_info.description}</p>				
				</div>
			</div>
			
			
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Customer Info</h5>
					<h6 class="card-subtitle mb-2 text-danger">${customer_error}</h6>
					<h6 class="card-subtitle mb-2 text-muted">CustomerId: ${customer_info.customerId}</h6>
						<table class="table table-bordered">
							<tr>
								<td>
									Customer Name: ${customer_info.firstName} ${customer_info.lastName}
								</td>
								<td>
									Priority: 
										<c:if test="${customer_info.priority eq 'HIGH'}"><span class="text-danger"><strong>${customer_info.priority}</strong></span></c:if>
										<c:if test="${customer_info.priority eq 'MEDIUM'}"><span class="text-warning"><strong>${customer_info.priority}</strong></span></c:if>
										<c:if test="${customer_info.priority eq 'LOW'}"><span class="text-success"><strong>${customer_info.priority}</strong></span></c:if>
										<c:if test="${customer_info.priority eq 'NEW'}"><span class="text-info"><strong>${customer_info.priority}</strong></span></c:if>
								</td>
							</tr>
							<tr>
								<td>
									Company: ${customer_info.company}
								</td>
							</tr>
							<tr>
								<td>
									Email: ${customer_info.email}
								</td>
								<td>
									Phone: ${customer_info.phone}
								</td>
							</tr>									
						</table>
				</div>
			</div>
		</div>
	</div>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Log</h5>					
					<p class="card-text">${order_info.log}</p>				
				</div>
			</div>




		</div>
	</div>
	
	<%-- <!-- MODAL BEGIN -->
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
	<!-- MODAL END --> --%>
	
	
<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>