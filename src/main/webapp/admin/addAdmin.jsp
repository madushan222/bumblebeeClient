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
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%@page import="shanlk.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script>
            $( function() {
                $( "#dob" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-80:+00",
                    dateFormat: 'yy-mm-dd'
                });
            } );
        </script>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->

        <title>Add Admin</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Admin Registration</strong></h3></center>
            </div>
            <hr>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Admin</button>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Admin</h4>
                  </div>
                  <div class="modal-body">
                    <form action="adminReg.jsp" method="POST">
                        <div class="form-group">
                          <label for="fName">First Name:</label>
                          <input type="text" class="form-control" id="fName" name="fName" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                          <label for="lName">Middle Name:</label>
                          <input type="text" class="form-control" id="mName" name="mName" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                          <label for="lName">Last Name:</label>
                          <input type="text" class="form-control" id="lName" name="lName" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                          <label for="nic">NIC:</label>
                          <input type="text" class="form-control" id="nic" name="nic" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                          <label for="dob">DOB</label>
                          <input type="text" class="form-control" id="dob" name="dob" autocomplete="off" onchange="check_age(this.value)" required>
                          <p id="dob_error" style="color:red"></p>
                        </div>
                         <div class="form-group">
                          <label for="address1">Address Line 1:</label>
                          <input type="text" class="form-control" id="address1" name="address1" autocomplete="off" required>
                        </div>
                         <div class="form-group">
                          <label for="address2">Address Line 2:</label>
                          <input type="text" class="form-control" id="address2" name="address2" autocomplete="off">
                        </div>
                        <div class="form-group">
                          <label for="address2">Address Line 3:</label>
                          <input type="text" class="form-control" id="address3" name="address3" autocomplete="off">
                        </div>
                        <div class="form-group">
                          <label for="mobile">Mobile:</label>
                          <input type="number" class="form-control" id="mobile" name="mobile" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                          <label for="email">Email address:</label>
                          <input type="email" class="form-control" id="email" name="email" autocomplete="off" required> 
                        </div>
                        <div class="form-group">
                          <label for="username">Username:</label>
                          <input type="text" class="form-control" id="username" name="username" autocomplete="off" required> 
                        </div>
                         <div class="form-group">
                          <label for="password">Password:</label>
                          <input type="password" class="form-control" id="password" name="password" autocomplete="off" required> 
                        </div>
                  </div>
                  <div class="modal-footer">
                    <input type="submit" class="btn btn-default" value="Add">
                    <input type="reset" class="btn btn-default" value="Reset">
                  </div>
                    </form> 
                </div>

              </div>
            </div>
            <hr>
            <table class="table">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>DOB</th>
                        <th>NIC</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserService_Service user_service = new UserService_Service();
                        UserService proxy = user_service.getUserServicePort();
                        List<User> admins = proxy.getAdmins();
                        int row = 0;
                        for(User adm : admins){%>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <tbody>
                            <td><%out.println(adm.getUserId());%></td>
                            <td><%out.println(adm.getFName());%> <%out.println(adm.getLName());%></td>
                            <td><%out.println(adm.getDob());%></td>
                            <td><%out.println(adm.getNic());%></td>
                            <td><%out.println(adm.getEmail());%></td>
                            <td><%out.println(adm.getMobile());%></td>
                            <td><a href="../common/deleteUser.jsp?userType=ADMIN&userId=<%out.println(adm.getUserId());%>" title="View"><i class="fa fa-eye" style="color:green;"></i></a></td>
                            <td><%%><a href="editAdmin.jsp?userId=<%out.println(adm.getUserId());%>" title="Edit"><i class="fa fa-pencil"></i></a></td>
                            <td><a href="../common/deleteUser.jsp?userType=ADMIN&userId=<%out.println(adm.getUserId());%>" title="Delete"><i class="fa fa-trash" style="color:red;"></i></a></td>
                            </tbody>
                        </tr>
                        <%}
                    %>
                </tbody>
            </table>
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