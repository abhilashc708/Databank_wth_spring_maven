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
     <link href="<c:url value="/resource/assets/plugins/morris/morris-0.4.3.min.css"/>" type="text/css" rel="stylesheet">
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
                   <B> <I>  <font color="white" face="times new roman"><h1><marquee>J-COMPANY</marquee></h1> </font></I></B>
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
                                <div><strong><font color="yellow" face="times new roman"><i><b>${admin.adminName }</b></i></font></strong></div>
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
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    <li class="selected">
                        <spring:url value="/admin/home" var="list"/>
                       <a href="${list}"><i class="fa fa-dashboard fa-fw"></i>Home</a>
                    </li>
                    <li>
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
                <!-- Page Header -->
                <div class="col-lg-12">
                 <h3 class="page-header"> '${admin.adminName }' welcome to  Dashboard</h3>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome Back <b>${admin.adminName } </b>
 <i class="fa  fa-pencil"></i>.
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-calendar fa-3x"></i>&nbsp;<b>20 </b>Meetings Sheduled This Month

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa  fa-beer fa-3x"></i>&nbsp;<b>27 % </b>Profit Recorded in This Month  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-rss fa-3x"></i>&nbsp;<b>1,900</b> New Subscribers This Year

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b>2,000 $ </b>Payment Dues For Rejected Items
                    </div>
                </div>
                <!--end quick info section -->
            </div>
      <div class="row">
                <!--quick info section -->
                  <div class="col-lg-6">
                <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body yellow">
                            <i class="fa fa-bar-chart-o fa-3x"></i>
                            <h3>20,741 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Daily User Visits
                            </span>
                        </div>
                    </div>
                    </div>
                     <div class="col-lg-6">
                <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body red">
                            <i class="fa fa-thumbs-up fa-3x"></i>
                            <h3>2,700 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">New User Registered
                            </span>
                        </div>
                        </div>
                    </div>
                <!--end quick info section -->
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
     <script type="text/javascript" src="<c:url value="/resource/assets/plugins/morris/raphael-2.1.0.min.js" />"></script>
     <script type="text/javascript" src="<c:url value="/resource/assets/plugins/morris/morris.js" />"></script>
     <script type="text/javascript" src="<c:url value="/resource/assets/scripts/dashboard-demo.js" />"></script>
</body>

</html>
