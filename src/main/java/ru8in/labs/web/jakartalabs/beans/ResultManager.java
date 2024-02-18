package ru8in.labs.web.jakartalabs.beans;

import ru8in.labs.web.jakartalabs.beans.Result;

import jakarta.ejb.Singleton;

import java.util.*;

@Singleton
public class ResultManager {

    private final Map<String, ArrayDeque<Result>> resultsMap; // Карта для хранения результатов по идентификатору сессии

    public ResultManager() {
        resultsMap = new HashMap<>();
    }

    // Добавление результата к указанной сессии
    public void addResult(String sessionId, Result result) {
        ArrayDeque<Result> results = resultsMap.getOrDefault(sessionId, new ArrayDeque<>());
        results.addFirst(result);
        resultsMap.put(sessionId, results);
    }

    public void clearResults(String sessionId) {
        this.resultsMap.remove(sessionId);
    }

    // Получение всех результатов для указанной сессии
    public ArrayDeque<Result> getResults(String sessionId) {
        return resultsMap.getOrDefault(sessionId, new ArrayDeque<>());
    }
}
