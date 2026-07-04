<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Happy Eat - Restaurant Discovery</title>
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
        .restaurant-home {
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
            overflow-y: auto;            /* scroll if content overflows */
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

        .hero-welcome {
            margin-bottom: 32px;
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

        .all-items-badge {
            background: #242424;
            padding: 6px 16px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.8rem;
            color: #d4a373;
        }

        .all-items-badge i {
            margin-right: 6px;
        }

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

        .restaurants-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 28px;
            margin-bottom: 30px;
        }

        /* ----- CARDS: NO BORDER, BLENDS WITH BACKGROUND ----- */
        .restaurant-card {
            background: #1f1f1f;
            border-radius: 28px;
            border: none;
            overflow: hidden;
            transition: all 0.25s ease;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.4);
            cursor: pointer;
        }

        .restaurant-card:hover {
            transform: translateY(-4px);
            background: #242424;
            box-shadow: 0 20px 30px -12px rgba(212, 163, 115, 0.08);
        }

        .restaurant-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
            background: #141414;
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover .restaurant-image {
            transform: scale(1.01);
        }

        .card-content {
            padding: 18px 20px 20px 20px;
        }

        .restaurant-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .restaurant-name {
            font-weight: 800;
            font-size: 1.35rem;
            color: #d4c9bc;
            letter-spacing: -0.3px;
        }

        .price-range {
            font-weight: 700;
            font-size: 0.9rem;
            color: #d4a373;
            background: #2a2a2a;
            padding: 4px 12px;
            border-radius: 40px;
        }

        .restaurant-cuisine {
            color: #9a8b7a;
            font-size: 0.85rem;
            font-weight: 500;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .restaurant-cuisine i {
            color: #d4a373;
        }

        .delivery-row {
            display: flex;
            align-items: center;
            gap: 8px;
            background: #171717;
            padding: 8px 12px;
            border-radius: 60px;
            width: fit-content;
            margin-bottom: 12px;
            font-size: 0.75rem;
            font-weight: 600;
            color: #b87c4b;
        }

        .delivery-row i {
            font-size: 0.9rem;
        }

        .restaurant-meta {
            font-size: 0.7rem;
            color: #7a6b5a;
            margin-top: 12px;
            letter-spacing: -0.2px;
            border-top: 1px solid #2a2a2a;
            padding-top: 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .restaurant-meta i {
            margin-right: 4px;
        }

        .rating {
            display: flex;
            align-items: center;
            gap: 4px;
            background: #2a2a2a;
            padding: 4px 8px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 0.7rem;
            color: #d4a373;
        }

        .rating i {
            color: #d4a373;
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

    .restaurant-home{
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

    .restaurants-grid{
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

    /* Headings */

    .hero-title{
        font-size:1.45rem;
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

    /* Horizontal Filter Chips */

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

    /* Cards */

    .restaurants-grid{
        grid-template-columns:1fr;
        gap:18px;
    }

    .restaurant-card{
        border-radius:20px;
    }

    .restaurant-image{
        height:180px;
    }

    .card-content{
        padding:16px;
    }

    .restaurant-name{
        font-size:1.15rem;
    }

    .restaurant-cuisine{
        font-size:.8rem;
    }

    .delivery-row{
        font-size:.75rem;
        width:100%;
        justify-content:center;
    }

    .restaurant-meta{
        display:flex;
        justify-content:space-between;
        gap:10px;
        align-items:center;
        flex-wrap:nowrap;
    }

    .restaurant-meta span:last-child{
        flex:1;
        text-align:right;
        overflow:hidden;
        text-overflow:ellipsis;
        white-space:nowrap;
    }

    .restaurant-note{
        font-size:.8rem;
        margin-bottom:20px;
        padding:14px;
    }

}
    </style>
</head>
<body>
<div class="restaurant-home">
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
            <!-- Home link wrapped in <a> for consistency -->
            <div class="nav-item active">
                <a href="#">
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
            
            <div class="nav-item">
                <a href="AccountServlet">
                    <i class="fas fa-user"></i> <span>Profile</span>
                </a>
            </div>
            <!-- Orders button with CORRECT receipt icon -->
               
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
            <h1 class="hero-title"><i class="fas fa-star"></i> Discover top restaurants near you</h1>
            <p class="hero-sub">Handpicked kitchens, authentic flavours | express delivery all in one place. <i class="fas fa-rocket"></i></p>
        </div>

        <div class="section-header">
            <h2 class="section-title"><i class="fas fa-store"></i> All Restaurants</h2>
            <div class="all-items-badge">
                <i class="fas fa-store"></i> 
                <%
                    List<Restaurant> li = (List<Restaurant>) request.getAttribute("arr");
                    int count = (li != null) ? li.size() : 0;
                %>
                <%= count %>+ partners <i class="fas fa-handshake"></i>
            </div>
        </div>

        <!-- filter chips -->
        <div class="filter-chips">
            <div class="chip active" data-filter="all" role="button" tabindex="0"><i class="fas fa-th"></i> All</div>
            <div class="chip" data-filter="indian" role="button" tabindex="0"><i class="fas fa-flag"></i> Indian</div>
            <div class="chip" data-filter="italian" role="button" tabindex="0"><i class="fas fa-pizza-slice"></i> Italian</div>
            <div class="chip" data-filter="chinese" role="button" tabindex="0"><i class="fas fa-bowl-food"></i> Chinese</div>
            <div class="chip" data-filter="fast food" role="button" tabindex="0"><i class="fas fa-hamburger"></i> Fast Food</div>
            <div class="chip" data-filter="seafood" role="button" tabindex="0"><i class="fas fa-fish"></i> Seafood</div>
            <div class="chip" data-filter="vegetarian" role="button" tabindex="0"><i class="fas fa-leaf"></i> Vegetarian</div>
            <div class="chip" data-filter="mexican" role="button" tabindex="0"><i class="fas fa-pepper-hot"></i> Mexican</div>
            <div class="chip" data-filter="japanese" role="button" tabindex="0"><i class="fas fa-egg"></i> Japanese</div>
        </div>

        <!-- RESTAURANTS GRID -->
        <div class="restaurants-grid" id="restaurantsGrid">
            
            <%
                if(li != null && !li.isEmpty()) {
                    for(Restaurant r : li){
                        String cuisineLower = r.getCuisineType().toLowerCase();
            %>
            
            <a href="MenuServlet?resturantId=<%=r.getRestaurantId() %>" class="restaurant-link">
                <div class="restaurant-card" data-cuisine="<%= cuisineLower %>" data-name="<%= r.getName() %>">
                    <img class="restaurant-image" src="<%= r.getImagePath() %>" alt="<%= r.getName() %>" loading="lazy">
                    <div class="card-content">
                        <div class="restaurant-header">
                            <span class="restaurant-name"><%= r.getName() %></span>
                            <span class="price-range"><i class="fas fa-coins"></i></span>
                        </div>
                        <div class="restaurant-cuisine">
                            <span><i class="fas fa-pepper-hot"></i> <%= r.getCuisineType() %></span>
                        </div>
                        <div class="delivery-row">
                            <i class="fas fa-motorcycle"></i>
                            <span>Delivery in <%= r.getDeliveryTime() %> min <i class="fas fa-clock"></i></span>
                        </div>
                        <div class="restaurant-meta">
                            <span class="rating"><i class="fas fa-star"></i> <%= r.getRating() %></span>
                            <span><i class="fas fa-location-dot"></i> <%= r.getAddress() %></span>
                        </div>
                    </div>
                </div>
            </a>
            
            <%
                    }
                } else {
            %>
                <div style="text-align: center; padding: 60px; color: #7a6b5a; grid-column: 1/-1;">
                    <i class="fas fa-store-slash" style="font-size: 3rem; margin-bottom: 16px; display: block;"></i>
                    No restaurants available at the moment. <i class="fas fa-frown"></i>
                </div>
            <% } %>
           
        </div>

        <!-- footer note -->
        <div class="restaurant-note">
            <i class="fas fa-utensil-spoon"></i> Craving something special? <i class="fas fa-pizza-slice"></i> Explore our restaurants serving authentic Indian, Italian, Chinese, Fast Food, Seafood, Vegetarian, Mexican & Japanese cuisine — order now! <i class="fas fa-smile"></i>
        </div>
    </main>
</div>

<!-- filter script for chips -->
<script>
    (function() {
        const chips = document.querySelectorAll('.chip');
        const cards = document.querySelectorAll('.restaurant-card');

        function filterRestaurants(filter) {
            cards.forEach(card => {
                const cuisine = card.getAttribute('data-cuisine') || '';
                if (filter === 'all' || cuisine.includes(filter)) {
                    card.closest('.restaurant-link').style.display = 'block';
                } else {
                    card.closest('.restaurant-link').style.display = 'none';
                }
            });
        }

        chips.forEach(chip => {
            chip.addEventListener('click', function() {
                chips.forEach(c => c.classList.remove('active'));
                this.classList.add('active');
                const filter = this.getAttribute('data-filter');
                filterRestaurants(filter);
            });
            // Add keyboard support for accessibility
            chip.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.click();
                }
            });
        });
    })();
</script>

</body>
</html>