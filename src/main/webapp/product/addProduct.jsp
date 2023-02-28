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
            
            function load_brands(cat_id)
            {
                $('#brandList').load("catBrands.jsp?catId="+cat_id+"");
            }
        </script>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"-->

        <title>Add Product</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Products</strong></h3></center>
            </div>
            <hr>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Product</button>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Product</h4>
                  </div>
                  <div class="modal-body">
                    <form action="productReg.jsp" method="POST">
                         <div class="form-group">
                          <label for="cat_id">Select Category:</label>
                          <select class="form-control" name="cat_id" id="cat_id" onchange="load_brands(this.value)" required>
                              <option value="">Select Category</option>
                               <%
                                InventoryService_Service inventory_service = new InventoryService_Service();
                                InventoryService  proxy = inventory_service.getInventoryServicePort();
                                List<Category> categories = proxy.getCategories();
                                for(Category cat : categories){%>
                                    <option value=<%out.println(cat.getCatId());%>><%out.println(cat.getName());%></option>
                                <%}%>
                          </select>
                        </div>
                          <span id="brandList"></span>
                        <div class="form-group">
                          <label for="product_name">Product Name:</label>
                          <input type="text" class="form-control" id="product_name" name="product_name" autocomplete="off" required>
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
                        <th>Product ID</th>
                        <th>Category Name</th>
                        <th>Brand Name</th>
                        <th>Product Name</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                        List<Product> products = proxy.getProducts();
                        int row = 0;
                        for(Product product : products){%>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <tbody>
                            <td><%out.println(product.getProductId());%></td>
                            <td><%out.println(product.getCatName());%></td>
                            <td><%out.println(product.getBrandName());%></td>
                            <td><%out.println(product.getName());%></td>
                            <td><%out.println(product.getStatus());%></td>
                            <td><a href="viewEditProduct.jsp?action=VIEW&productId=<%out.println(product.getProductId());%>&catId=<%out.println(product.getCatId());%>" title="View"><i class="fa fa-eye" style="color:green;"></i></a></td>
                            <td><%%><a href="viewEditProduct.jsp?action=EDIT&productId=<%out.println(product.getProductId());%>&catId=<%out.println(product.getCatId());%>" title="Edit"><i class="fa fa-pencil"></i></a></td>
                            <td>
                                <%if(product.getStatus().equals("PENDING")){%>
                                    <a href="deleteProduct.jsp?productId=<%out.println(product.getProductId());%>" title="Delete"><i class="fa fa-trash" style="color:red;"></i></a>
                                <%}%>
                            </td>
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