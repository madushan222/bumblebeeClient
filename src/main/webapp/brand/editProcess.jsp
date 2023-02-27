<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Brand"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
                    
    Brand brand = new Brand();
    brand.setBrandId(Integer.parseInt(request.getParameter("brandId")));
    brand.setCatId(Integer.parseInt(request.getParameter("cat_id")));
    brand.setName(request.getParameter("brand_name"));
    proxy.updateBrand(brand);
    response.sendRedirect("editBrand.jsp?brandId="+Integer.parseInt(request.getParameter("brandId")));
                    
 %>