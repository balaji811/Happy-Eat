<%@ page import="com.tap.model.Cart" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <title>Happy Eat - Cart</title>
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
        .cart-container {
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

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin: 20px 0 20px 0;
        }

        .section-title {
            font-size: 1.6rem;
            font-weight: 700;
            color: #d4c9bc;
            letter-spacing: -0.2px;
        }

        .section-title i {
            color: #d4a373;
            margin-right: 10px;
        }

        .all-items-badge {
            background: #1f1f1f;
            padding: 6px 16px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.8rem;
            color: #d4a373;
        }

        .all-items-badge i {
            margin-right: 6px;
        }

        .cart-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 32px;
            margin-top: 10px;
        }

        .cart-items-col {
            flex: 2;
            min-width: 280px;
        }

        .cart-summary-col {
            flex: 1;
            min-width: 240px;
            background: #1f1f1f;
            border-radius: 28px;
            padding: 24px 22px;
            align-self: flex-start;
            border: none;
        }

        .cart-item {
            background: #1f1f1f;
            border-radius: 24px;
            padding: 16px 18px;
            margin-bottom: 16px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 14px;
            border: none;
            transition: all 0.2s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
        }

        .cart-item:hover {
            background: #242424;
            box-shadow: 0 8px 18px rgba(212, 163, 115, 0.06);
        }

        .item-img {
            width: 64px;
            height: 64px;
            background: #141414;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            overflow: hidden;
            border: 1px solid #2a2a2a;
        }

        .item-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .item-details {
            flex: 2;
            min-width: 130px;
        }

        .item-details h3 {
            font-size: 1.1rem;
            font-weight: 700;
            color: #d4c9bc;
        }

        .item-details .item-desc {
            font-size: 0.75rem;
            color: #7a6b5a;
            margin-top: 2px;
        }

        .item-price {
            font-weight: 700;
            color: #d4a373;
            font-size: 1.1rem;
            margin-left: 4px;
        }

        .item-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-left: auto;
            flex-wrap: wrap;
        }

        .qty-control {
            display: flex;
            align-items: center;
            gap: 4px;
            background: #171717;
            border-radius: 40px;
            padding: 2px 6px;
            border: 1px solid #2a2a2a;
        }

        .qty-control a {
            text-decoration: none;
            color: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
        }

        .qty-control button {
            background: transparent;
            border: none;
            font-size: 1.1rem;
            width: 30px;
            height: 30px;
            border-radius: 30px;
            cursor: pointer;
            color: #9a8b7a;
            transition: 0.15s;
            font-weight: 600;
        }

        .qty-control button:hover {
            background: #d4a373;
            color: #1a1a1a;
        }

        .qty-control span {
            font-weight: 700;
            min-width: 24px;
            text-align: center;
            color: #d4c9bc;
        }

        .remove-item {
            background: transparent;
            border: none;
            color: #7a6b5a;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.15s;
            padding: 6px;
        }

        .remove-item a {
            text-decoration: none;
            color: inherit;
        }

        .remove-item:hover {
            color: #c0392b;
        }

        .summary-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #d4c9bc;
            margin-bottom: 18px;
            border-bottom: 2px solid #2a2a2a;
            padding-bottom: 14px;
        }

        .summary-title i {
            color: #d4a373;
            margin-right: 8px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 0.95rem;
            color: #9a8b7a;
        }

        .summary-row.total {
            font-weight: 800;
            font-size: 1.2rem;
            border-top: 2px solid #2a2a2a;
            padding-top: 16px;
            margin-top: 12px;
            color: #d4c9bc;
        }

        .summary-row .amount {
            font-weight: 600;
            color: #d4a373;
        }

        .btn-checkout {
            background: linear-gradient(105deg, #b87c4b, #d4a373);
            color: #1a1a1a;
            border: none;
            width: 100%;
            padding: 16px 0;
            border-radius: 60px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 18px;
            transition: 0.2s;
            box-shadow: 0 6px 14px rgba(212, 163, 115, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            text-decoration: none;
        }

        .btn-checkout a {
            text-decoration: none;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 12px;
            width: 100%;
            justify-content: center;
        }

        .btn-checkout:hover {
            background: linear-gradient(105deg, #a06a3e, #b87c4b);
            transform: scale(0.98);
        }

        .btn-checkout i {
            color: #1a1a1a;
        }

        .empty-cart {
            text-align: center;
            padding: 50px 20px;
            color: #7a6b5a;
        }

        .empty-cart i {
            font-size: 3.5rem;
            color: #2a2a2a;
            margin-bottom: 16px;
        }

        .empty-cart h3 {
            font-weight: 600;
            color: #9a8b7a;
        }

        .empty-cart a {
            display: inline-block;
            margin-top: 20px;
            background: #d4a373;
            color: #1a1a1a;
            padding: 12px 32px;
            border-radius: 60px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s;
        }

        .empty-cart a:hover {
            background: #b87c4b;
            transform: scale(0.98);
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

        .success-toast {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background: #1f1f1f;
            color: #d4c9bc;
            padding: 12px 24px;
            border-radius: 60px;
            font-size: 0.9rem;
            font-weight: 600;
            z-index: 200;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            gap: 10px;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
            border: 1px solid #d4a373;
        }

        .success-toast.show {
            opacity: 1;
        }

        .success-toast i {
            color: #d4a373;
        }

.logout-section {
    margin-top: auto;
    padding-top: 20px;
    border-top: 1px solid #2a2a2a;
}

.logout .fa-sign-out-alt {
    color: #ff6b6b;
}

.logout:hover {
    background: #3a2020;
    color: #ff6b6b;
}



       /* ===========================
        RESPONSIVE DESIGN
=========================== */

/* Tablet */
@media (max-width:950px){

    .cart-container{
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

    .cart-grid{
        flex-direction:column;
        gap:20px;
    }

    .cart-summary-col{
        width:100%;
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

    /* Main */

    .main-content{
        padding:16px;
        padding-bottom:90px;
    }

    .hero-title{
        font-size:1.5rem;
        line-height:1.3;
    }

    .hero-sub{
        font-size:.85rem;
    }

    .section-title{
        font-size:1.2rem;
    }

    .section-header{
        gap:10px;
    }

    .all-items-badge{
        font-size:.75rem;
        padding:6px 12px;
    }

    /* Cart Layout */

    .cart-grid{
        flex-direction:column;
        gap:18px;
    }

    .cart-summary-col{
        width:100%;
        border-radius:20px;
        padding:18px;
        order:-1;
    }

 

    .cart-item{
        flex-direction:column;
        align-items:flex-start;
        border-radius:20px;
        padding:16px;
        gap:14px;
    }

    .item-img{
        width:80px;
        height:80px;
        border-radius:16px;
    }

    .item-details{
        width:100%;
    }

    .item-details h3{
        font-size:1rem;
    }

    .item-desc{
        font-size:.75rem;
    }

    .item-price{
        font-size:1rem;
        margin:0;
    }

    .item-actions{
        width:100%;
        margin-left:0;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }

    .qty-control{
        padding:4px 8px;
    }

    .qty-control button{
        width:32px;
        height:32px;
        font-size:1rem;
    }

    .remove-item{
        font-size:1.1rem;
    }

    /* Summary */

    .summary-title{
        font-size:1.15rem;
    }

    .summary-row{
        font-size:.9rem;
    }

    .summary-row.total{
        font-size:1.05rem;
    }

    .btn-checkout{
        font-size:.9rem;
        padding:14px;
    }

    /* Empty Cart */

    .empty-cart{
        padding:40px 10px;
    }

    .empty-cart i{
        font-size:3rem;
    }

    .empty-cart h3{
        font-size:1.2rem;
    }

    .restaurant-note{
        margin-bottom:20px;
        padding:14px;
        font-size:.8rem;
    }

}
    </style>
</head>
<body>

    <div class="cart-container">
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
                <a href="CartServlet" class="nav-item active">
                    <i class="fas fa-shopping-cart"></i> <span>Cart</span>
                </a>
                
                 <div class="nav-item">
                <a href="ViewOrdersServlet">
                    <i class="fas fa-receipt"></i> <span>Orders</span>
                </a>
            </div>
            
            
                <a href="AccountServlet" class="nav-item">
                    <i class="fas fa-user"></i> <span>Profile</span>
                </a>
                
                
                
            </div>

              <div class="logout-section">
        <div class="nav-item logout">
            <a href="LogoutServlet">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>
        </aside>

        <!-- MAIN CONTENT: CART -->
        <main class="main-content">
            <div class="hero-welcome">
                <h1 class="hero-title"><i class="fas fa-shopping-bag"></i> Your Cart</h1>
                <p class="hero-sub">Review your items and proceed to checkout. <i class="fas fa-rocket"></i></p>
            </div>

            <div class="section-header">
                <h2 class="section-title"><i class="fas fa-utensils"></i> Cart Items</h2>
                <div class="all-items-badge" id="cartItemCount"><i class="fas fa-box"></i> <span id="itemCountDisplay">0</span> items</div>
            </div>
               
            <%
                List<Cart> cart = (List<Cart>) request.getAttribute("items");
                if(cart != null && !cart.isEmpty()) {
            %>
               
            <!-- cart grid -->
            <div class="cart-grid">
                <!-- left: cart items -->
                <div class="cart-items-col" id="cartItemsContainer">
                    <%
                        for(Cart c : cart){
                    %>
                    <div class="cart-item" data-id="<%= c.getMenuId() %>">
                        <div class="item-img">
                            <img src="<%= c.getImagePath() != null ? c.getImagePath() : "https://via.placeholder.com/64/1f1f1f/d4a373?text=Food" %>" alt="<%= c.getName() %>" />
                        </div>
                        <div class="item-details">
                            <h3><%= c.getName() %></h3>
                            <div class="item-desc"><i class="fas fa-tag"></i> Item</div>
                        </div> 
                        <div class="item-price"><%= String.format("%.2f", c.getPrice()) %></div>
                        <div class="item-actions">
                            <div class="qty-control">
                                <button><a href="UpdateCartServlet?menuId=<%=c.getMenuId() %>&action=dec">-</a></button>
                                <span class="qty-value"><%= c.getQuantity() %></span>
                                <button><a href="UpdateCartServlet?menuId=<%=c.getMenuId() %>&action=inc">+</a></button>
                            </div>
                            <button class="remove-item"><a href="DeleteCartItem?cartId=<%=c.getCartId() %>"><i class="fas fa-trash-alt"></i></a></button>
                        </div>
                    </div>
                    <% 
                        }
                    %>
                </div>

                <!-- right: summary -->
                <div class="cart-summary-col" id="summaryCol">
                    <div class="summary-title"><i class="fas fa-receipt"></i> Order Summary</div>
                    <div id="summaryDetails">
                        <div class="summary-row"><span>Subtotal</span><span class="amount" id="subtotalAmount">0.00</span></div>
                        <div class="summary-row"><span>Delivery fee</span><span class="amount" id="deliveryFee">$2.50</span></div>
                        <div class="summary-row total"><span>Total</span><span class="amount" id="totalAmount">0.00</span></div>
                    </div>
                    <button class="btn-checkout" id="checkoutBtn"><a href="CheckoutSevlet"><i class="fas fa-credit-card"></i> Proceed to Checkout</a></button>
                    <div style="margin-top: 14px; font-size:0.7rem; color:#7a6b5a; text-align:center;">
                        <i class="fas fa-lock" style="margin-right:6px; color:#d4a373;"></i> Secure checkout
                    </div>
                </div>
            </div>

            <%
                } else {
            %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p style="margin-top: 8px; color: #7a6b5a;">Browse restaurants and add delicious items!</p>
                <a href="ResturantServlet">
                    <i class="fas fa-arrow-left"></i> Explore Restaurants
                </a>
            </div>
            <%
                }
            %>

            <!-- footer note -->
            <div class="restaurant-note">
                <i class="fas fa-utensil-spoon"></i> Hungry? Add more from your favourite restaurants and enjoy delicious meals delivered fast. <i class="fas fa-motorcycle"></i>
            </div>
        </main>
    </div>

    <!-- toast (hidden by default) -->
    <div id="toastMsg" class="success-toast"><i class="fas fa-check-circle"></i> <span id="toastText"></span></div>
    
    <%
        Boolean confirm = (Boolean) request.getAttribute("confirm");
        Integer menuId = (Integer) request.getAttribute("menuId");

        if(confirm != null && confirm){
    %>

    <script>
        let choice = window.confirm(
            "Your cart contains items from another restaurant.\n\n" +
            "Do you want to remove them and add this item?"
        );

        if(choice){
            window.location.href = "ClearCartAndAddServlet?menuId=<%= menuId %>";
        }else{
            window.location.href = "CartServlet";
        }
    </script>

    <%
        }
    %>

    <!-- Cart update scripts -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            
            function updateTotals() {
                const items = document.querySelectorAll('.cart-item');
                let subtotal = 0;
                items.forEach(item => {
                    const priceText = item.querySelector('.item-price').textContent.replace('$', '');
                    const price = parseFloat(priceText) || 0;
                    const qty = parseInt(item.querySelector('.qty-value').textContent) || 1;
                    subtotal += price * qty;
                });
                
                const deliveryFee = 2.50;
                const total = subtotal + deliveryFee;
                
                document.getElementById('subtotalAmount').textContent =  subtotal.toFixed(2);
                document.getElementById('totalAmount').textContent = total.toFixed(2);
                document.getElementById('itemCountDisplay').textContent = items.length;
            }
            
            updateTotals();
            
            function showToast(message) {
                const toast = document.getElementById('toastMsg');
                const toastText = document.getElementById('toastText');
                toastText.textContent = message;
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
        });
    </script>

</body>
</html>