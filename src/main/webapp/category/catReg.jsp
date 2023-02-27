<%@page import="shanlk.Category"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    Category cat = new Category();
    cat.setName(request.getParameter("cat_name"));
    cat.setStatus("PENDING");
    cat.setAddedDate("2023-02-24");
    proxy.addCategory(cat);
    response.sendRedirect("addCategory.jsp");
                    
 %>
