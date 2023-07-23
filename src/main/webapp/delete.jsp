<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:transaction dataSource="${db}">
  <sql:update sql="DELETE FROM surveys WHERE survey_id = ?" var="deletion">
    <sql:param value="${param.get(\"id\")}" />
  </sql:update>
</sql:transaction>

<c:redirect url="index.jsp" />
