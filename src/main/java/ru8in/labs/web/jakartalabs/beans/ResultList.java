package ru8in.labs.web.jakartalabs.beans;

import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Named(value = "ResultSet")
@SessionScoped
public class ResultList implements Serializable {

    private final ArrayList<Result> results = new ArrayList<>();

    public void addResult(Result result) {
        results.add(0, result);
    }

    public void clearResults() {
        results.clear();
    }

    public ArrayList<Result> getResults() {
        return results;
    }
}
