<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${role ne 'ADMIN'}">
	<c:redirect url="/profile" />
</c:if>
<c:set var="page" value="Admin"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - User List</title>
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
          <li class="nav-item">
            <a class="nav-link active" href="admin_dashboard">
              <span data-feather="home"></span>
              Admin Dashboard 
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="orderList">
              <span data-feather="file"></span>
              Orders
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="customerList">
              <span data-feather="users"></span>
              Customers
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="empList">
              <span data-feather="users"></span>
              Employees <span class="sr-only">(current)</span>
            </a>
          </li>
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
        <h1 class="h2">Administrator Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <!-- <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button> -->
        </div>
      </div>

<%--       <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> --%>
		<h6>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="btn btn-success" href="#" data-toggle="modal" data-target="#addUser2" title="Add new user"><i class="fa fa-user-plus" aria-hidden="true"> New User</i></a>
	        </li>
			<li class="nav-item text-right">
		      <form class="form-inline" action="searchUser" method="post">
			    <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search">
			    <button class="btn btn-success" type="submit">Search</button>
			  </form>
		    </li>
		    <li class="text-muted"> Search employees by: Username, First/Last Name, or Updating User</li>
	        <li>	        
	        <li>
	        <span class="text-success"><strong>${success}</strong></span>
	        <span class="danger"><strong>${error}</strong></span>
	        </li>
		</ul>
		</h6>
		<h2>Employee List</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>UserID</th>
              <th>Name</th>
              <!-- <th>Email</th> -->
              <th>Username</th>
              <th>Role</th>
              <th>Division</th>
              <th>Reset Password</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="user" items="${list}">
				<tr class="text-body">
					<td>${user.userId}.</td>
					<td>${user.firstName} ${user.lastName}</td>
					<%-- <td>${user.email}</td> --%>
					<td>${user.username}</td>
					<td>
						<form method="POST" action="editrole">
							<input type="hidden" name="userId" value="${user.userId}" /> <select
									onchange="this.form.submit()" name="role" class="form-control">
								<option value="${user.role}">${user.role}</option>
								<option value="USER">USER</option>
								<option value="ADMIN">ADMIN</option>
							</select>
						</form>
					</td>
					<td>
						<form method="POST" action="editdivision">
							<input type="hidden" name="userId" value="${user.userId}" /> <select
									onchange="this.form.submit()" name="division" class="form-control">
								<option value="${user.division}">${user.division}</option>
								<option value="ADMIN">Administrator</option>
								<option value="EMB">Embroidery</option>
								<option value="LAS">Laser</option>
								<option value="VIN">Vinyl</option>
								<option value="SCR">Screen Printing</option>
							</select>
						</form>
					</td>
					<td>
						<a href="resetpassword?id=${user.userId}" onclick="confirmed2(); return false;" title="Reset password for ${user.firstName} ${user.lastName}?"
						class="btn btn-warning"> <i class="fa fa-unlock-alt" aria-hiddem="true"></i></a>
					</td>					
					<td>
						<a href="removeuser?userId=${user.userId}" onclick="confirmed(); return false;" title="Delete member ${user.firstName} ${user.lastName}"
						class="btn btn-danger"> <i class="fa fa-trash"></i></a>
					</td>
				<!-- <td><a href="#" data-toggle="modal" data-target="#edits"> <i class="fa fa-pencil"></i>
              </a></td> -->
				
				</tr>
			</c:forEach>
            
          </tbody>
        </table>
      </div>
      
    </main>
  </div>
</div>


<!-- MODAL BEGIN -->
	<div class="modal fade" id="addUser2">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-">Add User</h5>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria- hidden="true">×</span>
					</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form:form action="addUser2" modelAttribute="user" method="post">
						<div class="form-group">
							<label for="firstName">First Name</label>
							<form:input type="text" path="firstName" class="form-control" placeholder="First Name" />
							<form:errors path="firstName" class="text-danger text-center"/>
						</div>
						<div class="form-group">
							<label for="lastName">Last Name</label>
							<form:input path="lastName" class="form-control" placeholder="Last Name" />
							<form:errors path="lastName" class="text-danger text-center"/>
						</div>
						<div class="form-group">
							<label for="username">Username</label>
							<form:input path="username" class="form-control" placeholder="Username" />
							<form:errors path="username" class="text-danger text-center"/>
						</div>
						<%-- <div class="form-group">
							<label for="email">Email Address</label>
							<form:input type="email" path="email" class="form-control"
								placeholder="Email Address" />
							<form:errors path="email" class="text-danger text-center" />
						</div> --%>
						<div class="form-group">
							<label for="division">Division</label>
							<form:select path="division" name="division" class="form-control"
								placeholder="Division">
								<option value="EMB">Embroidery</option>
								<option value="LAS">Laser</option>
								<option value="SCR">ScreenPrint</option>
								<option value="VIN">Vinyl</option>
							</form:select>
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<form:input type="password" path="password" class="form-control" placeholder="New Password" />
							<form:errors path="password" class="text-danger text-center"/>
						</div>
						<div class="form-group">
							<label for="password2">Confirm Password</label>
							<form:input type="password" path="password2" class="form-control" placeholder="Confirm Password" />
							<form:errors path="password2" class="text-danger text-center"/>
						</div>
						<div>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-user"></i> Add User
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
<script>
function confirmed2(){
    if (confirm('You are about to reset, Do you want to proceed?')) {
          document.getElementById("del").submit();
          return true;
    } else {
       return false;
    }
 }
</script>
</body>
</html>