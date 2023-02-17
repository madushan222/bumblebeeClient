<%@page import="shanlk.Login"%>
<%@page import="shanlk.LoginService"%>
<%@page import="shanlk.LoginService_Service"%>
<%
    LoginService_Service login_service = new LoginService_Service();
    LoginService proxy = login_service.getLoginServicePort();
    Login login = new Login();
    login.setUserName(request.getParameter("username"));
    login.setPassword(request.getParameter("password"));
    Login new_login = proxy.loginUser(login);
    if(!(new_login.getUserType().equals("NONE")))
    { 
        if(new_login.getUserType().equals("A"))
        {   
            session.setAttribute("userType",new_login.getUserType());
            response.sendRedirect("includes/adminsidebar.jsp");
        }
        else if(new_login.getUserType().equals("C"))
        {   
            session.setAttribute("userType",new_login.getUserType());
            response.sendRedirect("customer/sidebar.jsp");
        }
            
    }
    else
    {
       response.sendRedirect("index.jsp");
    }
   
                    
 %>