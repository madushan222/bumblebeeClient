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
<%@page import="shanlk.LoanService"%>
<%@page import="shanlk.LoanService_Service"%>
<%@page import="shanlk.Loan"%>
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

        <title>Loan List</title>
    </head>
    <body>
        <jsp:include page="../includes/customerSidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Loan List</strong></h3></center>
            </div>
            <hr>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Loan Amount</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                        Integer uid=(Integer)session.getAttribute("userID");  
                        LoanService_Service loan_service = new LoanService_Service();
                        LoanService proxy = loan_service.getLoanServicePort();
                        List<Loan> loans = proxy.getLoans(uid);
                        int row = 0;
                        for(Loan loan : loans){%>
                        <tbody>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <td><%out.println(loan.getProductName());%></td>
                            <td><%out.println(loan.getLoanAmount());%></td>
                            <td><%out.println(loan.getStartDate());%></td>
                            <td><%out.println(loan.getEndDate());%></td>
                            <td><%out.println(loan.getStatus());%></td>
                            <td><a href="loanShedule.jsp?loanId=<%out.println(loan.getLoanId());%>" title="View Loan Shedule"><i class="fa fa-list" style="color:green;"></i></a></td>
                        </tr>
                        <%row++;}
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