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
import ru8in.labs.web.jakartalabs.beans.ResultList;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ClearTableServlet", value = "/clear")
public class ClearTableServlet extends HttpServlet {
    @Inject
    private ResultList results;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            results.clearResults();
        }
}

