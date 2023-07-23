<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.rtl.min-jsf.css" type="text/css" />
        <title>Title</title>
    </head>

    <sql:query var="responses" dataSource="${db}" sql="SELECT * FROM survey_responses sr JOIN surveys sv ON sr.survey_id = sv.survey_id WHERE sr.survey_id = ?">
        <sql:param value="${param.get(\"id\")}" />
    </sql:query>

    <body>
        <div class="container mt-5">
            <div class="row mb-4">
                <a class="btn btn-toolbar" href="./"> &lt; Go back to home </a>
            </div>
            <div class="row mb-4">
                <h1> Responses for Survey #<c:out value="${param.get(\"id\")}" /> </h1>
                <div class="container mt-4">
                    <c:forEach var="response" items="${responses.rows}">
                        <div class="row w-50">
                            <div class="col">
                                <h5> <c:out value="Response #${response.response_id}" /> </h5>
                            </div>
                            <div class="col">
                                <c:out value="Created at: ${response.created_at}" />
                            </div>
                        </div>
                        <div class="row w-50 mt-2 mb-3">
                            <div class="col" id="response_${response.response_id}">

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
