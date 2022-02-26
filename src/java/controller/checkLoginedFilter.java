/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AdMins
 */
@WebFilter(filterName = "checkLoginedFilter", urlPatterns = {"/addToCart", "/cart"})
public class checkLoginedFilter implements Filter {

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // check login
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) { // already login
            chain.doFilter(request, response);   // cho qua filter
        } else { // not login yet
            // check cookie
            String username = null;
            String password = null;

            Cookie cookie[] = req.getCookies();
            for (Cookie co : cookie) {
                if (co.getName().equals("username")) {
                    username = co.getValue();
                }
                if (co.getName().equals("password")) {
                    password = co.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }
            if (username != null && password != null) {
                // check trong DB
                Account accountCookie = new AccountDAO().login(username, password);
                if (accountCookie != null) {  // ton tai account trong cookie
                    session.setAttribute("account", accountCookie);
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("login");
                }
            } else {
                res.sendRedirect("login");
            }
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }
}
