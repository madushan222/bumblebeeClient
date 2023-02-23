<%@page import="shanlk.User"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%
    UserService_Service user_service = new UserService_Service();
    UserService proxy = user_service.getUserServicePort();
    String type = request.getParameter("userType");
    proxy.deleteUser(Integer.parseInt(request.getParameter("userId")));
    if(type.equals("A"))
     response.sendRedirect("../admin/addAdmin.jsp");
    else if(type.equals("C"))
     response.sendRedirect("../customer/customerData.jsp");
                    
 %>
