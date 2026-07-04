package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOimp.CartDAOimp;
import com.tap.DAOimp.MenuDAOimp;
import com.tap.model.Cart;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ClearCartAndAddServlet")
public class ClearCartAndAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int menuId = Integer.parseInt(request.getParameter("menuId"));

            CartDAOimp cartDAO = new CartDAOimp();

     
            cartDAO.deleteCartByUser(userId);

         
            MenuDAOimp menuDAO = new MenuDAOimp();
            Menu menu = menuDAO.getMenu(menuId);

      
            Cart cart = new Cart(
                    menu.getRestaurantId(),
                    menuId,
                    menu.getItemName(),
                    menu.getPrice(),
                    1,
                    userId,
                    menu.getImagePath()
            );

            cartDAO.addCart(cart);

           
            response.sendRedirect("CartServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}