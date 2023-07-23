<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.rtl.min-jsf.css" type="text/css" />

        <title> ${pageContext.servletContext.getAttribute("page-name")} - ${initParam.get("app-name")} </title>
    </head>
    <body>

        <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/ask_away"
                           scope="application" user="${initParam.get(\"db-username\")}" password="${initParam.get(\"db-password\")}" />

        <sql:query var="forms" dataSource="${db}" sql="SELECT * FROM surveys" />

        <div class="container w-50">
            <div class="row mt-5 mb-5">
                <div class="col">
                    <h1> Ask Away </h1>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col">
                    <a href="./createSurvey.jsp" class="btn btn-success"> Create a Form</a>
                </div>
            </div>
            <c:forEach var="survey" items="${forms.rows}">
            <div class="row p-3 mb-4 border border-5 border-info">

                <h3> <c:out value="Survey #${survey.survey_id}" /> </h3>
                <small> <c:out value="${survey.created_at}" /> </small>

                <a class="btn btn-primary w-auto m-3" href="./edit?id=${survey.survey_id}"> Edit Form </a>
                <a class="btn btn-primary w-auto m-3" href="./answer_page.jsp?id=${survey.survey_id}"> Answer Form </a>
                <a class="btn btn-primary w-auto m-3" href="./view_response.jsp?id=${survey.survey_id}"> View Responses </a>
                <a class="btn btn-danger w-auto m-3" href="./delete.jsp?id=${survey.survey_id}"> Delete Form </a>
            </div>
            </c:forEach>
        </div>


    </body>
</html>