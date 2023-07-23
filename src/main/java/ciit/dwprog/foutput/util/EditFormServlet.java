package ciit.dwprog.foutput.util;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/edit")
public class EditFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("createSurvey.jsp");

        String id = req.getParameter("id");

        req.setAttribute("editMode", true);
        req.setAttribute("id", id);
        req.setAttribute("formdata", Database.getQuestionsJson(Integer.parseInt(id)));


        rd.forward(req, resp);
    }
}
