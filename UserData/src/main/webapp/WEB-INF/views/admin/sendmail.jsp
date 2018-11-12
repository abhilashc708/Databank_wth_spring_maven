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
  <c:url var="action" value="/admin/sendsinglemail"></c:url>
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
                       
                      <li>
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
                     <li class="selected">
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
                        <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>  Team Members<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Register</a>
                            </li>
                            <li>
                                <a href="morris.html">View</a>
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
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header"> <i>Mail To Single</i></h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <!-- Form Elements -->
                    <form:form class="form-signin" method="post" action="${action}" modelAttribute="userData">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <i><b><marquee>Send Mail To Single customer</marquee></b></i>
                        </div>
                        
                        <c:forEach items="${success}" var="msg">
                 <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
                            </c:forEach>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <form role="form">
                                         <div class="form-group">
                                            <label>To Address</label>
                                            <select class="form-control" name="to" required>
                                            <option value="">select</option>
                                                   <c:if test="${!empty useremailList}">
                                                     <c:forEach items="${useremailList}" var="user">
                                                     <option value="${user.email }" label="${user.email }"/>
                                                     </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>Subject</label>
                                           <input placeholder="Subject" type="text"  name="subject"  class="form-control"  required="true" pattern="[a-zA-Z]+" title="please enter valid format (Eg:abc)" autocomplete="off"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Text Message</label>
                                            <textarea  placeholder="Enter Message"  name="message"  class="form-control" rows="6" required></textarea>
                                        </div>
                
                                     <input type="submit" class="btn btn-primary" value="Send"/>
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
     <script type="text/javascript" src="<c:url value="/resource/assets/scripts/siminta.js" />"></script>
</body>

</html>
