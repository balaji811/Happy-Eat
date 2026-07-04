package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOimp.CartDAOimp;
import com.tap.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int menuId = Integer.parseInt(request.getParameter("menuId"));
            String action = request.getParameter("action");
           System.out.println(action);
            CartDAOimp cartDAO = new CartDAOimp();

            Cart cart = cartDAO.getCartByUserAndMenu(userId, menuId);

            if (cart != null) {

                int quantity = cart.getQuantity();

                if ("inc".equals(action)) {
                    quantity++;
                }
                else if ("dec".equals(action) && quantity > 1) {
                    quantity--;
                }

                cart.setQuantity(quantity);

                cartDAO.updateCart(cart);
            }

            response.sendRedirect("CartServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CartServlet");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}