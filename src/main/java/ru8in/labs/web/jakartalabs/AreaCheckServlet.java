package ru8in.labs.web.jakartalabs;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Double x = (Double) req.getAttribute("x");
        Double y = (Double) req.getAttribute("y");
        Double r = (Double) req.getAttribute("r");
        String showTable = (String) req.getAttribute("showTable");

        if (showTable != null && showTable.equals("true")) {
            resp.getWriter().write(results.toString());
        } else {
            Result result = new Result(x, y, r);
            results.addResult(result);
            result.setExecutionTime(((new Date().getTime()-result.getTimestamp().getTime())/1000.0));
            resp.getWriter().write("[" + result + "]");
        }
    }
}

