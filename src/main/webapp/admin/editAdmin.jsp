<%@page import="shanlk.User"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%
    UserService_Service user_service = new UserService_Service();
    UserService proxy = user_service.getUserServicePort();
    User admin = new User();
    admin.setUserId(Integer.parseInt(request.getParameter("userId")));
    admin.setFName(request.getParameter("fName"));
    admin.setMName(request.getParameter("mName"));
    admin.setLName(request.getParameter("lName"));
    admin.setDob(request.getParameter("dob"));
    admin.setNic(request.getParameter("nic"));
    admin.setAddress1(request.getParameter("address1"));
    admin.setAddress2(request.getParameter("address2"));
    admin.setAddress3(request.getParameter("address3"));
    admin.setEmail(request.getParameter("email"));
    admin.setMobile(Integer.parseInt(request.getParameter("mobile")));
    admin.setUsername(request.getParameter("username"));
    admin.setPassword(request.getParameter("password"));
    proxy.updateAdmin(admin);
    response.sendRedirect("viewEditAdmin.jsp?action=EDIT&userId="+Integer.parseInt(request.getParameter("userId")));
                    
 %>