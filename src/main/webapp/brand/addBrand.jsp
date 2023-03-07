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
<%@page import="shanlk.Brand"%>
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

        <title>Add Brand</title>
    </head>
    <body>
        <jsp:include page="../includes/adminsidebar.jsp" />
        <div class="main">
            <div class="form-title">
                <center><h3><strong>Brands</strong></h3></center>
            </div>
            <hr>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Brand</button>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Brand</h4>
                  </div>
                  <div class="modal-body">
                    <form action="brandReg.jsp" method="POST">
                         <div class="form-group">
                          <label for="cat_id">Select Category:</label>
                          <select class="form-control" name="cat_id" id="cat_id" required>
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
                        <div class="form-group">
                          <label for="brand_name">Brand Name:</label>
                          <input type="text" class="form-control" id="brand_name" name="brand_name" autocomplete="off" required>
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Brand ID</th>
                        <th>Category Name</th>
                        <th>Brand Name</th>
                        <th>Status</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                        List<Brand> brands = proxy.getBrands();
                        int row = 0;
                        for(Brand brand : brands){%>
                        <tbody>
                        <tr <%if(row%2 == 0){%> class="info" <%}%>>
                            <td><%out.println(brand.getBrandId());%></td>
                            <td><%out.println(brand.getCatName());%></td>
                            <td><%out.println(brand.getName());%></td>
                            <td><%out.println(brand.getStatus());%></td>
                            <td><a href="editBrand.jsp?brandId=<%out.println(brand.getBrandId());%>" title="Edit"><i class="fa fa-pencil"></i></a></td>
                            <td>
                                <%if(brand.getStatus().equals("PENDING")){%>
                                    <a href="deleteBrand.jsp?brandId=<%out.println(brand.getBrandId());%>" title="Delete"><i class="fa fa-trash" style="color:red;"></i></a>
                                <%}%>
                            </td>
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