package ru8in.labs.web.jakartalabs;

import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru8in.labs.web.jakartalabs.beans.Result;
import ru8in.labs.web.jakartalabs.beans.ResultManager;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {
    @EJB
    private ResultManager resultManager; // Предполагается, что у вас есть EJB для управления результатами

    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = req.getSession(true);
        session.setAttribute("resultManager", resultManager.getResults(session.getId()));
        req.getRequestDispatcher("/WEB-INF/jsp/table.jsp").forward(req, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Double x = parseArgument(req.getParameter("x"));
        Double y = parseArgument(req.getParameter("y"));
        Double r = parseArgument(req.getParameter("r"));

        Result result = new Result(x, y, r);

        HttpSession session = req.getSession(true);
        resultManager.addResult(session.getId(), result);
        result.setExecutionTime(((new Date().getTime()-result.getTimestamp().getTime())/1000.0));
        session.setAttribute("result", result);
        req.getRequestDispatcher("/WEB-INF/jsp/table_row.jsp").forward(req, resp);
    }

    private static Double parseArgument(String argument) {
        try {
            return Double.parseDouble(argument);
        } catch (NumberFormatException | NullPointerException e) {
            return null;
        }
    }
}

