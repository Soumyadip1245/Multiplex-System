package com.example.view_controller.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Component
public class RoleInterceptor implements HandlerInterceptor{
      @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String role = (String) request.getSession().getAttribute("role");
        String requestURI = request.getRequestURI();
        if (requestURI.startsWith("/admin") && !"ADMIN".equals(role)) {
            response.sendRedirect("/access-denied");
            return false;
        } else if (requestURI.startsWith("/user") && !"USER".equals(role)) {
            response.sendRedirect("/access-denied");
            return false;
        } else if (requestURI.startsWith("/owner") && !"OWNER".equals(role)) {
            response.sendRedirect("/access-denied");
            return false;
        }

        return true;
    }
}
