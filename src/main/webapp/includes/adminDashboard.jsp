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
<%@page import="shanlk.Report"%>
<%@page import="shanlk.Loan"%>
<%@page import="shanlk.ReportService"%>
<%@page import="shanlk.ReportService_Service"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ReportService_Service report_service = new ReportService_Service();
    ReportService proxy = report_service.getReportServicePort();
    int tot_products = proxy.getTotalProducts();
    int tot_loans = proxy.getTotalLoans();
    int tot_customers = proxy.getTotalCustomers();
    
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
    DateTimeFormatter year = DateTimeFormatter.ofPattern("yyyy");
    DateTimeFormatter month = DateTimeFormatter.ofPattern("MM");
    DateTimeFormatter date1 = DateTimeFormatter.ofPattern("dd");
    LocalDateTime now = LocalDateTime.now();  
    LocalDateTime newDate = now.minusDays(7);
    
    String dataset = "";
    for (LocalDateTime date = newDate; date.isBefore(now); date = date.plusDays(1)) {
        float tot_collection = proxy.getDayCollection(dtf.format(date));
        dataset = dataset + "{ x: new Date('"+year.format(date)+","+month.format(date)+","+date1.format(date)+"'), y: "+tot_collection+"},";
    }
 
%>
<html>
    <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
window.onload = function () {

var options = {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Collection of Last 07 Days"
	},
	axisX:{
		valueFormatString: "DD MMM"
	},
	axisY: {
		title: "Collection",
	},
	toolTip:{
		shared:true
	},  
	legend:{
		cursor:"pointer",
		verticalAlign: "bottom",
		horizontalAlign: "left",
		dockInsidePlotArea: true,
		itemclick: toogleDataSeries
	},
	data: [{
		type: "line",
		showInLegend: true,
		name: "Total Collection",
		markerType: "square",
		xValueFormatString: "DD MMM, YYYY",
		color: "#F08080",
		yValueFormatString: "#,##0",
		dataPoints: [
			<%out.println(dataset);%>
		]
	},
	]
};
$("#chartContainer").CanvasJSChart(options);

function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	e.chart.render();
}

}
</script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->

        <title>BumbleBee</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <center><h4>BUMBLEBEE: BUY FIRST AND PAY LATER</h4></center>
            <hr>
            <div class="row">
                <div class="col-md-4">
                                <div class="card text-white bg-primary">
                <div class="card-header"><center><h4>Total Products</h4></center></div>
                <div class="card-body">
                  <h5 class="card-title"></h5>
                  <center><h2><%out.println(tot_products);%></h2></center>
                </div>
            </div>
                </div>
                <div class="col-md-4">
                               <div class="card text-white bg-success">
                                   <div class="card-header"><center><h4>Total Customers</h4></center></div>
                <div class="card-body">
                  <h5 class="card-title"></h5>
                  <center><h2><%out.println(tot_customers);%></h2></center>
                </div>
            </div>
                </div>
                 <div class="col-md-4">
                               <div class="card text-white bg-warning">
                <div class="card-header"><center><h4>Total Loans</h4></center></div>
                <div class="card-body">
                  <h5 class="card-title"></h5>
                  <center><h2><%out.println(tot_loans);%></h2></center>
                </div>
            </div>
                </div>
            </div>
            <br><br>
           <div id="chartContainer" style="height: 300px; width: 100%;"></div>

        </div>
    </body>
</html>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

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