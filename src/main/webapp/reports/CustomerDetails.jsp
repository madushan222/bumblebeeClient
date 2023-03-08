
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
<%@page import="shanlk.User"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->

        <title>Customer Details Report</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Customer Details Report</strong></h3></center>
            </div>
            <hr>
            <a href="#" id="create_excel" name="create_excel"><i class="fa fa-file-excel-o nav_icon"></i></a>
<table class="table table-bordered" id="table">
                <thead>
                    <tr><th colspan="6" style="text-align:center">Customer Details Report</th></tr>
                    <tr>
                        <th>Customer Name</th>
                        <th>Date of Birth</th>
                        <th>NIC</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Mobile</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserService_Service user_servcie = new UserService_Service();
                        UserService proxy = user_servcie.getUserServicePort();
                        List<User> users = proxy.getCustomers();
                        int row = 0;
                        for(User user : users){
                        %>
                        <tbody>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <td><%out.println(user.getFName());%> <%out.println(user.getMName());%> <%out.println(user.getLName());%></td>
                            <td><%out.println(user.getDob());%></td>
                            <td><%out.println(user.getNic());%></td>
                            <td><%out.println(user.getAddress1());%> <%out.println(user.getAddress2());%> <%out.println(user.getAddress3());%></td>
                            <td><%out.println(user.getEmail());%></td>
                            <td><%out.println(user.getMobile());%></td>
                        </tr>
                        <%
                            row++;
                            }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
 <script>
    $( function() {
	var tableToExcel = (function() {
		var uri = 'data:application/vnd.ms-excel;base64,'
		, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
		, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
		, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
		return function(table, name, fileName) {
			if (!table.nodeType) table = document.getElementById(table)
			var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}

			var link = document.createElement("A");
			link.href = uri + base64(format(template, ctx));
			link.download = fileName || 'Workbook.xls';
			link.target = '_blank';
			document.body.appendChild(link);
			link.click();
			document.body.removeChild(link);
		}
	})();

	$('#create_excel').click(function(){
		tableToExcel('table', 'Customer Detail Report', 'customer_details_report.xls');
	});
});
</script>
