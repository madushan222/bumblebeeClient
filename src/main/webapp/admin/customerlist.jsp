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

        <title>Customer List</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Customer List</strong></h3></center>
            </div>
            <hr>
            <table class="table">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Full Name</th>
                        <th>DOB</th>
                        <th>NIC</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Loan Balance</th>
                        <th>Used Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserService_Service user_service = new UserService_Service();
                        UserService proxy = user_service.getUserServicePort();
                        List<User> customers = proxy.getCustomers();
                        int row = 0;
                        for(User cus : customers){%>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <tbody>
                            <td><%out.println(cus.getUserId());%></td>
                            <td><%out.println(cus.getFName());%> <%out.println(cus.getMName());%> <%out.println(cus.getLName());%></td>
                            <td><%out.println(cus.getDob());%></td>
                            <td><%out.println(cus.getNic());%></td>
                            <td><%out.println(cus.getAddress1());%> <%out.println(cus.getAddress2());%> <%out.println(cus.getAddress3());%></td>
                            <td><%out.println(cus.getMobile());%></td>
                            <td><%out.println(cus.getEmail());%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a href="viewEditAdmin.jsp?action=VIEW&userId=<%out.println(cus.getUserId());%>" title="View"><i class="fa fa-eye" style="color:green;"></i></a></td>
                            <td><%%><a href="viewEditAdmin.jsp?action=EDIT&userId=<%out.println(cus.getUserId());%>" title="Edit"><i class="fa fa-pencil"></i></a></td>
                            <td><a href="../common/deleteUser.jsp?userType=A&userId=<%out.println(cus.getUserId());%>" title="Delete"><i class="fa fa-trash" style="color:red;"></i></a></td>
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