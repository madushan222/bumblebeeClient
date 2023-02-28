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
<%@page import="shanlk.Product"%>
<%@page import="shanlk.Brand"%>
<%@page import="shanlk.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->
        <title>View/Edit Product</title>
        <script>
            function load_brands(cat_id)
            {
                $('#brandList').load("catBrands.jsp?catId="+cat_id+"");
            }
        </script>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <% String action = request.getParameter("action");
           String heading = "";
            if(action.equals("VIEW"))
                heading = "View Product";
            else if(action.equals("EDIT"))
                heading = "Edit Product";
        %>
        <div class="main">
            <div class="form-title">
                <center><h3><strong><%out.println(heading);%></strong></h3></center>
            </div>
            <hr>
             <%
                    InventoryService_Service inventory_service = new InventoryService_Service();
                    InventoryService proxy = inventory_service.getInventoryServicePort();
                    Product product = proxy.getProduct(Integer.parseInt(request.getParameter("productId")));
                    
             %>
              <form action="editProduct.jsp?productId=<%out.println(request.getParameter("productId"));%>" method="POST">
                <div class="form-group">
                    <label for="cat_id">Select Category:</label>
                    <select class="form-control" name="cat_id" id="cat_id" onchange="load_brands(this.value)" <%if(action.equals("VIEW")){%> disabled <%}%> required>
                        <option value="">Select Category</option>
                        <%
                            List<Category> categories = proxy.getCategories();
                            for(Category cat : categories){%>
                                <option value=<%out.println(cat.getCatId());%> <%if(cat.getCatId() == product.getCatId()){%> selected<%}%>><%out.println(cat.getName());%></option>
                        <%}%>
                    </select>
                </div>
                <span id="brandList">
                <div class="form-group">
                    <label for="brand_id">Select Brand</label>
                    <select class="form-control" name="brand_id" id="brand_id" <%if(action.equals("VIEW")){%> disabled <%}%>  required>
                        <option value="">Select Brand</option>
                        <%
                            List<Brand> brands = proxy.getBrandsByCatId(Integer.parseInt(request.getParameter("catId")));
                            for(Brand brand : brands){%>
                                <option value=<%out.println(brand.getBrandId());%> <%if(brand.getBrandId() == product.getBrandId()){%> selected<%}%>><%out.println(brand.getName());%></option>
                            <%}%>
                    </select>
                </div>
                </span>
                <div class="form-group">
                    <label for="product_name">Product Name:</label>
                    <input type="text" class="form-control" id="product_name" name="product_name" value="<%out.println(product.getName());%>" <%if(action.equals("VIEW")){%> readonly <%}%> autocomplete="off" required>
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