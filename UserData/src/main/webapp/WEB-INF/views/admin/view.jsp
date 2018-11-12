<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Online Data Bank</title>
    <!-- Core CSS - Include with every page -->
      <link href="<c:url value="/resource/assets/plugins/bootstrap/bootstrap.css"/>" type="text/css" rel="stylesheet">
      <link href="<c:url value="/resource/assets/font-awesome/css/font-awesome.css"/>" type="text/css" rel="stylesheet">
      <link href="<c:url value="/resource/assets/plugins/pace/pace-theme-big-counter.css"/>" type="text/css" rel="stylesheet">
      <link href="<c:url value="/resource/assets/css/style.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/resource/assets/css/main-style.css"/>" type="text/css" rel="stylesheet">

    <!-- Page-Level CSS -->
      <link href="<c:url value="/resource/assets/plugins/dataTables/dataTables.bootstrap.css"/>" type="text/css" rel="stylesheet">

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                 <B> <I>  <font color="white" face="times new roman"><h1>J-COMPANY</h1> </font></I></B>
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                         <li> <spring:url value="/authentication/logout" var="list"/>
                        <a href="${list}"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                  <img src="<c:url value="/resource/assets/img/user.jpg "/>" alt=""/>
                            </div>
                            <div class="user-info">
                               <div> <strong>${admin.adminName }</strong></div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
                            <span class="input-group-btn">

                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    
                   <li>
                        <spring:url value="/admin/home" var="list"/>
                       <a href="${list}"><i class="fa fa-dashboard fa-fw"></i>Home</a>
                    </li>
                    <li class="selected">
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Data Bank<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                             <spring:url value="/admin/adddata" var="list"/>
                               <a href="${list}">Insert</a>
                            </li>
                            <li>
                             <spring:url value="/admin/view" var="list"/>
                               <a href="${list}">View</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Send Mail<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                             <spring:url value="/admin/sendmail" var="list"/>
                               <a href="${list}">Send Single user</a>
                            </li>
                            <li>
                             <spring:url value="/admin/sendmultimail" var="list"/>
                               <a href="${list}">Send All User</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                        <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Team Members<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                 <spring:url value="/admin/addmember" var="list"/>
                               <a href="${list}">Add New Members</a>
                            </li>
                            <li>
                                  <spring:url value="/admin/memberview" var="list"/>
                               <a href="${list}">Members View</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
        
                
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">All User Data</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <i><b><marquee>View All User Data</marquee></b></i>
                             <!-- success message start-->
         <c:forEach items="${successinsert}" var="msg">
                 <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
             <!-- success message end-->
               <!-- success message start-->
         <c:forEach items="${successdelete}" var="msg">
                 <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
             <!-- success message end-->
             <!-- success message start-->
         <c:forEach items="${successupdate}" var="msg">
                 <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
             <!-- success message end-->
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <c:if test="${!empty userList}">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Guardian Name</th>
                                            <th>Gender</th>
                                            <th>Mobile</th>
                                            <th>Mobile2</th>
                                            <th>E-mail</th>
                                            <th>Address</th>
                                            <th>Profession</th>
                                            <th>Remark</th>    
                                           <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                     <c:forEach items="${userList}" var="user">
                                    <tbody>
                                        <tr class="odd gradeX">
                                        <td><c:out value="${user.userName }"/></td>
                                        <td><c:out value="${user.gname }"/></td>
                                        <td><c:out value="${user.sex }"/></td>
                                        <td><c:out value="${user.mob }"/></td>
                                         <td><c:out value="${user.mob1 }"/></td>
                                        <td><c:out value="${user.email }"/></td>
                                        <td><c:out value="${user.address }"/></td>
                                        <td><c:out value="${user.job }"/></td>
                                         <td><c:out value="${user.remark }"/></td>
                                        
                           
                                        
                                     <td> 
                                        <a href="<c:url value='/user/update/${user.userdataId}' />"> 
						                <button type="button" class="btn btn-info btn-circle"><i class="fa fa-check"></i>
                                         </button>
						             
						             </a>
                      	               </td>
						           <td>
						            <a href="<c:url value='/user/delete/${user.userdataId}' />"> 
						            <button type="submit" class="btn btn-warning btn-circle" onclick="if (!confirm('Are You Sure Want to Delete?')) { return false }"><i class="fa fa-times"></i>
                                      </button>
                             </a>
						           </td> 
                                        </tr>
                                        
                                    </tbody>
                                     </c:forEach>
                                </table>
                                </c:if>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

      
        </div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script type="text/javascript" src="<c:url value="/resource/assets/plugins/jquery-1.10.2.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/assets/plugins/metisMenu/jquery.metisMenu.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/assets/plugins/pace/pace.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/assets/scripts/siminta.js" />"></script>
    <!-- Page-Level Plugin Scripts-->
  <%--   <script type="text/javascript" src="<c:url value="/resource/assets/plugins/dataTables/jquery.dataTables.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/assets/plugins/dataTables/dataTables.bootstrap.js" />"></script> --%>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
    
    <script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, td1, td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("dataTables-example");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    td1 = tr[i].getElementsByTagName("td")[0];
    td2 = tr[i].getElementsByTagName("td")[5];
    if (td || td1 || td2) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1 || td2.innerHTML.toUpperCase().indexOf(filter) > -1 ) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
</body>

</html>
