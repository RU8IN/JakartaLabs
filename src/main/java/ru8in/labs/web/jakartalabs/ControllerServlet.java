package ru8in.labs.web.jakartalabs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ControllerServlet", value = "/2")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Double x = parseArgument(req.getParameter("x"));
        Double y = parseArgument(req.getParameter("y"));
        Double r = parseArgument(req.getParameter("r"));

        req.setAttribute("showTable", req.getParameter("showTable"));
        req.setAttribute("x", x);
        req.setAttribute("y", y);
        req.setAttribute("r", r);

        req.getRequestDispatcher("/check").forward(req, resp);
    }

    private static Double parseArgument(String argument) {
        try {
            return Double.parseDouble(argument);
        } catch (NumberFormatException | NullPointerException e) {
            return null;
        }
    }
}
