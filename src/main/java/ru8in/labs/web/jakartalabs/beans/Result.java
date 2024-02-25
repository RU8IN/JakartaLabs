package ru8in.labs.web.jakartalabs.beans;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.json.JSONObject;

public class Result {
    private final static String MESSAGE_SUCCESS = "✅ Попадание";
    private final static String MESSAGE_FAIL = "❌ Промах";
    private final static String MESSAGE_ERROR = "⛔ Некорректные данные";

    private final Double x;
    private final Double y;
    private final Double r;
    private final Date timestamp;
    private double executionTime;

    private final boolean isHit;
    private String hitMessage;
    private boolean isValid = true;

    public Result(Double x, Double y, Double r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.timestamp = new Date();
        this.isValid = validate(x, y, r);
        this.isHit = calculateHit();
    }

    private static boolean validate(Double x, Double y, Double r) {
        List<Double> yRange = Arrays.asList(-3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0);
        List<Double> rRange = Arrays.asList(1.0, 2.0, 3.0, 4.0, 5.0);

        if (x == null || y == null || r == null) {
            return false;
        }
//        else if (!yRange.contains(y)) {
//            return false;
//        }
        else if (y < -3.0 || y > 5.0) {
            return false;
        }
        else if (!rRange.contains(r)) {
            return false;
        }
        return true;
    }

    private boolean calculateHit() {
        if (!this.isValid) {
            this.hitMessage = MESSAGE_ERROR;
            return false;
        }

        if (x >= 0 && y >= 0) {
            if (y <= -x + r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            }
        }
        else if (x <= 0 && y >= 0) {
            if (Math.sqrt(x*x + y*y) <= r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            }
        }
        else if (x>=0 && y <= 0) {
            if (x <= r/2. && y >= -r) {
                this.hitMessage = MESSAGE_SUCCESS;
                return true;
            }
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

    @Override
    public String toString() {
        JSONObject object = new JSONObject();
        object.put("isHit", this.isHit);
        object.put("x", this.getX());
        object.put("y", this.getY());
        object.put("r", this.getR());
        object.put("isValid", this.isValid);
        object.put("hitMessage", this.getHitMessage());
        object.put("timestamp", this.getTimestamp());
        object.put("executionTime", this.getExecutionTime());
        return object.toString();
    }
}
