<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>BiteDash · dark food landing</title>
    <!-- Google Fonts + Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* ----- RESET & DARK THEME ----- */
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
            display: block;
        }

        /* ----- LANDING WRAPPER: FULL WIDTH, NO SIDEBAR ----- */
        .landing-wrapper {
            width: 100%;
            max-width: 1440px;
            margin: 0 auto;
            padding: 0 40px;
            background: transparent;
        }

        /* ========= TOP HEADER (instead of sidebar) ========= */
        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 24px 0 20px;
            border-bottom: 1px solid #2a2a2a;
            flex-wrap: wrap;
            gap: 16px;
        }

        .logo {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            background: linear-gradient(135deg, #d4a373, #b87c4b);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            line-height: 1.2;
        }

        .logo i {
            background: none;
            -webkit-background-clip: unset;
            background-clip: unset;
            color: #d4a373;
            margin-right: 4px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 32px;
            flex-wrap: wrap;
        }

        .nav-links a {
            text-decoration: none;
            color: #9a8b7a;
            font-weight: 500;
            font-size: 0.95rem;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: #d4a373;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .btn-primary-dark {
            background: #d4a373;
            color: #1a1a1a;
            border: none;
            padding: 10px 24px;
            border-radius: 40px;
            font-weight: 700;
            font-size: 0.9rem;
            transition: all 0.2s;
            cursor: default;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 8px 20px rgba(212, 163, 115, 0.15);
        }

        .btn-primary-dark:hover {
            background: #c48a5a;
            transform: scale(1.02);
            box-shadow: 0 12px 28px rgba(212, 163, 115, 0.25);
        }

        .btn-outline-dark {
            background: transparent;
            border: 1.5px solid #d4a373;
            color: #d4a373;
            padding: 10px 24px;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: 0.2s;
            cursor: default;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-outline-dark:hover {
            background: #d4a373;
            color: #1a1a1a;
        }

        /* ========= MAIN CONTENT: DARK THEME ========= */
        .main-content {
            padding: 32px 0 40px;
        }

        /* HERO SECTION - FULLY VISIBLE */
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 48px;
            padding: 24px 0 48px;
            flex-wrap: wrap;
        }

        .hero-content {
            flex: 1 1 48%;
        }

        .hero-content .badge {
            background: #2c2c2c;
            color: #d4a373;
            font-weight: 600;
            font-size: 0.85rem;
            padding: 6px 18px;
            border-radius: 40px;
            display: inline-block;
            margin-bottom: 20px;
            letter-spacing: 0.3px;
            border: 1px solid #3d3d3d;
        }

        .hero-content .badge i {
            color: #d4a373;
            margin-right: 6px;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            font-weight: 800;
            line-height: 1.1;
            letter-spacing: -1px;
            margin-bottom: 16px;
            color: #d4c9bc;
        }

        .hero-content h1 i {
            color: #d4a373;
            font-size: 3rem;
            margin-right: 4px;
        }

        .hero-content .highlight {
            color: #d4a373;
        }

        .hero-content p {
            font-size: 1.2rem;
            color: #9a8b7a;
            max-width: 480px;
            margin-bottom: 32px;
            font-weight: 400;
            line-height: 1.6;
        }

        .hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            align-items: center;
        }

        .hero-buttons .btn-primary-dark {
            padding: 14px 36px;
            font-size: 1.05rem;
        }

        .hero-buttons .btn-outline-dark {
            padding: 12px 32px;
            font-size: 1rem;
        }

        .hero-stats {
            display: flex;
            gap: 48px;
            margin-top: 40px;
        }

        .hero-stats div {
            display: flex;
            flex-direction: column;
        }

        .hero-stats .number {
            font-weight: 800;
            font-size: 1.8rem;
            color: #d4c9bc;
        }

        .hero-stats .label {
            font-size: 0.9rem;
            color: #7a6b5a;
        }

        .hero-image {
            flex: 1 1 42%;
            background: #1f1f1f;
            border-radius: 48px 48px 48px 8px;
            padding: 32px 24px 24px 24px;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid #2a2a2a;
            min-height: 400px;
            justify-content: center;
        }

        .hero-image .food-illustration {
            width: 100%;
            display: flex;
            justify-content: center;
            background: #141414;
            border-radius: 40px;
            padding: 24px 0 16px;
        }

        .hero-image .food-illustration span {
            font-size: 8rem;
            line-height: 1.2;
            filter: drop-shadow(0 8px 20px rgba(0, 0, 0, 0.4));
        }

        .food-illustration {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #141414;
            border-radius: 40px;
            padding: 32px 20px;
            gap: 12px;
        }

        .food-illustration .main-icon {
            font-size: 8rem;
            color: #d4a373;
            opacity: 0.9;
            filter: drop-shadow(0 8px 20px rgba(212, 163, 115, 0.2));
        }

        .food-illustration .sub-icons {
            display: flex;
            gap: 24px;
            margin-top: 8px;
        }

        .food-illustration .sub-icons i {
            font-size: 2.5rem;
            color: #9a8b7a;
            transition: transform 0.3s ease;
        }

        .food-illustration .sub-icons i:hover {
            transform: translateY(-4px);
            color: #d4a373;
        }

        .food-emoji-badge {
            background: #2a2a2a;
            border-radius: 60px;
            padding: 12px 24px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
            margin-top: 20px;
            font-size: 1.1rem;
            border: 1px solid #3d3d3d;
            color: #d4c9bc;
        }

        .food-emoji-badge i {
            color: #d4a373;
            font-size: 1.6rem;
        }

        /* FEATURES SECTION */
        .features {
            padding: 48px 0 64px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 48px;
        }

        .section-header h2 {
            font-size: 2.6rem;
            font-weight: 700;
            letter-spacing: -0.5px;
            color: #d4c9bc;
        }

        .section-header h2 span {
            color: #d4a373;
        }

        .section-header p {
            color: #9a8b7a;
            font-size: 1.1rem;
            max-width: 560px;
            margin: 8px auto 0;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 32px;
        }

        .feature-card {
            background: #1f1f1f;
            padding: 32px 20px;
            border-radius: 32px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            transition: 0.25s ease;
            border: 1px solid #2a2a2a;
        }

        .feature-card:hover {
            transform: translateY(-8px);
            border-color: #d4a37350;
            box-shadow: 0 20px 32px rgba(212, 163, 115, 0.06);
        }

        .feature-card i {
            font-size: 2.8rem;
            color: #d4a373;
            background: #2a2a2a;
            padding: 14px;
            border-radius: 30px;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            font-weight: 700;
            font-size: 1.3rem;
            margin-bottom: 8px;
            color: #d4c9bc;
        }

        .feature-card p {
            color: #9a8b7a;
            font-size: 0.95rem;
        }

        /* CTA SECTION */
        .cta-section {
            background: #1f1f1f;
            border-radius: 48px;
            padding: 56px 48px;
            margin: 32px 0 64px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            border: 1px solid #2a2a2a;
        }

        .cta-text h3 {
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: -0.3px;
            color: #d4c9bc;
        }

        .cta-text p {
            opacity: 0.8;
            font-size: 1.1rem;
            max-width: 400px;
            margin-top: 6px;
            color: #9a8b7a;
        }

        .cta-button .btn-primary-dark {
            background: #d4a373;
            color: #1a1a1a;
            padding: 14px 40px;
            font-size: 1.1rem;
            border-radius: 60px;
            font-weight: 700;
        }

        .cta-button .btn-primary-dark:hover {
            background: #c48a5a;
        }

        .cta-button .btn-primary-dark i {
            color: #1a1a1a;
        }

        /* FOOTER */
        .footer {
            padding: 24px 0 40px;
            border-top: 1px solid #2a2a2a;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            color: #7a6b5a;
            font-size: 0.95rem;
        }

        .footer-socials a {
            color: #7a6b5a;
            margin-left: 20px;
            font-size: 1.3rem;
            transition: 0.2s;
        }

        .footer-socials a:hover {
            color: #d4a373;
        }

        .footer-links {
            display: flex;
            gap: 24px;
        }

        .footer-links a {
            text-decoration: none;
            color: #7a6b5a;
            font-weight: 500;
        }

        .footer-links a:hover {
            color: #d4a373;
        }

        /* ===========================
           RESPONSIVE DESIGN
        =========================== */

        /* Tablet */
        @media (max-width:950px) {
            .landing-wrapper {
                padding: 0 24px;
            }

            .top-header {
                flex-direction: column;
                align-items: stretch;
                gap: 16px;
            }

            .nav-links {
                justify-content: center;
                gap: 20px;
            }

            .nav-actions {
                justify-content: center;
            }

            .hero {
                flex-direction: column;
                text-align: center;
                padding: 16px 0 32px;
            }

            .hero-content p {
                max-width: 100%;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-stats {
                justify-content: center;
            }

            .hero-image {
                width: 100%;
                min-height: 300px;
            }

            .cta-section {
                flex-direction: column;
                text-align: center;
                gap: 24px;
                padding: 40px 24px;
            }

            .cta-text p {
                max-width: 100%;
            }
        }

        /* Mobile */
        @media (max-width:650px) {
            .landing-wrapper {
                padding: 0 16px;
            }

            .top-header {
                padding: 16px 0;
            }

            .logo {
                font-size: 1.6rem;
                text-align: center;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 0.8rem;
            }

            .nav-actions .btn-primary-dark,
            .nav-actions .btn-outline-dark {
                padding: 8px 16px;
                font-size: 0.8rem;
            }

            .main-content {
                padding: 16px 0 24px;
            }

            /* Hero */
            .hero-content h1 {
                font-size: 2.2rem;
            }

            .hero-content h1 i {
                font-size: 2rem;
            }

            .hero-content .badge {
                font-size: 0.7rem;
                padding: 4px 12px;
            }

            .hero-stats {
                gap: 24px;
            }

            .hero-stats .number {
                font-size: 1.3rem;
            }

            .hero-image {
                min-height: 220px;
                padding: 16px;
                border-radius: 32px;
            }

            .hero-image .food-illustration span {
                font-size: 5rem;
            }

            .food-emoji-badge {
                font-size: 0.85rem;
                padding: 8px 16px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .food-emoji-badge i {
                font-size: 1.2rem;
            }

            /* Features */
            .section-header h2 {
                font-size: 1.8rem;
            }

            .feature-grid {
                grid-template-columns: 1fr;
                gap: 16px;
            }

            .feature-card {
                padding: 24px 16px;
            }

            /* CTA */
            .cta-section {
                padding: 28px 16px;
                border-radius: 32px;
                margin: 24px 0 40px;
            }

            .cta-text h3 {
                font-size: 1.4rem;
            }

            .cta-text p {
                font-size: 0.95rem;
            }

            .cta-button .btn-primary-dark {
                padding: 12px 28px;
                font-size: 1rem;
            }

            /* Footer */
            .footer {
                flex-direction: column;
                gap: 16px;
                text-align: center;
                padding: 16px 0 32px;
            }

            .footer-socials a {
                margin: 0 8px;
            }

            .footer-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="landing-wrapper">
        <!-- TOP HEADER (instead of sidebar) -->
        <header class="top-header">
            <div class="logo">
                <i class="fas fa-utensils"></i> HappyEat
            </div>
          
            <div class="nav-actions">
              <a href="Register">  <span class="btn-outline-dark"><i class="fas fa-user"></i> Sign in</span></a>
                <a href="Login">  <span class="btn-outline-dark"><i class="fas fa-user"></i> Login</span></a>
            </div>
        </header>

        <!-- MAIN CONTENT -->
        <main class="main-content">
            <!-- HERO - FULLY VISIBLE -->
            <section class="hero">
                <div class="hero-content">
                    <div class="badge"><i class="fas fa-fire"></i> 30% off your first order</div>
                    <h1>
                        <i class="fas fa-pizza-slice"></i> <span class="highlight">Taste</span> the <br> world, <span class="highlight">delivered</span>
                    </h1>
                    <p>
                        From sizzling street food to gourmet feasts  your favorite meals are just a tap away. Fresh, fast, and always delicious.
                    </p>
                    <div class="hero-buttons">
                        <span class="btn-primary-dark"><i class="fas fa-arrow-right"></i> Get started</span>
                        
                    </div>
                    <div class="hero-stats">
                       
                    </div>
                </div>
                <div class="hero-image">
                    <div class="food-illustration">
                        <i class="fas fa-utensils main-icon"></i>
                        <div class="sub-icons">
                            <i class="fas fa-pizza-slice"></i>
                            <i class="fas fa-hamburger"></i>
                            <i class="fas fa-fish"></i>
                            <i class="fas fa-coffee"></i>
                        </div>
                    </div>
                    <div class="food-emoji-badge">
                        <i class="fas fa-star" style="color: #f5b342;"></i>
                        <span style="margin-left: 8px; background: #3d3d3d; padding: 4px 12px; border-radius: 40px; font-weight: 600; color:#d4a373;"> food app</span>
                    </div>
                </div>
            </section>

            <!-- FEATURES -->
            <section class="features">
                <div class="section-header">
                    <h2>Why <span>foodies</span> love us</h2>
                    <p>Fresh ingredients, lightning delivery, and zero compromises — that's our recipe.</p>
                </div>
                <div class="feature-grid">
                    <div class="feature-card">
                        <i class="fas fa-clock"></i>
                        <h3>15 min delivery</h3>
                        <p>Hot & fresh meals, always on time. We race against the clock for you.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-leaf"></i>
                        <h3>Farm to table</h3>
                        <p>We source local, sustainable ingredients for every single order.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-hand-holding-heart"></i>
                        <h3>Zero contact</h3>
                        <p>Safe, hygienic delivery with real-time tracking and care.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-crown"></i>
                        <h3>Chef's picks</h3>
                        <p>Exclusive dishes curated by top chefs. Only on BiteDash.</p>
                    </div>
                </div>
            </section>

            <!-- CTA -->
            <div class="cta-section">
                <div class="cta-text">
                    <h3><i class="fas fa-quote-left" style="opacity:0.5; margin-right: 8px;"></i> </h3>
                    <p>HappyEat turned my weeknight dinners into a culinary adventure. Never going back!  — <strong style="color: #d4c9bc;">Amara K.</strong></p>
                </div>
                <div class="cta-button">
                    <span class="btn-primary-dark"><i class="fas fa-mobile-screen-button"></i> Order Now</span>
                </div>
            </div>

            <!-- FOOTER -->
           
        </main>
    </div>
</body>
</html>