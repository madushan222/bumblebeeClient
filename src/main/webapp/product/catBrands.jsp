<%@page import="java.util.List"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Brand"%>
<div class="form-group">
    <label for="brand_id">Select Brand</label>
    <select class="form-control" name="brand_id" id="brand_id"  required>
        <option value="">Select Brand</option>
        <%
            InventoryService_Service inventory_service = new InventoryService_Service();
            InventoryService  proxy = inventory_service.getInventoryServicePort();
            List<Brand> brands = proxy.getBrandsByCatId(Integer.parseInt(request.getParameter("catId")));
            for(Brand brand : brands){%>
                <option value=<%out.println(brand.getBrandId());%>><%out.println(brand.getName());%></option>
            <%}%>
    </select>
</div>