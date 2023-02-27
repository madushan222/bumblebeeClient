<%@page import="shanlk.Category"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    proxy.deleteCategory(Integer.parseInt(request.getParameter("catId")));
    response.sendRedirect("addCategory.jsp");
                    
 %>
