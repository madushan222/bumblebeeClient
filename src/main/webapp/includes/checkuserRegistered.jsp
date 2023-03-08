<%@page import="shanlk.User"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%

    UserService_Service user_service = new UserService_Service();
    UserService proxy = user_service.getUserServicePort();
    boolean result = proxy.checkUserAlreadyRegistered(request.getParameter("nic"));
    if(result)
        out.println(1);
    else
        out.println(0);
                    
 %>
