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

@WebServlet("/check")
public class AreaCheckServlet extends HttpServlet {
    @EJB
    private ResultManager resultManager; // Предполагается, что у вас есть EJB для управления результатами

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Получаем параметры X, Y, R из запроса

        Double x = parseArgument(request.getParameter("x"));
        Double y = parseArgument(request.getParameter("y"));
        Double r = parseArgument(request.getParameter("r"));

        // Создаем новый результат и добавляем его в сессию
        Result result = new Result(x, y, r);
        HttpSession session = request.getSession(true);
        resultManager.addResult(session.getId(), result);
        result.setExecutionTime((new Date().getTime()-result.getTimestamp().getTime())/1000);
        System.out.println(resultManager.hashCode());

        session.setAttribute("resultManager", resultManager.getResults(session.getId()));

        request.getRequestDispatcher("/WEB-INF/jsp/table.jsp").forward(request, response);
    }

    private static Double parseArgument(String argument) {
        try {
            return Double.parseDouble(argument);
        } catch (NumberFormatException | NullPointerException e) {
            return null;
        }
    }
}

