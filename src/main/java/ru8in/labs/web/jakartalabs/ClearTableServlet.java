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

@WebServlet(name = "ClearTableServlet", value = "/clear")
public class ClearTableServlet extends HttpServlet {
    @EJB
    private ResultManager resultManager;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession(true);
            resultManager.clearResults(session.getId());
        }
}

