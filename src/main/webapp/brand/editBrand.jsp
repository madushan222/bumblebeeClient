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
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Category"%>
<%@page import="shanlk.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->
        <title>Edit Brand</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Edit Brand</strong></h3></center>
            </div>
            <hr>
             <%
                    InventoryService_Service inventory_service = new InventoryService_Service();
                    InventoryService proxy = inventory_service.getInventoryServicePort();
                    Brand brand = proxy.getBrand(Integer.parseInt(request.getParameter("brandId")));
                    
             %>
              <form action="editProcess.jsp?brandId=<%out.println(request.getParameter("brandId"));%>" method="POST">
                  <div>
                    <select class="form-control" name="cat_id" id="cat_id" required>
                        <option value="">Select Category</option>
                        <%
                            List<Category> categories = proxy.getCategories();
                            for(Category cat : categories){%>
                                <option value=<%out.println(cat.getCatId());%> <%if(cat.getCatId() == brand.getCatId()){%> selected <%}%>><%out.println(cat.getName());%></option>
                            <%}%>
                    </select>
                  </div>
                <div class="form-group">
                    <label for="brand_name">Name:</label>
                    <input type="text" class="form-control" id="brand_name" name="brand_name" value="<%out.println(brand.getName());%>" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
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