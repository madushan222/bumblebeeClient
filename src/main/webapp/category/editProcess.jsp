<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Category"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
                    
    Category cat = new Category();
    cat.setCatId(Integer.parseInt(request.getParameter("catId")));
    cat.setName(request.getParameter("cat_name"));
    proxy.updateCategory(cat);
    response.sendRedirect("editCategory.jsp?catId="+Integer.parseInt(request.getParameter("catId")));
                    
 %>