<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Happy Eat · My Account</title>
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

    /* ----- FULL-WIDTH WRAPPER (same as restaurant-home) ----- */
    .account-wrapper {
      display: flex;
      flex-wrap: nowrap;
      width: 100%;
      min-height: 100vh;
      background: transparent;
      margin: 0;
      border: none;
      border-radius: 0;
    }

    /* ========= SIDEBAR: FULL HEIGHT, DARK, STICKY ========= */
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

    /* ========= MAIN CONTENT: SAME PADDING / STYLE ========= */
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

    /* ---------- ACCOUNT CARD: FULL WIDTH (max-width removed) ---------- */
    .account-card {
      width: 100%;
      background: #1f1f1f;
      border-radius: 32px;
      padding: 32px 34px 34px 34px;
      box-shadow: 0 12px 28px rgba(0, 0, 0, 0.6);
      border: 1px solid #2a2a2a;
      margin-top: 6px;
      transition: all 0.2s;
    }

    /* optional: two-column layout for larger screens */
    .account-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 24px 32px;
    }

    .profile-header {
      display: flex;
      align-items: center;
      gap: 20px;
      margin-bottom: 30px;
      border-bottom: 2px solid #2a2a2a;
      padding-bottom: 22px;
      flex-wrap: wrap;
      grid-column: 1 / -1;  /* span full width */
    }

    .profile-avatar {
      width: 80px;
      height: 80px;
      background: #2c2c2c;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2.4rem;
      font-weight: 700;
      color: #d4a373;
      border: 2px solid #d4a373;
      box-shadow: 0 6px 14px rgba(212, 163, 115, 0.08);
      flex-shrink: 0;
    }

    .profile-title h2 {
      font-size: 1.6rem;
      font-weight: 700;
      color: #d4c9bc;
      letter-spacing: -0.3px;
    }

    .profile-title p {
      color: #9a8b7a;
      font-weight: 400;
      font-size: 0.9rem;
      margin-top: 4px;
    }

    .profile-title p i {
      color: #d4a373;
      margin-right: 6px;
    }

    .input-group {
      margin-bottom: 20px;
    }

    .input-group label {
      display: block;
      font-weight: 600;
      font-size: 0.85rem;
      color: #b8aa9a;
      margin-bottom: 6px;
      letter-spacing: -0.2px;
    }

    .input-group label i {
      color: #d4a373;
      margin-right: 8px;
      width: 18px;
    }

    .input-group input,
    .input-group textarea {
      width: 100%;
      padding: 12px 16px;
      background: #141414;
      border: 1px solid #2a2a2a;
      border-radius: 20px;
      color: #e0d5c8;
      font-size: 0.95rem;
      font-family: 'Inter', sans-serif;
      transition: border 0.2s, box-shadow 0.2s;
    }

    .input-group input:focus,
    .input-group textarea:focus {
      outline: none;
      border-color: #d4a373;
      box-shadow: 0 0 0 3px rgba(212, 163, 115, 0.15);
      background: #1a1a1a;
    }

    .input-group input[readonly] {
      opacity: 0.7;
      cursor: not-allowed;
      background: #1a1a1a;
      border-color: #2a2a2a;
    }

    .input-group textarea {
      resize: vertical;
      min-height: 80px;
    }

    .buttons {
      display: flex;
      gap: 14px;
      margin-top: 28px;
      flex-wrap: wrap;
      grid-column: 1 / -1;  /* span full width */
    }

    .btn {
      padding: 12px 28px;
      border: none;
      border-radius: 60px;
      font-weight: 700;
      font-size: 0.9rem;
      display: inline-flex;
      align-items: center;
      gap: 10px;
      cursor: pointer;
      transition: all 0.2s ease;
      background: #2c2c2c;
      color: #d4c9bc;
      flex: 1 1 auto;
      justify-content: center;
    }

    .btn i {
      font-size: 1rem;
    }

    .btn-update {
      background: #d4a373;
      color: #1a1a1a;
      box-shadow: 0 4px 12px rgba(212, 163, 115, 0.15);
    }

    .btn-update:hover {
      background: #c48a5a;
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(212, 163, 115, 0.2);
    }

    .btn-cancel {
      background: #2a2a2a;
      color: #9a8b7a;
      border: 1px solid #3d3d3d;
    }

    .btn-cancel:hover {
      background: #333;
      color: #d4c9bc;
    }

    .account-note {
      margin-top: 30px;
      background: #181818;
      border-radius: 24px;
      padding: 16px 20px;
      text-align: center;
      border: 1px solid #2a2a2a;
      color: #b87c4b;
      font-weight: 500;
      font-size: 0.85rem;
      grid-column: 1 / -1;
    }

    .account-note i {
      margin-right: 8px;
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

    .account-wrapper{
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

    .account-card{
        padding:24px;
    }

    .account-grid{
        grid-template-columns:1fr;
        gap:20px;
    }

    .profile-header{
        grid-column:1;
    }

    .buttons{
        grid-column:1;
    }

    .account-note{
        grid-column:1;
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

    /* Main Content */

    .main-content{
        padding:16px;
        padding-bottom:90px;
    }

    /* Header */

    .hero-title{
        font-size:1.45rem;
        line-height:1.3;
    }

    .hero-sub{
        font-size:.85rem;
    }

    /* Account Card */

    .account-card{
        border-radius:20px;
        padding:18px;
    }

    .account-grid{
        display:block;
    }

    /* Profile */

    .profile-header{
        flex-direction:column;
        align-items:center;
        text-align:center;
        gap:14px;
        padding-bottom:18px;
    }

    .profile-avatar{
        width:70px;
        height:70px;
        font-size:2rem;
    }

    .profile-title h2{
        font-size:1.3rem;
    }

    .profile-title p{
        font-size:.82rem;
    }

    /* Form */

    .input-group{
        margin-bottom:16px;
    }

    .input-group label{
        font-size:.82rem;
    }

    .input-group input,
    .input-group textarea{
        font-size:.9rem;
        padding:12px 14px;
        border-radius:16px;
    }

    .input-group textarea{
        min-height:90px;
    }

    /* Buttons */

    .buttons{
        display:flex;
        flex-direction:column;
        gap:12px;
        margin-top:20px;
    }

    .btn{
        width:100%;
        justify-content:center;
        font-size:.9rem;
        padding:13px;
    }

    /* Notes */

    .account-note{
        margin-top:20px;
        padding:14px;
        font-size:.8rem;
    }

    /* Footer */

    .main-content > div:last-child{
        margin-bottom:20px;
        padding:14px;
        font-size:.8rem;
    }

}
  </style>
</head>
<body>
<div class="account-wrapper">
  <!-- LEFT SIDEBAR - FULL HEIGHT (IDENTICAL TO RESTAURANT HOME) -->
  <aside class="sidebar">
    <div class="logo-area">
      <div class="logo">
        Welcome to<br><span>Eatland <i class="fas fa-utensils"></i></span>
      </div>
    </div>
    
    <div class="user-greeting">
      <!-- optional -->
    </div>
    
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
      
       <div class="nav-item">
                <a href="ViewOrdersServlet">
                    <i class="fas fa-receipt"></i> <span>Orders</span>
                </a>
            </div>
      
      <div class="nav-item active">
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
      <h1 class="hero-title"><i class="fas fa-user-circle"></i> My Account</h1>
      <p class="hero-sub">Manage your profile, address, and preferences <i class="fas fa-pen-fancy"></i></p>
    </div>

    <!-- ACCOUNT CARD - FULL WIDTH with grid for two columns -->
    <div class="account-card">
      <div class="account-grid">
        <!-- Profile header spans full width -->
        <div class="profile-header">
          <div class="profile-avatar">
            <i class="fas fa-user"></i>
          </div>
          <div class="profile-title">
            <h2>Your Profile</h2>
            <p><i class="fas fa-edit"></i> Update your details below</p>
          </div>
        </div>

  <%  User user = (User) request.getAttribute("user"); %>

        <form action="AccountServlet" method="post" style="grid-column: 1 / -1; display: contents;">
          <!-- left column -->
          <div>
            <div class="input-group">
              <label for="username"><i class="fas fa-user-tag"></i> Username</label>
              <input type="text" id="username" name="username" value="<%= user.getUserName() %>" placeholder="Your username">
            </div>

            <div class="input-group">
              <label for="email"><i class="fas fa-envelope"></i> Email</label>
              <input type="email" id="email" name="email" value="<%= user.getEmail() %>" placeholder="your@email.com" readonly>
            </div>
          </div>

          <!-- right column -->
          <div>
            <div class="input-group">
              <label for="address"><i class="fas fa-location-dot"></i> Address</label>
              <textarea id="address" name="address" placeholder="Your delivery address"><%= user.getAddress() %></textarea>
            </div>

            <div class="input-group">
              <label for="role"><i class="fas fa-shield-alt"></i> Role</label>
              <input type="text" id="role" name="role" value="<%= user.getRole() %>" readonly>
            </div>

            <div class="input-group">
              <label for="password"><i class="fas fa-lock"></i> Password</label>
              <input type="password" id="password" name="password" value="<%= user.getPassword() %>" placeholder="New password">
            </div>
          </div>

          <!-- buttons span full width -->
          <div class="buttons">
            <button type="submit" class="btn btn-update"><i class="fas fa-check-circle"></i> Update Profile</button>
            <button type="reset" class="btn btn-cancel"><i class="fas fa-undo-alt"></i> Cancel</button>
          </div>
        </form>

        <div class="account-note">
          <i class="fas fa-shield-check"></i> Your data is safe and will never be shared.
        </div>
      </div> <!-- end account-grid -->
    </div> <!-- end account-card -->

    <!-- small extra note (matches restaurant-note style) -->
    <div style="margin-top: 30px; background: #1f1f1f; border-radius: 24px; padding: 14px 20px; border: none; color: #7a6b5a; font-size: 0.8rem; text-align: center;">
      <i class="fas fa-utensil-spoon" style="color: #d4a373;"></i> 
      <span style="color: #b87c4b;">Happy Eat</span> — manage your account, track orders, and savour every bite.
    </div>
  </main>
</div>
</body>
</html>