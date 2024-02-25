package ru8in.labs.web.jakartalabs.beans;

import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

import java.io.Serializable;
import java.util.ArrayList;

@Named(value = "ResultSet")
@SessionScoped
public class ResultList implements Serializable {

    private final ArrayList<Result> results = new ArrayList<>();

    public void addResult(Result result) {
        results.add(result);
    }

    public void clearResults() {
        results.clear();
    }

    public ArrayList<Result> getResults() {
        return results;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("[");
        if (!results.isEmpty()) {
            for (Result res: results) {
                builder.append(res.toString());
                builder.append(",");
            }
            builder.deleteCharAt(builder.length()-1);
        }
        builder.append("]");
        return builder.toString();
    }
}
