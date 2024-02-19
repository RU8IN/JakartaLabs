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
    private ResultManager resultManager;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Double x = (Double) req.getAttribute("x");
        Double y = (Double) req.getAttribute("y");
        Double r = (Double) req.getAttribute("r");
        String showTable = (String) req.getAttribute("showTable");

        if (showTable != null && showTable.equals("true")) {
            System.out.println("return table");
            HttpSession session = req.getSession(true);
            session.setAttribute("resultManager", resultManager.getResults(session.getId()));
            req.getRequestDispatcher("/WEB-INF/jsp/table.jsp").forward(req, resp);
        } else {
            System.out.println("return row");
            Result result = new Result(x, y, r);

            HttpSession session = req.getSession(true);
            resultManager.addResult(session.getId(), result);
            result.setExecutionTime(((new Date().getTime()-result.getTimestamp().getTime())/1000.0));
            session.setAttribute("result", result);
            req.getRequestDispatcher("/WEB-INF/jsp/table_row.jsp").forward(req, resp);
        }
    }
}

