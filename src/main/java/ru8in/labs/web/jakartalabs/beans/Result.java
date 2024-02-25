package ru8in.labs.web.jakartalabs.beans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Result {
    private final static String MESSAGE_SUCCESS = "✅ Попадание";
    private final static String MESSAGE_FAIL = "❌ Промах";
    private final static String MESSAGE_ERROR = "⛔ Некорректные данные";
    private static final List<Double> yRange = Arrays.asList(-3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0);
    private static final List<Double> rRange = Arrays.asList(1.0, 2.0, 3.0, 4.0, 5.0);

    private final Double x;
    private final Double y;
    private final Double r;
    private final Date timestamp;
    private double executionTime;

    private final boolean isHit;
    private String hitMessage;
    private boolean isValid = true;

    public Result(Double x, Double y, Double r) {
        if (x == null || y == null || r == null) {
            isValid = false;
        }
//        else if (!yRange.contains(y)) {
//            this.isValid = false;
//        }
        else if (!rRange.contains(r)) {
            this.isValid = false;
        }

        this.x = x;
        this.y = y;
        this.r = r;
        this.timestamp = new Date();
        this.isHit = calculateHit();
    }

    private boolean calculateHit() {
        if (!this.isValid) {
            this.hitMessage = MESSAGE_ERROR;
            return false;
        };

        if (x >= 0 && y >= 0) {
            if (y <= -x + r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            };
        }
        else if (x <= 0 && y >= 0) {
            if (Math.sqrt(x*x + y*y) <= r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            };
        }
        else if (x>=0 && y <= 0) {
            if (x <= r/2. && y >= -r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            };
        }

        this.hitMessage = MESSAGE_FAIL;
        return false;
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

    public boolean isHit() {
        return this.isHit;
    }

    public String getHitMessage() {
        return this.hitMessage;
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
