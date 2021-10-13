package com.fighting.cqw.config;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author kufeigg
 * @Classname SessionContext
 * @Description TODO
 * @Date 2021/10/11 2:31 下午
 */
public class SessionContext {
    private static Map<String, HttpSession> sessionMap = new ConcurrentHashMap<>();

    public static synchronized void addSession(HttpSession session) {
        if (session != null) {
            sessionMap.put(session.getId(), session);
        }
    }

    public static synchronized void removeSession(HttpSession session) {
        if (session != null) {
            sessionMap.remove(session.getId());
        }
    }

    public static synchronized HttpSession getSession(String sessionId) {
        return sessionMap.get(sessionId);
    }
}