<%@page import="shanlk.Product"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    proxy.deleteProduct(Integer.parseInt(request.getParameter("productId")));
    response.sendRedirect("addProduct.jsp");
                    
 %>
