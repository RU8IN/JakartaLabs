package ru8in.labs.web.jakartalabs;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru8in.labs.web.jakartalabs.beans.Result;
import ru8in.labs.web.jakartalabs.beans.ResultList;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {

    @Inject
    private ResultList results;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Double x = (Double) req.getAttribute("x");
        Double y = (Double) req.getAttribute("y");
        Double r = (Double) req.getAttribute("r");
        String showTable = (String) req.getAttribute("showTable");

        if (showTable != null && showTable.equals("true")) {
            HttpSession session = req.getSession(true);
            session.setAttribute("resultManager", results.getResults());
            req.getRequestDispatcher("/WEB-INF/jsp/table.jsp").forward(req, resp);
        } else {
            Result result = new Result(x, y, r);
            HttpSession session = req.getSession(true);
            results.addResult(result);
            result.setExecutionTime(((new Date().getTime()-result.getTimestamp().getTime())/1000.0));
            session.setAttribute("result", result);
            req.getRequestDispatcher("/WEB-INF/jsp/table_row.jsp").forward(req, resp);
        }
    }
}

