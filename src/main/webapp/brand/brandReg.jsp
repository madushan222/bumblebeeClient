<%@page import="shanlk.Brand"%>
<%@page import="shanlk.Category"%>
<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
    Brand brand = new Brand();
    brand.setCatId(Integer.parseInt(request.getParameter("cat_id")));
    brand.setName(request.getParameter("brand_name"));
    brand.setStatus("PENDING");
    proxy.addBrand(brand);
    
    //Update Category Status
    proxy.updateStatus(Integer.parseInt(request.getParameter("cat_id")),"USED","category","cat_id");
    
    response.sendRedirect("addBrand.jsp");
                    
 %>
