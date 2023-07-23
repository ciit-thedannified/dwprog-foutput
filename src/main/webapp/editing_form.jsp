<%@ page import="ciit.dwprog.foutput.util.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    try {
        Database.updateSurvey(Integer.parseInt(request.getParameter("id")), request.getParameter("formdata"));
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>

<c:redirect url="index.jsp" />