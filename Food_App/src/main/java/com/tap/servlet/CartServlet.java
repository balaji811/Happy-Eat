package com.tap.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.CartDAOimp;
import com.tap.DAOimp.MenuDAOimp;
import com.tap.model.Cart;
import com.tap.model.Menu;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

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

            String menuIdStr = request.getParameter("menuId");

            CartDAOimp cartDAO = new CartDAOimp();

          
            if (menuIdStr == null || menuIdStr.isEmpty()) {

                List<Cart> items = cartDAO.getallCart(userId);

                request.setAttribute("items", items);

                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);
                return;
            }

            int menuId = Integer.parseInt(menuIdStr);

            MenuDAOimp menuDAO = new MenuDAOimp();
            Menu menu = menuDAO.getMenu(menuId);

            Integer existingRestaurantId =
                    cartDAO.getRestaurantIdByUser(userId);

            
            if (existingRestaurantId != null &&
                    existingRestaurantId != menu.getRestaurantId()) {

                List<Cart> items = cartDAO.getallCart(userId);

                request.setAttribute("items", items);
                request.setAttribute("confirm", true);
                request.setAttribute("menuId", menuId);

                RequestDispatcher rd =
                        request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);

                return;
            }

            if (!cartDAO.itemExists(userId, menuId)) {

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

                System.out.println("Item added to cart");
            }

            List<Cart> items = cartDAO.getallCart(userId);

            request.setAttribute("items", items);

            RequestDispatcher rd =
                    request.getRequestDispatcher("cart.jsp");

            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}