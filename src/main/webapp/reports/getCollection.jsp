<%@page import="java.util.List"%>
<%@page import="shanlk.Report"%>
<%@page import="shanlk.Loan"%>
<%@page import="shanlk.ReportService"%>
<%@page import="shanlk.ReportService_Service"%>
<%
     String fromDate = request.getParameter("fromDate");
     String toDate = request.getParameter("toDate");
%>
<a href="#" id="create_excel" name="create_excel"><i class="fa fa-file-excel-o nav_icon"></i></a>
<table class="table table-bordered" id="table">
                <thead>
                    <tr><th colspan="4" style="text-align:center">Collection Report From <%out.println(fromDate);%> To <%out.println(toDate);%></th></tr>
                    <tr>
                        <th>Customer Name</th>
                        <th>Loan Amount</th>
                        <th>Pay Date</th>
                        <th>Pay Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ReportService_Service report_service = new ReportService_Service();
                        ReportService proxy = report_service.getReportServicePort();
                        List<Loan> loans = proxy.getAllLoans();
                        int row = 0;
                        float pay_tot=0;
                        float loan_tot = 0;
                        for(Loan loan : loans){
                            Report collection_data = proxy.getCollectionDateRange(loan.getLoanId(),fromDate,toDate);
                            if(collection_data.getPayAmount()>0)
                            {
                        %>
                        <tbody>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <td><%out.println(loan.getCustomerName());%></td>
                            <td align="right"><%out.println(loan.getLoanAmount());%></td>
                            <td><%out.println(collection_data.getPayDate());%></td>
                            <td align="right"><%out.println(collection_data.getPayAmount());%></td>
                        </tr>
                        <%  loan_tot = loan_tot + Float.parseFloat(loan.getLoanAmount());
                            pay_tot = pay_tot + collection_data.getPayAmount();
                            row++;
                            }}
                    %>
                    <tr>
                        <th>Total</th>
                        <th style="text-align: right"><%out.println(loan_tot);%></th>
                        <th></th>
                        <th style="text-align: right"><%out.println(pay_tot);%></th>
                    </tr>
                </tbody>
            </table>
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
		tableToExcel('table', 'Collection Report', 'collection_report.xls');
	});
});
</script>