<%@ page import="com.quiz.model.user.User" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 7/31/2020
  Time: 01:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
</head>
<body>
<form action="deleteUserFromSite" method="post">
    <%
        User user = (User) request.getAttribute("user");
        out.println("<h4> loginName: "+user.getLoginName()+"</h4>");
        out.println("<h4> firstName: "+user.getFirstName()+"</h4>");
        out.println("<h4> lastName: "+user.getLastName() +"</h4>");
        out.print("<input type=\"hidden\" id=\"gu1\" name=\"globalUser\" value=\""+user.getLoginName()+"\">");
    %>
    <input type="hidden" id="user" name="username" value=<%= request.getParameter("username")%>>
    <input type="submit" value="delete">
</form>

<form action="grantAdmin" method="post">
    <%
        User user1 = (User) request.getAttribute("user");
        out.print("<input type=\"hidden\" id=\"gu2\" name=\"globalUser\" value=\""+user1.getLoginName()+"\">");
    %>
    <input type="hidden" id="user" name="username" value=<%= request.getParameter("username")%>>
    <input type="submit" value="Grant Admin">
</form>

</body>
</html>
