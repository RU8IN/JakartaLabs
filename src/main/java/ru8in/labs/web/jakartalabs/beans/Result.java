package ru8in.labs.web.jakartalabs.beans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Result {

    private static final List<Double> yRange = Arrays.asList(-3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0);
    private static final List<Double> rRange = Arrays.asList(1.0, 2.0, 3.0, 4.0, 5.0);

    private final Double x;
    private final Double y;
    private final Double r;
    private final Date timestamp;
    private double executionTime;

    private boolean isValid = true;

    public Result(Double x, Double y, Double r) {
        if (x == null || y == null || r == null) {
            isValid = false;
        }
        else if (!yRange.contains(y) || !rRange.contains(r)) {
            this.isValid = false;
        }
        this.x = x;
        this.y = y;
        this.r = r;
        this.timestamp = new Date();

    }

    public Double getX() {
        return x;
    }

    public Double getY() {
        return y;
    }

    public Double getR() {
        return r;
    }

    public String isHit() {

        String success = "✅ Попадание";
        String fail = "❌ Промах";
        String error = "⛔ Некорректные данные";

        if (!this.isValid) return error;

        if (x >= 0 && y >= 0) {
            if (y <= -x + r) return success;
        }
        else if (x <= 0 && y >= 0) {
            if (Math.sqrt(x*x + y*y) <= r) return success;
        }
        else if (x>=0 && y <= 0) {
            if (x <= r/2. && y >= -r) return success;
        }

        return fail;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public double getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(double executionTime) {
        this.executionTime = executionTime;
    }
}
