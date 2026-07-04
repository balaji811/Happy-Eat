<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Happy Eat - Menu</title>
    <!-- Google Fonts + Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            padding: 0;               /* no padding, full screen */
            min-height: 100vh;
            display: flex;
            align-items: stretch;
        }

        /* ----- MAIN WRAPPER: FULL SCREEN, NO BORDER, NO SHADOW ----- */
        .menu-container {
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
            min-height: 100vh;           /* full viewport height */
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
            text-decoration: none;
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

        .restaurant-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        /* ========= MAIN CONTENT: FILL REMAINING SPACE ========= */
        .main-content {
            flex: 1;
            background: transparent;
            padding: 32px 40px 40px 40px;
            min-height: 100vh;
            overflow-y: auto;
        }

        /* restaurant info header */
        .restaurant-header-section {
            background: #1f1f1f;
            border-radius: 28px;
            padding: 28px 32px;
            margin-bottom: 32px;
            border: none;
        }

        .restaurant-header-section h1 {
            font-size: 2rem;
            font-weight: 800;
            color: #d4c9bc;
            margin-bottom: 8px;
        }

        .restaurant-header-section h1 i {
            color: #d4a373;
            margin-right: 10px;
        }

        .restaurant-header-section p {
            color: #9a8b7a;
            font-size: 0.95rem;
        }

        .restaurant-header-section p i {
            color: #d4a373;
            margin-right: 6px;
        }

        .restaurant-badge {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            margin-top: 16px;
        }

        .restaurant-badge span {
            display: flex;
            align-items: center;
            gap: 6px;
            background: #171717;
            padding: 6px 14px;
            border-radius: 40px;
            font-size: 0.8rem;
            font-weight: 500;
            color: #d4a373;
            border: 1px solid #2a2a2a;
        }

        .restaurant-badge span i {
            color: #d4a373;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin: 28px 0 20px 0;
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

        .items-count {
            background: #1f1f1f;
            padding: 6px 16px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.8rem;
            color: #d4a373;
        }

        .items-count i {
            margin-right: 6px;
        }

        /* filter chips */
        .filter-chips {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 32px;
            border-bottom: 1px solid #2a2a2a;
            padding-bottom: 16px;
        }

        .chip {
            padding: 8px 22px;
            border-radius: 40px;
            background: #1f1f1f;
            font-weight: 600;
            font-size: 0.85rem;
            color: #9a8b7a;
            cursor: pointer;
            transition: all 0.2s;
            border: 1px solid #2a2a2a;
        }

        .chip.active {
            background: #d4a373;
            color: #1a1a1a;
            border-color: #d4a373;
            box-shadow: 0 4px 12px rgba(212, 163, 115, 0.15);
        }

        .chip:not(.active):hover {
            background: #2a2a2a;
            color: #d4c9bc;
            border-color: #3d3d3d;
        }

        .chip i {
            margin-right: 6px;
        }

        /* menu items grid */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
            gap: 24px;
            margin-bottom: 30px;
        }

        .menu-card {
            background: #1f1f1f;
            border-radius: 24px;
            border: none;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            display: flex;
            flex-direction: column;
        }

        .menu-card:hover {
            transform: translateY(-4px);
            background: #242424;
            box-shadow: 0 20px 30px -12px rgba(212, 163, 115, 0.08);
        }

        .menu-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            background: #141414;
        }

        .menu-content {
            padding: 18px 20px 20px 20px;
            flex: 1;
        }

        .menu-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 8px;
            flex-wrap: wrap;
        }

        .menu-name {
            font-weight: 800;
            font-size: 1.2rem;
            color: #d4c9bc;
        }

        .menu-price {
            font-weight: 700;
            font-size: 1.1rem;
            color: #d4a373;
        }

        .menu-description {
            color: #7a6b5a;
            font-size: 0.8rem;
            line-height: 1.4;
            margin: 10px 0;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .veg-badge, .nonveg-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            font-size: 0.7rem;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 30px;
            margin-top: 8px;
        }

        .veg-badge {
            background: #1a3a1a;
            color: #8bc34a;
            border: 1px solid #2e5a2e;
        }

        .nonveg-badge {
            background: #3a1a1a;
            color: #ef5350;
            border: 1px solid #5a2e2e;
        }

        .order-btn {
            margin-top: 16px;
            padding-top: 12px;
            border-top: 1px solid #2a2a2a;
        }

        .order-now {
            width: 100%;
            background: linear-gradient(105deg, #b87c4b, #d4a373);
            color: #1a1a1a;
            border: none;
            padding: 10px 20px;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            text-decoration: none;
        }

        .order-now:hover {
            background: linear-gradient(105deg, #a06a3e, #b87c4b);
            transform: scale(1.02);
        }

        .order-now a {
            text-decoration: none;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 8px;
            width: 100%;
            justify-content: center;
        }

        .order-now i {
            color: #1a1a1a;
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
            margin: 0 6px;
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

    .menu-container{
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

    .menu-grid{
        grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
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

    /* Restaurant Header */

    .restaurant-header-section{
        padding:20px;
        border-radius:20px;
    }

    .restaurant-header-section h1{
        font-size:1.5rem;
        line-height:1.3;
    }

    .restaurant-header-section p{
        font-size:.85rem;
    }

    .restaurant-badge{
        gap:10px;
    }

    .restaurant-badge span{
        font-size:.75rem;
        padding:6px 12px;
    }

    /* Section */

    .section-title{
        font-size:1.2rem;
    }

    .items-count{
        font-size:.75rem;
        padding:6px 12px;
    }

    .section-header{
        gap:10px;
    }


    .filter-chips{
        flex-wrap:nowrap;
        overflow-x:auto;
        gap:10px;
        padding-bottom:10px;
        scrollbar-width:none;
    }

    .filter-chips::-webkit-scrollbar{
        display:none;
    }

    .chip{
        white-space:nowrap;
        flex-shrink:0;
        padding:8px 18px;
        font-size:.8rem;
    }

    /* Menu Cards */

    .menu-grid{
        grid-template-columns:1fr;
        gap:18px;
    }

    .menu-card{
        border-radius:20px;
    }

    .menu-image{
        height:180px;
    }

    .menu-content{
        padding:16px;
    }

    .menu-header{
        gap:8px;
    }

    .menu-name{
        font-size:1.1rem;
    }

    .menu-price{
        font-size:1rem;
    }

    .menu-description{
        font-size:.8rem;
    }

    .veg-badge,
    .nonveg-badge{
        font-size:.72rem;
    }

    .order-now{
        font-size:.85rem;
        padding:12px;
    }

    .restaurant-note{
        margin-bottom:20px;
        font-size:.8rem;
        padding:14px;
    }

}
    </style>
</head>
<body>
<div class="menu-container">
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
            <div class="nav-item">
                <a href="ResturantServlet">
                    <i class="fas fa-home"></i> <span>Home</span>
                </a>
            </div>
            <div class="nav-item active">
                <i class="fas fa-utensils"></i> <span>Menu</span>
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
            <div class="nav-item">
                <a href="AccountServlet">
                    <i class="fas fa-user"></i> <span>Profile</span>
                </a>
            </div>
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

    <!-- MAIN CONTENT - MENU ITEMS -->
    <main class="main-content">
        <!-- Restaurant Header -->
        <div class="restaurant-header-section">
        
        <%
            String name2 = (String) request.getAttribute("resturantName");
            String cusine = (String) request.getAttribute("resturantCusine");
            Double rating = (Double) request.getAttribute("restaurantRating");
            Integer deliveryTime = (Integer) request.getAttribute("resturantTime");
        %>
        
            <h1><i class="fas fa-store"></i> <%= name2 %></h1>
            <p><i class="fas fa-map-marker-alt"></i> <%= cusine %></p>
            <div class="restaurant-badge">
                <span><i class="fas fa-star"></i> <%= rating %></span>
                <span><i class="fas fa-clock"></i> Delivery in <%= deliveryTime %> min</span>
                <span><i class="fas fa-tag"></i> <%= cusine %></span>
            </div>
        </div>

        <%
            int count = 0;
            List<Menu> li = (List<Menu>) request.getAttribute("arr");
            if(li != null) {
                count = li.size();
            }
        %>
        
        <div class="section-header">
            <h2 class="section-title"><i class="fas fa-utensils"></i> Our Menu</h2>
            <div class="items-count"><i class="fas fa-box"></i> <%= count %> items</div>
        </div>

        <!-- filter chips for categories -->
        <div class="filter-chips">
            <div class="chip active" data-filter="all"><i class="fas fa-th"></i> All</div>
            <div class="chip" data-filter="veg"><i class="fas fa-leaf"></i> Veg</div>
            <div class="chip" data-filter="nonveg"><i class="fas fa-drumstick-bite"></i> Non-Veg</div>
        </div>
        
        <!-- MENU GRID -->
        <div class="menu-grid" id="menuGrid">
            
            <% 
                if(li != null && !li.isEmpty()) {
                    for(Menu m : li){
                        String foodType = m.getFoodType().toLowerCase();
                        boolean isVeg = foodType.contains("veg");
            %>
            
            <div class="menu-card" data-category="<%= foodType %>">
                <img class="menu-image" src="<%= m.getImagePath() != null ? m.getImagePath() : "https://via.placeholder.com/340x180/1f1f1f/d4a373?text=No+Image" %>" alt="<%= m.getItemName() %>" loading="lazy">
                <div class="menu-content">
                    <div class="menu-header">
                        <span class="menu-name"><%= m.getItemName() %></span>
                        <span class="menu-price"><%= String.format("%.2f", m.getPrice()) %></span>
                    </div>
                    <p class="menu-description"><%= m.getDescription() != null ? m.getDescription() : "Delicious item from our kitchen." %></p>
                    <div>
                        <span class="<%= isVeg ? "veg-badge" : "nonveg-badge" %>">
                            <i class="fas <%= isVeg ? "fa-leaf" : "fa-drumstick-bite" %>"></i> 
                            <%= m.getFoodType() %>
                        </span>
                    </div>
                    <div class="order-btn">
                        <button class="order-now" data-id="<%= m.getMenuId() %>" data-name="<%= m.getItemName() %>" data-price="<%= m.getPrice() %>">
                            <i class="fas fa-shopping-bag"></i> 
                            <a href="CartServlet?menuId=<%= m.getMenuId() %>">Order Now</a>
                        </button>
                    </div>
                </div>
            </div>

            <% 
                    }
                } else {
            %>
            <div style="text-align: center; padding: 60px 20px; color: #7a6b5a; grid-column: 1/-1;">
                <i class="fas fa-utensils" style="font-size: 3rem; display: block; margin-bottom: 16px; color: #2a2a2a;"></i>
                <h3 style="color: #9a8b7a;">No menu items available</h3>
                <p style="margin-top: 8px;">This restaurant hasn't added any items yet.</p>
            </div>
            <% } %>
           
        </div>

        <div class="restaurant-note">
            <i class="fas fa-heart"></i> Craving something special? Browse our menu and order your favorites! <i class="fas fa-smile"></i>
        </div>
    </main>
</div>

<script>
    // Filter functionality for menu items
    document.addEventListener('DOMContentLoaded', function() {
        const chips = document.querySelectorAll('.chip');
        const cards = document.querySelectorAll('.menu-card');

        chips.forEach(chip => {
            chip.addEventListener('click', function() {
                // Remove active class from all chips
                chips.forEach(c => c.classList.remove('active'));
                // Add active class to clicked chip
                this.classList.add('active');
                
                const filter = this.getAttribute('data-filter');
                
                cards.forEach(card => {
                    const category = card.getAttribute('data-category') || '';
                    if (filter === 'all' || category.includes(filter)) {
                        card.style.display = 'flex';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });
    });
</script>

</body>
</html>