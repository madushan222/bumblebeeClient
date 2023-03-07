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
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Category"%>
<%@page import="shanlk.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->

        <title>Collection Report</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Collection Report</strong></h3></center>
            </div>
            <hr>
                <div class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="From Date" id="fromDate" name="fromDate" autocomplete="off" required>
                </div>
            
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="To Date" id="toDate" name="toDate" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <button id="btn_search" onclick="load_report()" class="btn btn-primary">Search</button>
                </div>
                   </div>
            <hr>
            <div id="report_data"></div>
        </div>
    </body>
</html>
        <script>
            
            function load_report()
            {    
                 var fromDate = $("#fromDate").val();
                 var toDate = $("#toDate").val();
                 if(fromDate != "" && toDate != "")
                    $('#report_data').load("getCollection.jsp?fromDate="+fromDate+"&toDate="+toDate+"");
            }
            
            $( function() {
                $( "#fromDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-80:+00",
                    dateFormat: 'yy-mm-dd'
                });
            } );
            
            $( function() {
                $( "#toDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-80:+00",
                    dateFormat: 'yy-mm-dd'
                });
            } );


            
         </script>