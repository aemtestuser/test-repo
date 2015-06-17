<%--

  register component.



--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%@ page import = "javax.servlet.RequestDispatcher" %><%

    RequestDispatcher rd = request.getRequestDispatcher(currentPage.getPath());
    out.println(currentPage.getPath());
%>