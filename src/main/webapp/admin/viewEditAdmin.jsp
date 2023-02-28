<%-- 
    Document   : addAdmin
    Created on : 12 Sept 2022, 13:25:13
    Author     : shanr
--%>
<%
if(session.getAttribute("userType") == null || session.getAttribute("userType").equals(""))
{   
     response.sendRedirect("../index.jsp");
}
%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%@page import="shanlk.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->
        <title>Add Admin</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <% String action = request.getParameter("action");
           String heading = "";
            if(action.equals("VIEW"))
                heading = "View Admin";
            else if(action.equals("EDIT"))
                heading = "Edit Admin";
        %>
        <div class="main">
            <div class="form-title">
                <center><h3><strong><%out.println(heading);%></strong></h3></center>
            </div>
            <hr>
             <%
                    UserService_Service user_service = new UserService_Service();
                    UserService proxy = user_service.getUserServicePort();
                    User admin = proxy.getAdmin(Integer.parseInt(request.getParameter("userId")));
                    
             %>
              <form action="editAdmin.jsp?userId=<%out.println(request.getParameter("userId"));%>" method="POST">
                <div class="form-group">
                    <label for="fName">First Name:</label>
                    <input type="text" class="form-control" id="fName" name="fName" value="<%out.println(admin.getFName());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="lName">Middle Name:</label>
                    <input type="text" class="form-control" id="mName" name="mName" value="<%out.println(admin.getMName());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="lName">Last Name:</label>
                    <input type="text" class="form-control" id="lName" name="lName" value="<%out.println(admin.getLName());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="nic">NIC:</label>
                    <input type="text" class="form-control" id="nic" name="nic" value="<%out.println(admin.getNic());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="dob">DOB</label>
                    <input type="text" class="form-control" id="dob" name="dob" value="<%out.println(admin.getDob());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" onchange="check_age(this.value)" required>
                <p id="dob_error" style="color:red"></p>
                </div>
                <div class="form-group">
                    <label for="address1">Address Line 1:</label>
                    <input type="text" class="form-control" id="address1" name="address1" value="<%out.println(admin.getAddress1());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="address2">Address Line 2:</label>
                    <input type="text" class="form-control" id="address2" name="address2" value="<%out.println(admin.getAddress2());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="address2">Address Line 3:</label>
                    <input type="text" class="form-control" id="address3" name="address3" value="<%out.println(admin.getAddress3());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" value="<%out.println(admin.getMobile());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%out.println(admin.getEmail());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required> 
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%out.println(admin.getUsername());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required> 
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" value="<%out.println(admin.getPassword());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required> 
                </div>
                <%if(action.equals("EDIT")){%>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                <%}%>
                </form> 
            <hr>
        </div>
    </body>
</html>

<!--<script
type="text/javascript"
charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"
></script>
<script
type="text/javascript"
charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
$(function() {
$("#table_id").dataTable();
});
</script>-->