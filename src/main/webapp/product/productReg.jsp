<%@page import="shanlk.Product"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    Product product = new Product();
    product.setBrandId(Integer.parseInt(request.getParameter("brand_id")));
    product.setCatId(Integer.parseInt(request.getParameter("cat_id")));
    product.setName(request.getParameter("product_name"));
    product.setStatus("PENDING");
    proxy.addProduct(product);
    
    //Update Category Status
    proxy.updateStatus(Integer.parseInt(request.getParameter("brand_id")),"USED","brand","brand_id");
    
    response.sendRedirect("addProduct.jsp");
                    
 %>
