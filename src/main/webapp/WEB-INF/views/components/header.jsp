<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark mb-1">
    <!-- <a class="navbar-brand" href="#">Carousel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button> -->
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <!-- <li class="nav-item active">
          <a class="nav-link" href="login">Home <span class="sr-only">(current)</span></a>
        </li> -->
        <c:if test="${!empty loggedInUser}">
        <li class="nav-item active">
          <a class="nav-link" href="newCustomer">New Customer</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="newOrder">New Order</a>
        </li>
        </c:if>
        <!-- <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li> -->
      </ul>
      
      <ul class="navbar-nav">
      <c:choose>
      <c:when test="${empty loggedInUser}">
            <li class="nav-item">
                <a class="nav-link" href="login">Login</a>
            </li>
		</c:when>
		<c:otherwise>
			<li class="nav-item">
                <a class="nav-link" href="profile">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="dash">My Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">Logout</a>
            </li>
            <c:if test="${role eq 'ADMIN'}">
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" href="admin_dashboard">Admin</a> -->
<!--             </li> -->
            <%-- <li class="nav-item text-right">
		      <form class="form-inline" action="search" method="post">
			    <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search">
			    <button class="btn btn-success" type="submit">Search</button>
			  </form>
		    </li> --%>
            </c:if>
		</c:otherwise>
		</c:choose>
        </ul>
    </div>
  </nav>

