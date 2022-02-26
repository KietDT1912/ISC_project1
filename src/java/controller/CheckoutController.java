/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ShippingDAO;
import dto.Account;
import dto.Cart;
import dto.Order;
import dto.OrderDetail;
import dto.Shipping;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AdMins
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart");

            double totalPrice = 0;
            for (Cart cart : listCart) {
                totalPrice += cart.getProductPrice() * cart.getQuantity();
            }

            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("listCart", listCart);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String username = account.getUserName();
        Shipping shipping = new Shipping();
        shipping.setName(name);
        shipping.setPhone(mobile);
        shipping.setAddress(address);

        // luu vao bang shipping trong DB
        int shipId = new ShippingDAO().addShippingReturnId(shipping);
        if (shipId != 0) {  // insert shipping thanh cong
            ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart");
            double totalPrice = 0;
            for (Cart cart : listCart) {
                totalPrice += cart.getProductPrice() * cart.getQuantity();
            }

            Order order = new Order();
            order.setCustomer(username);
            order.setShippingId(shipId);
            order.setTotalPrice(totalPrice);
            order.setNote(note);
            order.setStatus(1);

            // them order vao hang order
            int orderId = new OrderDAO().addOrderReturnId(order);
            if (orderId != 0) {

                // Them listCart vao bang orderDetail
                int check = new OrderDetailDAO().add(listCart, orderId);
                if (check != 0) { // them listCart vao DB thanh cong
                    response.sendRedirect("thank");
                }else{ // them listCart vao DB fail
                   //1. remove order by orderId
                   //2. remove shipping by shipping Id
                   response.sendRedirect("error"); //  show error 
                   
                }
            }else{
                // remove shipping by Id
                response.sendRedirect("error"); //  show error 
            }
        }else{
            response.sendRedirect("error"); //  show error 
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
