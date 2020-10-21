<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:set var="page" value="CustomerList"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order List</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
  <script src="dashboard.js"></script>

  <!-- font awesome -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
 	
</head>
<body>
<jsp:include page="components/header.jsp"/>
<br>



<div class="container-fluid mt-4">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
        <c:if test="${role eq 'ADMIN'}">
          <li class="nav-item">
            <a class="nav-link active" href="admin_dashboard">
              <span data-feather="home"></span>
              Admin Dashboard 
            </a>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link" href="orderList">
              <span data-feather="file"></span>
              Orders <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="customerList">
              <span data-feather="users"></span>
              Customers
            </a>
          </li>
          <c:if test="${role eq 'ADMIN'}">
          <li class="nav-item">
            <a class="nav-link" href="empList">
              <span data-feather="users"></span>
              Employees 
            </a>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link" href="orderArchive">
              <span data-feather="users"></span>
              Order Archive
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="embroidery">
              <span data-feather="layers"></span>
              Embroidery
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="laser">
              <span data-feather="layers"></span>
              Laser
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="screenprint">
              <span data-feather="layers"></span>
              Screen Print
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="vinyl">
              <span data-feather="layers"></span>
              Vinyl
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <!-- <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul> -->
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Order List</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>

<%--       <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> --%>
		<h6>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="btn btn-success" href="#" data-toggle="modal" data-target="#addOrder2" title="Add new order"><i class="fa fa-user-plus" aria-hidden="true"> New Order</i></a>
	        </li>
	        <li class="nav-item text-right">
		      <form class="form-inline" action="searchOrder" method="post">
			    <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search">
			    <button class="btn btn-success" type="submit">Search</button>
			  </form>
		    </li>
		    <li class="text-muted"> Search orders by: Customer Name, OrderId, or Updating User</li>
	        <li>
	        <span class="text-success"><strong>${success}</strong></span>
	        <span class="danger"><strong>${error}</strong></span>
	        </li>
		</ul>
		</h6>
		<h2>Order List</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>OrderID</th>
              <th>Customer Name</th>
              <th>Priority</th>
              <th>Divisions</th>
              <th>Requested Date</th>
              <th>Status</th>
              <th>Date Updated</th>
              <th>User Updated</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="order" items="${orderList}">
				<tr class="text-body">
					<td><a href="orderPage?orderId=${order.orderId}">${order.orderId}</a></td>
					<td>${order.customerName}</td>
					<td>
						<form method="POST" action="editOrderPriority">
							<input type="hidden" name="orderId" value="${order.orderId}" /> 
							<select onchange="this.form.submit()" name="priority" class="form-control">
								<option value="${order.priority}">${order.priority}</option>
								<option value="HIGH">HIGH</option>
								<option value="MEDIUM">MEDIUM</option>
								<option value="LOW">LOW</option>
								<option value="NEW">NEW</option>
							</select>
						</form>
					</td>
					<td>
						${order.div1},
						<c:if test="${order.div2 ne null}"> ${order.div2},</c:if>
						<c:if test="${order.div3 ne null}"> ${order.div3},</c:if>
					</td>
					<td>${order.requestedDate}</td>
					<td>
						<form method="POST" action="editOrderStatus">
							<input type="hidden" name="orderId" value="${order.orderId}" /> <select
									onchange="this.form.submit()" name="status" class="form-control">
								<option value="${order.status}">${order.status}</option>
								<option value="NEW">New</option>
								<option value="ACCEPTED">Accepted</option>
								<option value="WORKING">Working</option>
								<option value="PAYMENT">Payment</option>
								<option value="PAID">Paid</option>
								<option value="SHIPPING">Shipping</option>
								<option value="COMPLETE">Complete</option>
							</select>
						</form>
					</td>
					<td>${order.updatedDate}</td>
					<td>${order.userId}</td>
					<td>
						<a href="removeorder?orderId=${order.orderId}" onclick="confirmed(); return false;" title="Delete Order?"
						class="btn btn-danger"> <i class="fa fa-trash"></i></a>
						
						<a class="open-AddBookDialog btn btn-warning" href="#" data-toggle="modal" data-target="#addOrderNote" title="Add note to order" data-id="${order.orderId}">
						<i class="fa fa-sticky-note-o" aria-hidden="true"></i></a>
					</td>									
				</tr>
			</c:forEach>
            
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>


<jsp:include page="components/footer.jsp"></jsp:include>

<!-- ADD NOTE MODAL BEGIN -->
	<div class="modal fade" id="addOrderNote">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-">Add Note</h5>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria- hidden="true">×</span>
					</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form:form action="addOrderNote" modelAttribute="order" method="post">
						
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Add note here </span>
								<input type="hidden" name="orderId" id="orderId" value=""/>
							</div>
							<form:textarea path="note" class="form-control" aria-label="With textarea"></form:textarea>
						</div>
						<div class="form-row mt-1">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-sticky-note-o" aria-hidden="true"> Add Note</i>
							</button>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="btn btn-danger">Close</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--ADD NOTE MODAL END -->

<script>
$(document).on("click", ".open-AddBookDialog", function () {
    var myOrderId = $(this).data('id');
    $(".modal-body #orderId").val( myOrderId );
   $('#addBookDialog').modal('show');
});
</script>
<script>
function confirmed(){
    if (confirm('You are about to delete, Do you want to proceed?')) {
          document.getElementById("del").submit();
          return true;
    } else {
       return false;
    }
 }
</script>
</body>
</html>