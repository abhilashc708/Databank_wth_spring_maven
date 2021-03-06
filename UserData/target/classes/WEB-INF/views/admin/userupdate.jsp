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
                <B><I><font color="white" face="times new roman"><h1>J-COMPANY</h1> </font></I></B>
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->

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
                        <li>    <li> <spring:url value="/authentication/logout" var="list"/>
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
                       
                            <li >
                        <spring:url value="/admin/home" var="list"/>
                       <a href="${list}"><i class="fa fa-dashboard fa-fw"></i>Home</a>
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
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header"> User Update</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <!-- Form Elements -->
                    <c:url var="action" value="/admin/updates"></c:url>
                    <form:form class="form-signin" method="post" action="${action}" modelAttribute="userData">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         <i><b><marquee>Update User Details </marquee></b></i>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <form role="form">
                                       
                                        <div class="form-group">
                                        <form:hidden path="userdataId"/>
                                         <label>Name*</label>
                                             <form:input  path="userName" type="text" class="form-control" required ="true" pattern="[a-zA-Z]+" title="please enter valid format (Eg:abc)" autocomplete="off"/>
                                        </div>
                                         <div class="form-group">
                                          <label>Guardian Name</label>
                                           <form:input  path="gname" type="text" class="form-control" pattern="[a-zA-Z]+" title="please enter valid format (Eg:abc)" autocomplete="off"/>
                                        </div>

                                        <div class="form-group">
                                           <label>Gender</label>
                                            <form:select class="form-control" path="sex"  >
                                                <form:option  value="">select</form:option>
                                                 <form:option  value="male">Male</form:option>
                                                  <form:option  value="female">Female</form:option>
                                            </form:select>
                                        </div>
                                         <div class="form-group">
                                          <label>Mob</label>
                                              <form:input  path="mob" type="text" class="form-control" required ="true"  pattern="[6789][0-9]{9}" title="please enter valid phone number" autocomplete="off"/>
                                        </div>
                                         <div class="form-group">
                                          <label>Mob1[optional]</label>
                                              <form:input  path="mob1" type="text" class="form-control"  pattern="[6789][0-9]{9}" title="please enter valid phone number" autocomplete="off"/>
                                        </div>
                                         <div class="form-group">
                                          <label>Email</label>
                                              <form:input  path="email" type="email" class="form-control"  autocomplete="off"/>
                                        </div>
                                         <div class="form-group">
                                          <label>Profession</label>
                                              <form:input  path="job" type="text" class="form-control" autocomplete="off"/>
                                        </div>
                                        <div class="form-group">
                                        <label>Address</label>
                                            <form:textarea  class="form-control" rows="3" path="address" autocomplete="off"/>
                                        </div>
                                         <div class="form-group">
                                        <label>Remarks</label>
                                            <form:textarea  class="form-control" rows="3" path="remark" autocomplete="off"/>
                                        </div>
                
                                     <input type="submit" class="btn btn-primary" value="Submit"/>
                                      <input type="reset" class="btn btn-success" value="Reset"/>
                                    </form>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    </form:form>
                     <!-- End Form Elements -->
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
<%--      <script type="text/javascript" src="<c:url value="/resource/assets/scripts/siminta.js" />"></script> --%>
</body>

</html>
