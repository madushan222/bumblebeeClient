<%@page import="shanlk.User"%>
<%@page import="shanlk.UserService"%>
<%@page import="shanlk.UserService_Service"%>
<%
    UserService_Service user_service = new UserService_Service();
    UserService proxy = user_service.getUserServicePort();
    User customer = new User();
    customer.setFName(request.getParameter("fName"));
    customer.setMName(request.getParameter("mName"));
    customer.setLName(request.getParameter("lName"));
    customer.setNic(request.getParameter("nic"));
    customer.setDob(request.getParameter("dob"));
    customer.setAddress1(request.getParameter("address1"));
    customer.setAddress2(request.getParameter("address2"));
    customer.setAddress3(request.getParameter("address3"));
    customer.setMobile(Integer.parseInt(request.getParameter("mobile")));
    customer.setEmail(request.getParameter("email"));
    customer.setUsername(request.getParameter("username"));
    customer.setPassword(request.getParameter("password"));
    customer.setUserType("C");
    proxy.addUser(customer);
    response.sendRedirect("../index.jsp");
                    
 %>
