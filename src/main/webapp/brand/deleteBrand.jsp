<%@page import="shanlk.Brand"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    proxy.deleteBrand(Integer.parseInt(request.getParameter("brandId")));
    response.sendRedirect("addBrand.jsp");
                    
 %>
