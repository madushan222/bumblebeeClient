
<%
    session.removeAttribute("userType");
    session.removeAttribute("userID");
    response.sendRedirect("index.jsp");
                      
 %>