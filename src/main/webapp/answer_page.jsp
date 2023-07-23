<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<html>
  <head>
      <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min-jsf.css" />
      <link rel="stylesheet" href="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js" />

      <sql:query var="survey" dataSource="${db}" sql="SELECT * FROM surveys WHERE survey_id = ?">
        <sql:param value="${param.get(\"id\")}" />
      </sql:query>

      <c:set var="sdata" value="${survey.rows}" />

      <title> Survey #<c:out value="${survey.survey_id}" /> </title>
  </head>
  <body>
    <div class="container mt-5 w-50">
      <h1> <c:out value="Survey Title" /> </h1>
      <form>

        <hr />

        <div class="question mb-5">
          <div class="form-group">
            <label class="form-label" for="question_1"> 1. Question #1 </label>
            <input class="form-control" type="text" id="question_1" name="question_1" />
          </div>
        </div>

        <div class="question mb-5">

          <div class="form-group">
            <label class="form-label"> 2. Question #2 </label>
              <div class="question-choices">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="question_2" id="question_2_1" />
                  <label class="form-check-label" for="question_2_1"> Apple </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="question_2" id="question_2_2" />
                  <label class="form-check-label" for="question_2_2"> Banana </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="question_2" id="question_2_3" />
                  <label class="form-check-label" for="question_2_3"> Orange </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="question_2" id="question_2_4" />
                  <label class="form-check-label" for="question_2_4"> White </label>
                </div>
              </div>
          </div>

        </div>

        <div class="question mb-5">
          <div class="form-group">

          </div>
        </div>

        <div class="float-start">
          <button class="btn btn-primary" type="submit"> Submit </button>
        </div>

      </form>
    </div>
  </body>
</html>
