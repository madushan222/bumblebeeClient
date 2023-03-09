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
<%@page import="shanlk.LoanShedule"%>
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

        <title>Loan Schedule</title>
    </head>
    <body>
        <jsp:include page="../includes/customerSidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Loan Schedule</strong></h3></center>
            </div>
            <hr>
            <table class="table table table-bordered">
                <thead>
                    <tr>
                        <th>Installment</th>
                        <th>Due Amount</th>
                        <th>Due Date</th>
                        <th>Paid Amount</th>
                        <th>Paid Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                        LoanService_Service loan_service = new LoanService_Service();
                        LoanService proxy = loan_service.getLoanServicePort();
                        List<LoanShedule> shedules = proxy.getLoanShedule(Integer.parseInt(request.getParameter("loanId")));
                        int row = 0;
                        int c = 1;
                        for(LoanShedule shedule : shedules){%>
                        <tbody>
                            <tr <%if(c%2 == 0){%> class="info" <%}%>>
                                <td><%out.println(c);%></td>
                                <td><%out.println(shedule.getInsAmount());%></td>
                                <td><%out.println(shedule.getDueDate());%></td>
                                <td><%out.println(shedule.getPaidAmount());%></td>
                                <td><%out.println(shedule.getPayDate());%></td>
                                <td><%out.println(shedule.getStatus());%></td>
                            </tr>
                        <%c++;}
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