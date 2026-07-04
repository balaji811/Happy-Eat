<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <title>Happy Eat - Checkout</title>
    <!-- Google Fonts + Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet" />
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* ----- RESET & FULL SCREEN ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            width: 100%;
            background: #1a1a1a;
            font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            color: #e0d5c8;
            overflow-x: hidden;
        }

        body {
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: stretch;
        }

        /* ----- MAIN WRAPPER: FULL SCREEN, NO BORDER, NO SHADOW ----- */
        .checkout-container {
            display: flex;
            flex-wrap: nowrap;
            width: 100%;
            min-height: 100vh;
            background: transparent;
            margin: 0;
            border: none;
            box-shadow: none;
            border-radius: 0;
        }

        /* ========= SIDEBAR: FULL HEIGHT, STICKY ========= */
        .sidebar {
            width: 280px;
            min-height: 100vh;
            background: #1f1f1f;
            padding: 32px 20px;
            flex-shrink: 0;
            border: none;
            display: flex;
            flex-direction: column;
            position: sticky;
            top: 0;
            align-self: stretch;
            overflow-y: auto;
        }

        .logo-area {
            margin-bottom: 48px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            background: linear-gradient(135deg, #d4a373, #b87c4b);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            line-height: 1.2;
        }

        .logo span {
            display: block;
            font-size: 1.2rem;
            font-weight: 500;
            background: none;
            -webkit-background-clip: unset;
            background-clip: unset;
            color: #c48a5a;
            letter-spacing: -0.2px;
        }

        .user-greeting {
            margin-bottom: 40px;
            padding-top: 8px;
        }

        .nav-menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 20px;
            flex: 1;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 12px 16px;
            border-radius: 18px;
            font-weight: 500;
            color: #9a8b7a;
            transition: all 0.2s ease;
            cursor: pointer;
            text-decoration: none;
            border: none;
        }

        .nav-item i {
            font-size: 1.2rem;
            width: 28px;
            text-align: center;
        }

        .nav-item.active {
            background: #2c2c2c;
            color: #d4a373;
            font-weight: 600;
        }

        .nav-item:not(.active):hover {
            background: #2a2a2a;
            color: #c48a5a;
        }

        .nav-item a {
            text-decoration: none;
            color: inherit;
            display: flex;
            align-items: center;
            gap: 14px;
            width: 100%;
        }

        .back-link {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #2a2a2a;
        }

        .back-link a {
            text-decoration: none;
            color: #d4a373;
            font-weight: 600;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .back-link a:hover {
            color: #b87c4b;
            gap: 12px;
        }

        /* ========= MAIN CONTENT: FILL REMAINING SPACE ========= */
        .main-content {
            flex: 1;
            background: transparent;
            padding: 32px 40px 40px 40px;
            min-height: 100vh;
            overflow-y: auto;
        }

        .hero-welcome {
            margin-bottom: 28px;
            border-bottom: 2px solid #2a2a2a;
            padding-bottom: 18px;
        }

        .hero-title {
            font-size: 2rem;
            font-weight: 800;
            color: #d4c9bc;
            letter-spacing: -0.3px;
            margin-bottom: 8px;
        }

        .hero-title i {
            color: #d4a373;
            margin-right: 10px;
        }

        .hero-sub {
            color: #b87c4b;
            font-size: 0.95rem;
            font-weight: 500;
        }

        .hero-sub i {
            margin-left: 6px;
            color: #d4a373;
        }

        .checkout-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 32px;
            margin-top: 10px;
        }

        /* ----- CHECKOUT FORM ----- */
        .checkout-form-col {
            flex: 2;
            min-width: 280px;
        }

        .form-card {
            background: #1f1f1f;
            border-radius: 28px;
            padding: 28px 30px;
            border: none;
        }

        .form-card h2 {
            font-size: 1.4rem;
            font-weight: 700;
            color: #d4c9bc;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #2a2a2a;
        }

        .form-card h2 i {
            color: #d4a373;
            margin-right: 10px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 0.85rem;
            color: #9a8b7a;
        }

        .form-group label i {
            margin-right: 6px;
            color: #d4a373;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px 16px;
            background: #171717;
            border: 1px solid #2a2a2a;
            border-radius: 12px;
            font-size: 0.95rem;
            color: #d4c9bc;
            transition: all 0.2s;
            font-family: 'Inter', sans-serif;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #d4a373;
            box-shadow: 0 0 0 3px rgba(212, 163, 115, 0.1);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }

        .form-group select option {
            background: #1f1f1f;
            color: #d4c9bc;
        }

        .payment-section {
            margin-top: 24px;
            padding-top: 20px;
            border-top: 2px solid #2a2a2a;
        }

        .payment-section h2 {
            font-size: 1.4rem;
            font-weight: 700;
            color: #d4c9bc;
            margin-bottom: 16px;
        }

        .payment-section h2 i {
            color: #d4a373;
            margin-right: 10px;
        }

        .payment-method {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .payment-method label {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            background: #171717;
            border-radius: 12px;
            border: 1px solid #2a2a2a;
            cursor: pointer;
            transition: all 0.2s;
            color: #9a8b7a;
            font-weight: 500;
        }

        .payment-method label:hover {
            border-color: #d4a373;
        }

        .payment-method input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: #d4a373;
            cursor: pointer;
        }

        .payment-method label:has(input:checked) {
            border-color: #d4a373;
            background: #2a2a2a;
            color: #d4c9bc;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 2px solid #2a2a2a;
            font-size: 1.5rem;
            font-weight: 800;
            color: #d4c9bc;
        }

        .total-row span:last-child {
            color: #d4a373;
        }

        .place-order-btn {
            width: 100%;
            margin-top: 20px;
            background: linear-gradient(105deg, #b87c4b, #d4a373);
            color: #1a1a1a;
            border: none;
            padding: 16px;
            border-radius: 60px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            box-shadow: 0 6px 14px rgba(212, 163, 115, 0.15);
        }

        .place-order-btn:hover {
            background: linear-gradient(105deg, #a06a3e, #b87c4b);
            transform: scale(0.98);
        }

        .place-order-btn i {
            color: #1a1a1a;
        }

        /* ----- ORDER SUMMARY ----- */
        .summary-col {
            flex: 1;
            min-width: 240px;
        }

        .summary-card {
            background: #1f1f1f;
            border-radius: 28px;
            padding: 28px 24px;
            border: none;
            align-self: flex-start;
            position: sticky;
            top: 32px;
        }

        .summary-card h2 {
            font-size: 1.4rem;
            font-weight: 700;
            color: #d4c9bc;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #2a2a2a;
        }

        .summary-card h2 i {
            color: #d4a373;
            margin-right: 10px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #2a2a2a;
            color: #9a8b7a;
            font-size: 0.9rem;
        }

        .order-item .item-name {
            color: #d4c9bc;
            font-weight: 500;
        }

        .order-item .item-total {
            color: #d4a373;
            font-weight: 600;
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            margin-top: 18px;
            padding-top: 16px;
            border-top: 2px solid #2a2a2a;
            font-size: 1.3rem;
            font-weight: 800;
            color: #d4c9bc;
        }

        .summary-total span:last-child {
            color: #d4a373;
        }

        .secure-badge {
            margin-top: 16px;
            text-align: center;
            font-size: 0.75rem;
            color: #7a6b5a;
        }

        .secure-badge i {
            color: #d4a373;
            margin-right: 6px;
        }

        .restaurant-note {
            background: #1f1f1f;
            border-radius: 24px;
            padding: 16px 20px;
            margin-top: 40px;
            text-align: center;
            border: none;
            color: #b87c4b;
            font-weight: 500;
            font-size: 0.85rem;
        }

        .restaurant-note i {
            margin-right: 8px;
            color: #d4a373;
        }

       /* ===========================
        RESPONSIVE DESIGN
=========================== */

/* Tablet */
@media (max-width:950px){

    .checkout-container{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        min-height:auto;
        position:relative;
        padding:20px;
    }

    .logo-area{
        margin-bottom:20px;
    }

    .nav-menu{
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
        gap:10px;
    }

    .back-link{
        margin-top:15px;
        border-top:none;
        padding-top:0;
    }

    .main-content{
        padding:24px;
    }

    .checkout-grid{
        flex-direction:column;
        gap:24px;
    }

    .checkout-form-col,
    .summary-col{
        width:100%;
    }

    .summary-card{
        position:relative;
        top:0;
    }

}


/* Mobile */
@media (max-width:650px){

    body{
        padding:0;
    }

    /* Bottom Navigation */

    .sidebar{
        position:fixed;
        bottom:0;
        left:0;
        width:100%;
        height:70px;
        background:#1f1f1f;
        border-top:1px solid #333;
        padding:0;
        z-index:999;
    }

    .logo-area,
    .user-greeting,
    .back-link{
        display:none;
    }

    .nav-menu{
        display:flex;
        flex-direction:row;
        justify-content:space-around;
        align-items:center;
        width:100%;
        height:100%;
        gap:0;
    }

    .nav-item{
        flex:1;
        padding:10px 0;
        justify-content:center;
        border-radius:0;
    }

    .nav-item a{
        justify-content:center;
    }

    .nav-item span{
        display:none;
    }

    .nav-item i{
        font-size:22px;
        margin:0;
    }

    /* Main Content */

    .main-content{
        padding:16px;
        padding-bottom:90px;
    }

    .hero-title{
        font-size:1.45rem;
        line-height:1.3;
    }

    .hero-sub{
        font-size:.85rem;
    }

    /* Cards */

    .form-card,
    .summary-card{
        padding:18px;
        border-radius:20px;
    }

    .form-card h2,
    .payment-section h2,
    .summary-card h2{
        font-size:1.2rem;
    }

    /* Form */

    .form-group{
        margin-bottom:16px;
    }

    .form-group label{
        font-size:.82rem;
    }

    .form-group input,
    .form-group textarea,
    .form-group select{
        font-size:.9rem;
        padding:12px;
        border-radius:14px;
    }

    .form-group textarea{
        min-height:90px;
    }

    /* Payment */

    .payment-method label{
        padding:12px;
        font-size:.9rem;
    }

    /* Totals */

    .total-row,
    .summary-total{
        font-size:1.15rem;
    }

    /* Order Summary */

    .order-item{
        flex-direction:column;
        align-items:flex-start;
        gap:4px;
        padding:12px 0;
    }

    .item-total{
        font-weight:700;
    }

    /* Button */

    .place-order-btn{
        width:100%;
        padding:14px;
        font-size:1rem;
    }

   
    .restaurant-note{
        margin-top:20px;
        margin-bottom:20px;
        padding:14px;
        font-size:.8rem;
    }

}
    </style>
</head>
<body>

<div class="checkout-container">
    <!-- LEFT SIDEBAR - FULL HEIGHT -->
    <aside class="sidebar">
        <div class="logo-area">
            <div class="logo">
                Welcome to<br><span>Eatland <i class="fas fa-utensils"></i></span>
            </div>
        </div>

        <div class="user-greeting">
            <!-- optional user greeting -->
        </div>

        <div class="nav-menu">
            <a href="ResturantServlet" class="nav-item">
                <i class="fas fa-home"></i> <span>Home</span>
            </a>
            <a href="CartServlet" class="nav-item">
                <i class="fas fa-shopping-cart"></i> <span>Cart</span>
            </a>
            <a href="#" class="nav-item active">
                <i class="fas fa-credit-card"></i> <span>Checkout</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-user"></i> <span>Profile</span>
            </a>
        </div>

        <div class="back-link">
            <a href="CartServlet">
                <i class="fas fa-arrow-left"></i> Back to Cart
            </a>
        </div>
    </aside>

    <!-- MAIN CONTENT: CHECKOUT -->
    <main class="main-content">
        <div class="hero-welcome">
            <h1 class="hero-title"><i class="fas fa-clipboard-check"></i> Checkout</h1>
            <p class="hero-sub">Complete your order and enjoy delicious food delivered to your doorstep. <i class="fas fa-motorcycle"></i></p>
        </div>

        <%
            User u = (User) request.getAttribute("user");
            List<Cart> items = (List<Cart>) request.getAttribute("items");
            if(items != null && !items.isEmpty()) {
        %>

        <div class="checkout-grid">
            <!-- LEFT: Checkout Form -->
            <div class="checkout-form-col">
                <div class="form-card">
                    <h2><i class="fas fa-map-pin"></i> Delivery Details</h2>

                    <form action="OrderServlet" method="post" id="checkoutForm">
                        <div class="form-group">
                            <label><i class="fas fa-user"></i> Full Name</label>
                            <input type="text" name="name" value="<%= u != null ? u.getUserName() : "" %>" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-phone"></i> Phone Number</label>
                            <input type="tel" name="phone" placeholder="Enter your phone number" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-envelope"></i> Email Address</label>
                            <input type="email" name="email" value="<%= u != null ? u.getEmail() : "" %>">
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-home"></i> Delivery Address</label>
                            <textarea rows="3" name="address" required><%= u != null && u.getAddress() != null ? u.getAddress() : "" %></textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-city"></i> City</label>
                            <input type="text" name="city" placeholder="Enter your city" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-mailbox"></i> Pincode</label>
                            <input type="text" name="pincode" placeholder="Enter pincode" required>
                        </div>

                        <div class="payment-section">
                            <h2><i class="fas fa-wallet"></i> Payment Method</h2>
                            <div class="payment-method">
                                <label>
                                    <input type="radio" name="payment" value="COD" checked>
                                    <i class="fas fa-money-bill-wave"></i> Cash On Delivery
                                </label>
                                
                            </div>
                        </div>

                        <div class="total-row">
                            <span>Total</span>
                            <span id="totalAmount">0.00</span>
                        </div>

                        <input type="hidden" name="totalAmount" id="hiddenTotal">
                        <input type="hidden" name="restaurantId" value="<%= items.get(0).getRestaurantId() %>">

                        <button type="submit" class="place-order-btn">
                            <i class="fas fa-check-circle"></i> Place Order
                        </button>
                    </form>
                </div>
            </div>

            <!-- RIGHT: Order Summary -->
            <div class="summary-col">
                <div class="summary-card">
                    <h2><i class="fas fa-receipt"></i> Order Summary</h2>

                    <%
                        for(Cart c : items){
                    %>
                    <div class="order-item">
                        <span class="item-name"><%= c.getName() %> x <%= c.getQuantity() %></span>
                        <span class="item-total" data-price="<%= c.getPrice() %>" data-quantity="<%= c.getQuantity() %>">0.00</span>
                    </div>
                    <%
                        }
                    %>

                    <div class="summary-total">
                        <span>Total</span>
                        <span id="summaryTotal">0.00</span>
                    </div>

                    <div class="secure-badge">
                        <i class="fas fa-lock"></i> Secure checkout · Your information is safe
                    </div>
                </div>
            </div>
        </div>

        <%
            } else {
        %>
        <div style="text-align: center; padding: 60px 20px; color: #7a6b5a;">
            <i class="fas fa-shopping-cart" style="font-size: 3rem; display: block; margin-bottom: 16px; color: #2a2a2a;"></i>
            <h3 style="color: #9a8b7a;">Your cart is empty</h3>
            <p style="margin-top: 8px;">Add items to your cart before checking out.</p>
            <a href="ResturantServlet" style="display: inline-block; margin-top: 20px; background: #d4a373; color: #1a1a1a; padding: 12px 32px; border-radius: 60px; text-decoration: none; font-weight: 600;">
                <i class="fas fa-arrow-left"></i> Browse Restaurants
            </a>
        </div>
        <%
            }
        %>

        <!-- footer note -->
        <div class="restaurant-note">
            <i class="fas fa-utensil-spoon"></i> Enjoy fresh, delicious meals delivered right to your door. <i class="fas fa-motorcycle"></i>
        </div>
    </main>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let total = 0;
        const items = document.querySelectorAll(".item-total");

        items.forEach(item => {
            const price = parseFloat(item.dataset.price);
            const quantity = parseInt(item.dataset.quantity);
            const subtotal = price * quantity;
            item.textContent = subtotal.toFixed(2);
            total += subtotal;
        });

        document.getElementById("totalAmount").textContent =  total.toFixed(2);
        document.getElementById("summaryTotal").textContent = total.toFixed(2);
        document.getElementById("hiddenTotal").value = total.toFixed(2);
    });
</script>

</body>
</html>