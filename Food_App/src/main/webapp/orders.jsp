<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.OrderDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Happy Eat · My Orders</title>
  <!-- Google Fonts + Inter -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet">
  <!-- Font Awesome 6 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
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
      display: flex;
      align-items: stretch;
      min-height: 100vh;
    }

    .orders-wrapper {
      display: flex;
      flex-wrap: nowrap;
      width: 100%;
      min-height: 100vh;
      background: transparent;
      margin: 0;
      border: none;
      border-radius: 0;
    }

    /* ========= SIDEBAR ========= */
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

    /* ========= MAIN CONTENT ========= */
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
      margin-right: 8px;
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

    /* ---------- ORDER CARD ---------- */
    .order-card {
      background: #1f1f1f;
      border-radius: 28px;
      padding: 24px 28px 28px 28px;
      margin-bottom: 24px;
      border: 1px solid #2a2a2a;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
      transition: all 0.2s ease;
    }

    .order-card:hover {
      background: #242424;
      border-color: #3d3d3d;
    }

    .order-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      margin-bottom: 16px;
      border-bottom: 1px solid #2a2a2a;
      padding-bottom: 14px;
    }

    .restaurant-name {
      font-size: 1.4rem;
      font-weight: 800;
      color: #d4c9bc;
      letter-spacing: -0.3px;
    }

    .restaurant-name i {
      color: #d4a373;
      margin-right: 10px;
    }

    .status-badge {
      padding: 6px 20px;
      border-radius: 60px;
      font-weight: 700;
      font-size: 0.75rem;
      text-transform: uppercase;
      letter-spacing: 0.3px;
      background: #2a2a2a;
      color: #9a8b7a;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .status-badge i {
      font-size: 0.7rem;
    }

    .status-badge.delivered {
      background: #1e3a2a;
      color: #7bcfa6;
    }

    .status-badge.preparing {
      background: #3d2e1a;
      color: #e8c88a;
    }

    .status-badge.cancelled {
      background: #3d1a1a;
      color: #e88a8a;
    }

    .status-badge.pending {
      background: #2a2a3d;
      color: #aab8e8;
    }

    .order-details-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 12px 20px;
      margin: 16px 0 12px 0;
    }

    .order-details-grid p {
      font-size: 0.9rem;
      color: #b8aa9a;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .order-details-grid p i {
      color: #d4a373;
      width: 20px;
      text-align: center;
    }

    .order-details-grid p b {
      color: #d4c9bc;
      font-weight: 600;
      margin-right: 4px;
    }

    .order-items {
      margin-top: 12px;
      padding-top: 14px;
      border-top: 1px solid #2a2a2a;
    }

    .order-items .items-label {
      font-weight: 700;
      color: #b8aa9a;
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .order-items .items-label i {
      color: #d4a373;
    }

    .order-items ul {
      list-style: none;
      margin-top: 8px;
      display: flex;
      flex-wrap: wrap;
      gap: 8px 16px;
    }

    .order-items ul li {
      background: #141414;
      padding: 6px 16px;
      border-radius: 40px;
      font-size: 0.85rem;
      color: #d4c9bc;
      border: 1px solid #2a2a2a;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .order-items ul li i {
      color: #d4a373;
      font-size: 0.7rem;
    }

    .order-actions {
      margin-top: 18px;
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
      padding-top: 14px;
      border-top: 1px solid #2a2a2a;
    }

    .btn {
      padding: 10px 22px;
      border: none;
      border-radius: 60px;
      font-weight: 700;
      font-size: 0.8rem;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      cursor: pointer;
      transition: all 0.2s ease;
      background: #2c2c2c;
      color: #d4c9bc;
    }

    .btn i {
      font-size: 0.9rem;
    }

    .btn-view {
      background: #2c2c3d;
      color: #aab8e8;
    }

    .btn-view:hover {
      background: #3a3a50;
      transform: translateY(-2px);
    }

    .btn-reorder {
      background: #d4a373;
      color: #1a1a1a;
      box-shadow: 0 4px 12px rgba(212, 163, 115, 0.12);
    }

    .btn-reorder:hover {
      background: #c48a5a;
      transform: translateY(-2px);
    }

    .btn-invoice {
      background: #2a2a2a;
      color: #9a8b7a;
      border: 1px solid #3d3d3d;
    }

    .btn-invoice:hover {
      background: #333;
      color: #d4c9bc;
    }

    .orders-note {
      margin-top: 30px;
      background: #1f1f1f;
      border-radius: 24px;
      padding: 16px 20px;
      text-align: center;
      border: 1px solid #2a2a2a;
      color: #b87c4b;
      font-weight: 500;
      font-size: 0.85rem;
    }

    .orders-note i {
      margin-right: 8px;
      color: #d4a373;
    }

    /* empty state */
    .empty-orders {
      text-align: center;
      padding: 60px 20px;
      color: #7a6b5a;
    }

    .empty-orders i {
      font-size: 3rem;
      color: #d4a373;
      margin-bottom: 16px;
      display: block;
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

    .orders-wrapper{
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

    .main-content{
        padding:24px;
    }

    .order-card{
        padding:20px;
    }

    .order-details-grid{
        grid-template-columns:repeat(2,1fr);
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
    .user-greeting{
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
        font-size:1.45rem;
        line-height:1.3;
    }

    .hero-sub{
        font-size:.85rem;
    }

    /* Order Card */

    .order-card{
        border-radius:20px;
        padding:16px;
    }

    .order-top{
        flex-direction:column;
        align-items:flex-start;
        gap:12px;
    }

    .restaurant-name{
        font-size:1.15rem;
    }

    .status-badge{
        font-size:.72rem;
    }

    /* Order Details */

    .order-details-grid{
        grid-template-columns:1fr;
        gap:10px;
    }

    .order-details-grid p{
        font-size:.82rem;
        word-break:break-word;
    }

    /* Ordered Items */

    .order-items ul{
        flex-direction:column;
        gap:8px;
    }

    .order-items ul li{
        width:100%;
        justify-content:flex-start;
        border-radius:12px;
        padding:10px 14px;
    }

    /* Buttons */

    .order-actions{
        flex-direction:column;
        gap:10px;
    }

    .btn{
        width:100%;
        justify-content:center;
        font-size:.85rem;
        padding:12px;
    }

    /* Empty Orders */

    .empty-orders{
        padding:40px 12px;
    }

    .empty-orders i{
        font-size:3rem;
    }

    .empty-orders p:first-of-type{
        font-size:1.2rem;
    }

   

    .orders-note{
        margin-bottom:20px;
        padding:14px;
        font-size:.8rem;
    }

}
  </style>
</head>
<body>
<div class="orders-wrapper">
  <!-- LEFT SIDEBAR -->
  <aside class="sidebar">
    <div class="logo-area">
      <div class="logo">
        Welcome to<br><span>Eatland <i class="fas fa-utensils"></i></span>
      </div>
    </div>
    
    <div class="user-greeting"></div>
    
    <div class="nav-menu">
      <div class="nav-item">
        <a href="ResturantServlet">
          <i class="fas fa-home"></i> <span>Home</span>
        </a>
      </div>
      <div class="nav-item">
        <a href="CartServlet">
          <i class="fas fa-shopping-cart"></i> <span>Cart</span>
        </a>
      </div>
       <div class="nav-item active">
                <a href="ViewOrdersServlet">
                    <i class="fas fa-receipt"></i> <span>Orders</span>
                </a>
            </div>
      <div class="nav-item ">
        <a href="AccountServlet">
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
      
      
      
    </div>
  </aside>

  <!-- MAIN CONTENT -->
  <main class="main-content">
    <div class="hero-welcome">
      <h1 class="hero-title"><i class="fas fa-clipboard-list"></i> My Orders</h1>
      <p class="hero-sub">Track your past and current orders, reorder favourites, and download invoices <i class="fas fa-receipt"></i></p>
    </div>

    <!-- ORDERS LIST - using actual request attribute -->
    <%
      List<OrderDetails> orders = (List<OrderDetails>) request.getAttribute("orders");
    %>

    <%
      if (orders != null && !orders.isEmpty()) {
          for (OrderDetails o : orders) {
              String statusClass = o.getOrderStatus().toLowerCase();
              String statusDisplay = o.getOrderStatus();
    %>

    <div class="order-card">
      <div class="order-top">
        <span class="restaurant-name"><i class="fas fa-store"></i> <%= o.getRestaurantName() %></span>
        <span class="status-badge <%= statusClass %>">
          <i class="fas fa-circle"></i> <%= statusDisplay %>
        </span>
      </div>

      <div class="order-details-grid">
        <p><i class="fas fa-hashtag"></i> <b>Order ID:</b> #<%= o.getOrderId() %></p>
        <p><i class="fas fa-user"></i> <b>Name:</b> <%= o.getCustomerName() %></p>
        <p><i class="fas fa-phone"></i> <b>Phone:</b> <%= o.getPhone() %></p>
        <p><i class="fas fa-rupee-sign"></i> <b>Total:</b> <%= String.format("%.2f", o.getTotalAmount()) %></p>
        <p><i class="fas fa-credit-card"></i> <b>Payment:</b> <%= o.getPaymentMethod() %></p>
        <p><i class="fas fa-location-dot"></i> <b>Address:</b> <%= o.getDeliveryAddress() %></p>
      </div>

      <div class="order-items">
        <div class="items-label"><i class="fas fa-utensils"></i> Ordered Items</div>
        <ul>
          <%
            String itemsStr = o.getOrderedItems();
            if (itemsStr != null && !itemsStr.isEmpty()) {
              String[] items = itemsStr.split(",");
              for (String item : items) {
          %>
            <li><i class="fas fa-check-circle"></i> <%= item.trim() %></li>
          <%
              }
            } else {
          %>
            <li style="color: #7a6b5a;">No items listed</li>
          <%
            }
          %>
        </ul>
      </div>

     
    </div>

    <%
          }
      } else {
    %>
      <div class="empty-orders">
        <i class="fas fa-box-open"></i>
        <p style="font-size: 1.2rem; color: #b8aa9a;">No orders yet</p>
        <p style="color: #7a6b5a; margin-top: 6px;">Explore our restaurants and place your first order!</p>
        <a href="restaurantHome.jsp" style="display: inline-block; margin-top: 20px; padding: 12px 32px; background: #d4a373; color: #1a1a1a; border-radius: 60px; text-decoration: none; font-weight: 700;">Browse Restaurants</a>
      </div>
    <%
      }
    %>

    <!-- footer note -->
    <div class="orders-note">
      <i class="fas fa-shopping-bag"></i> Your orders are always fresh and delivered with care. <i class="fas fa-heart" style="color: #d4a373;"></i>
    </div>
  </main>
</div>
</body>
</html>