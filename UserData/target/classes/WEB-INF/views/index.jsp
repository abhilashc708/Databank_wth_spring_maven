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

<body class="body-Login-back">
 <c:url var="action" value="/admin/auth"></c:url>
    <div class="container">
        <form:form class="form-signin" method="post" action="${action}" commandName="adminData">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center logo-margin ">
        <B> <I>  <font color="white" face="times new roman"><h1><marquee>J-COMPANY</marquee></h1> </font></I></B>
                </div>
            
            <div class="col-md-4 col-md-offset-4">
            
            <!-- error message start-->
         <c:forEach items="${error}" var="msg">
                 <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
             <c:forEach items="${success}" var="msg">
                 <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
             <c:forEach items="${war}" var="msg">
                 <div class="alert alert-warning alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
            </c:forEach>
            
             <!-- error message end-->
             
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                 <form:input placeholder="User Name" path="adminName" type="text" class="form-control" required="true" autocomplete="off"/>
                                </div>
                                <div class="form-group">
                                 <form:input placeholder="Password" path="adminPass" type="password" class="form-control" required="true" />
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                  <input type="submit"class="btn btn-lg btn-success btn-block" value="Login"/>
                       </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </form:form>
        
    </div>

     <!-- Core Scripts - Include with every page -->
      <script type="text/javascript" src="<c:url value="/resource/assets/plugins/jquery-1.10.2.js" />"></script>
     <script type="text/javascript" src="<c:url value="/resource/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
     <script type="text/javascript" src="<c:url value="/resource/assets/plugins/metisMenu/jquery.metisMenu.js" />"></script>
</body>

</html>