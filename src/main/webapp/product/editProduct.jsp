<%@page import="shanlk.InventoryService"%>
<%@page import="shanlk.InventoryService_Service"%>
<%@page import="shanlk.Product"%>
<%
    InventoryService_Service inventory_service = new InventoryService_Service();
    InventoryService proxy = inventory_service.getInventoryServicePort();
                    
    Product product = new Product();
    product.setProductId(Integer.parseInt(request.getParameter("productId")));
    product.setCatId(Integer.parseInt(request.getParameter("cat_id")));
    product.setBrandId(Integer.parseInt(request.getParameter("brand_id")));
    product.setName(request.getParameter("product_name"));
    proxy.updateProduct(product);
    response.sendRedirect("viewEditProduct.jsp?action=EDIT&productId="+Integer.parseInt(request.getParameter("productId"))+"&catId="+Integer.parseInt(request.getParameter("cat_id")));
                    
 %>