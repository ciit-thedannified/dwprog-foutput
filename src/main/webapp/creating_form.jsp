<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:transaction dataSource="${db}">
    <sql:update var="addNewSurvey" sql="INSERT INTO surveys (questions) VALUES (?);">
        <sql:param value="${param.get(\"formdata\")}" />
    </sql:update>
</sql:transaction>

<c:redirect url="index.jsp" />