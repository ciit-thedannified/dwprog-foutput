<%@ page import="ciit.dwprog.foutput.util.Database" %>
<%@ page import="ciit.dwprog.foutput.util.Question" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<html>
  <head>
      <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min-jsf.css" />
      <link rel="stylesheet" href="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js" />

      <title> Answer Survey Page </title>
  </head>
  <body>
    <div class="container mt-5 w-50">
      <h1> <c:out value="Survey #${param.get(\"id\")}" /> </h1>
      <form action="./process_response.jsp" method="post">

        <%
          Question[] questions = {};
          try {
            questions = Database.getQuestions(Integer.parseInt(request.getParameter("id")));
          }
          catch (SQLException sqle) {
            sqle.printStackTrace();
          }
        %>

        <input type="hidden" name="size" value="<%= questions.length %>" />
        <hr />

        <%
          for (int i = 0; i < questions.length; i++) {

            Question q = questions[i];

            if (q.getType().equals("paragraph")) {
        %>
          <!-- Paragraph Question -->
          <div class="question mb-5">
            <div class="form-group">
              <label class="form-label" for="question_<%= i %>"> <%= q.getPrompt() %> </label>
              <input type="hidden" name="question_<%= i %>" value="<%= q.getPrompt() %>" />
              <input class="form-control" type="text" id="question_<%= i %>" name="answer_<%= i %>" value="" />
            </div>
          </div>
        <%
            }

            if (q.getType().equals("radioGroup") || q.getType().equals("checkbox")) {
        %>
          <!-- Checkbox Question -->
          <div class="question mb-5">
            <div class="form-group">
              <label class="form-label"> <%= q.getPrompt() %> </label>
                <div class="question-choices">
                  <input type="hidden" name="question_<%= i %>" value="<%= q.getPrompt() %>" />
                  <%
                    for (var j = 0; j < q.getOptions().size(); j++) {

                      String answer = q.getOptions().get(j);
                  %>
                  <div class="form-check">
                    <label class="form-check-label" for="question_<%= i %>_<%= j %>"> <%= q.getOptions().get(j) %> </label>
                    <input class="form-check-input" type="<%= q.getType().equals("radioGroup") ? "radio" : "checkbox" %>" name="question_<%= i %>" id="question_<%= i %>_<%= j %>"
                            value="<%= answer %>" />
                  </div>
                  <%
                    }
                  %>
                </div>
            </div>
          </div>
        <%
            }
          }
        %>
        <div class="float-start">
          <button class="btn btn-primary" type="submit"> Submit </button>
        </div>
      </form>
    </div>
  </body>
</html>
