<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, viewport-fit=cover">
    <title>HappyEat - Register</title>
    <!-- Google Fonts (Inter & Poppins) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* ----- RESET & FULL SCREEN DARK THEME ----- */
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
            flex-direction: column;
        }

        /* ========= HEADER / NAVBAR - STICKY AT TOP ========= */
        .navbar-wrapper {
            width: 100%;
            padding: 16px 24px;
            background: #1f1f1f;
            border-bottom: 1px solid #2a2a2a;
            position: sticky;
            top: 0;
            z-index: 100;
            flex-shrink: 0;
        }

        .navbar {
            max-width: 1400px;
            margin: 0 auto;
            width: 100%;
            padding: 0.6rem 1.5rem;
            background: transparent;
        }

        .nav-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1.2rem;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            transition: transform 0.2s ease;
        }
        .brand:hover {
            transform: scale(1.02);
        }

        .brand-text {
            font-size: 1.65rem;
            font-weight: 800;
            font-family: 'Poppins', 'Inter', sans-serif;
            letter-spacing: -0.5px;
            background: linear-gradient(135deg, #d4a373, #b87c4b);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        .brand-text span {
            background: none;
            color: #d4a373;
            font-weight: 700;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
            list-style: none;
        }
        .nav-links li a {
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
            color: #9a8b7a;
            transition: all 0.25s ease;
            position: relative;
            padding-bottom: 4px;
        }
        .nav-links li a:hover {
            color: #d4a373;
        }
        .nav-links li a::after {
            content: '';
            position: absolute;
            width: 0%;
            height: 2px;
            bottom: 0;
            left: 0;
            background: linear-gradient(90deg, #d4a373, #b87c4b);
            border-radius: 4px;
            transition: width 0.25s ease;
        }
        .nav-links li a:hover::after {
            width: 100%;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        .signin-link {
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 600;
            color: #9a8b7a;
            transition: color 0.2s ease;
        }
        .signin-link:hover {
            color: #d4a373;
        }
        .btn-get-started {
            background: linear-gradient(105deg, #d4a373, #b87c4b);
            color: #1a1a1a;
            border: none;
            padding: 0.7rem 1.6rem;
            border-radius: 40px;
            font-size: 0.9rem;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 6px 14px rgba(212, 163, 115, 0.2);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-get-started i {
            font-size: 0.85rem;
        }
        .btn-get-started:hover {
            background: linear-gradient(105deg, #b87c4b, #a06a3e);
            transform: translateY(-2px);
            box-shadow: 0 12px 20px -8px rgba(212, 163, 115, 0.35);
        }

        @media (max-width: 880px) {
            .navbar-wrapper { padding: 12px 16px; }
            .nav-links { gap: 1.4rem; }
            .nav-actions { gap: 1rem; }
            .brand-text { font-size: 1.4rem; }
        }
        @media (max-width: 720px) {
            .nav-container { flex-direction: column; align-items: center; }
            .brand { width: 100%; justify-content: center; }
            .nav-links { width: 100%; justify-content: center; flex-wrap: wrap; gap: 1.2rem; }
            .nav-actions { width: 100%; justify-content: center; margin-top: 0.2rem; }
        }

        /* ========= MAIN CONTENT - FULL WIDTH ========= */
        .main-content {
            flex: 1;
            background: transparent;
            padding: 40px 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 80px);
        }

        /* ========= REGISTER CARD (dark theme) ========= */
        .register-card {
            background: #1f1f1f;
            border-radius: 48px;
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            border: none;
            box-shadow: 0 30px 60px -20px rgba(0, 0, 0, 0.6);
        }

        /* LEFT: Image Column */
        .visual-col {
            flex: 1.1;
            background: linear-gradient(135deg, #2a2a2a, #1f1f1f);
            padding: 28px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 240px;
            order: 1;
        }

        .illustration-container {
            background: rgba(42, 42, 42, 0.6);
            border-radius: 44px;
            width: 100%;
            aspect-ratio: 1 / 1;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            border: 1px solid #2a2a2a;
        }

        .illustration-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 44px;
            transition: transform 0.3s ease;
        }

        .illustration-container img:hover {
            transform: scale(1.02);
        }

        /* RIGHT: Registration Form Column */
        .form-col {
            flex: 0.9;
            padding: 44px 40px;
            background: #1f1f1f;
            order: 2;
        }

        .register-heading {
            font-size: 2rem;
            font-weight: 800;
            color: #d4c9bc;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #9a8b7a;
            font-size: 0.9rem;
            margin-bottom: 32px;
            border-left: 3px solid #d4a373;
            padding-left: 12px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            font-size: 0.8rem;
            margin-bottom: 8px;
            color: #9a8b7a;
        }

        .input-underline {
            width: 100%;
            border: none;
            border-bottom: 1.5px solid #2a2a2a;
            padding: 10px 4px 8px 0;
            font-size: 1rem;
            font-family: inherit;
            background: transparent;
            outline: none;
            transition: border 0.2s;
            color: #d4c9bc;
        }

        .input-underline::placeholder {
            color: #5a4a38;
        }

        .input-underline:focus {
            border-bottom-color: #d4a373;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 6px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #5a4a38;
            font-size: 1rem;
        }

        .toggle-password:hover {
            color: #d4a373;
        }

        .role-select {
            width: 100%;
            border: none;
            border-bottom: 1.5px solid #2a2a2a;
            padding: 10px 4px 8px 0;
            font-size: 1rem;
            font-family: inherit;
            background: transparent;
            cursor: pointer;
            outline: none;
            color: #d4c9bc;
            font-weight: 500;
        }

        .role-select option {
            background: #1f1f1f;
            color: #d4c9bc;
        }

        .role-select:focus {
            border-bottom-color: #d4a373;
        }

        .btn-primary {
            background: linear-gradient(135deg, #d4a373, #b87c4b);
            color: #1a1a1a;
            border: none;
            width: 100%;
            padding: 14px 0;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 12px;
            margin-bottom: 16px;
            transition: 0.2s;
            box-shadow: 0 6px 14px rgba(212, 163, 115, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #b87c4b, #a06a3e);
            transform: scale(0.98);
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 20px 0;
            color: #5a4a38;
            font-size: 0.8rem;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #2a2a2a;
        }

        .divider::before {
            margin-right: 12px;
        }

        .divider::after {
            margin-left: 12px;
        }

        .btn-google {
            background: #2a2a2a;
            color: #d4c9bc;
            border: 1px solid #3a3a3a;
            width: 100%;
            padding: 12px 0;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-google:hover {
            background: #333333;
            border-color: #d4a373;
            color: #d4a373;
        }

        .btn-google i {
            color: #d4a373;
        }

        .login-footer {
            text-align: center;
            margin-top: 28px;
            font-size: 0.85rem;
            color: #7a6b5a;
        }

        .login-footer a {
            color: #d4a373;
            font-weight: 800;
            text-decoration: none;
            cursor: pointer;
        }

        .login-footer a:hover {
            text-decoration: underline;
            color: #b87c4b;
        }

        .error-message {
            color: #e34234;
            font-size: 0.7rem;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 4px;
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
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.6);
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

        /* ========= RESPONSIVE ========= */
        @media (max-width: 880px) {
            .register-card { flex-direction: column; border-radius: 32px; }
            .visual-col { order: 1; min-height: 260px; }
            .form-col { order: 2; padding: 32px 24px; }
            .register-heading { font-size: 1.6rem; }
            .main-content { padding: 24px; }
        }

        @media (max-width: 550px) {
            .form-col { padding: 28px 18px; }
            .main-content { padding: 16px; }
        }

        .fa, .fas, .far, .fab {
            line-height: 1;
        }
    </style>
</head>
<body>

    <!-- ====== HEADER / NAVBAR - STICKY AT TOP ====== -->
    <header class="navbar-wrapper">
        <nav class="navbar">
            <div class="nav-container">
                <a href="#" class="brand">
                    <span class="brand-text">Happy<span>Eat</span></span>
                </a>

              
                <div class="nav-actions">
                    <a href="#" class="signin-link">Sign in</a>
                    <a href="Register" class="signin-link">Register</a>
                </div>
            </div>
        </nav>
    </header>

    <!-- ====== MAIN CONTENT (FULL WIDTH) ====== -->
    <main class="main-content">
        <div class="register-card">
            <!-- LEFT: Image Column (food illustration) -->
            <div class="visual-col">
                <div class="illustration-container">
                    <img src="https://i.pinimg.com/736x/c0/f7/7e/c0f77e3d734db57b6fffe771c7618419.jpg" alt="Delicious food spread" style="width: 100%; height: 100%; object-fit: cover; border-radius: 44px;">
                </div>
            </div>

            <!-- RIGHT: Registration Form Column -->
            <div class="form-col">
                <h1 class="register-heading">Join the feast!</h1>
                <div class="subtitle">Sign up to start ordering & exploring</div>

                <form id="registerForm" action="Register" method="post">
                    <div class="form-group">
                        <label class="form-label" for="username">Username *</label>
                        <input type="text" id="username" name="username" class="input-underline" autocomplete="username" placeholder="Choose a username">
                        <div class="error-message" id="usernameError"></div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="email">Email address *</label>
                        <input type="email" id="email" name="email" class="input-underline" autocomplete="email" placeholder="you@example.com">
                        <div class="error-message" id="emailError"></div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="password">Password *</label>
                        <div class="password-wrapper">
                            <input type="password" id="password" name="password" class="input-underline" autocomplete="new-password" placeholder="Min 6 characters">
                            <button type="button" class="toggle-password" id="togglePwdBtn"><i class="far fa-eye-slash"></i></button>
                        </div>
                        <div class="error-message" id="passwordError"></div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="address">Delivery Address *</label>
                        <input type="text" id="address" name="address" class="input-underline" placeholder="Street, City, Zip code">
                        <div class="error-message" id="addressError"></div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="role">Role</label>
                        <select id="role" name="role" class="role-select">
                            <option value="customer" selected>Customer</option>
                            <option value="restaurantowner">Restaurant Owner</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-primary" id="registerBtn"><i class="fas fa-user-check"></i> Create account</button>
                </form>

               

                <div class="login-footer">
                    Already have an account? <a id="loginLink" href="Login">Log in</a>
                </div>
            </div>
        </div>
    </main>

    <!-- Toast notification -->
    <div id="toastMsg" class="success-toast"><i class="fas fa-check-circle"></i> <span id="toastText"></span></div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle password visibility
            const toggleBtn = document.getElementById('togglePwdBtn');
            const passwordInput = document.getElementById('password');

            toggleBtn.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                this.querySelector('i').classList.toggle('fa-eye');
                this.querySelector('i').classList.toggle('fa-eye-slash');
            });

            // Form validation
            document.getElementById('registerForm').addEventListener('submit', function(e) {
                const username = document.getElementById('username').value.trim();
                const email = document.getElementById('email').value.trim();
                const password = document.getElementById('password').value.trim();
                const address = document.getElementById('address').value.trim();
                let isValid = true;

                // Clear previous errors
                document.getElementById('usernameError').textContent = '';
                document.getElementById('emailError').textContent = '';
                document.getElementById('passwordError').textContent = '';
                document.getElementById('addressError').textContent = '';

                if (!username) {
                    document.getElementById('usernameError').textContent = 'Username is required';
                    isValid = false;
                } else if (username.length < 3) {
                    document.getElementById('usernameError').textContent = 'Username must be at least 3 characters';
                    isValid = false;
                }

                if (!email) {
                    document.getElementById('emailError').textContent = 'Email is required';
                    isValid = false;
                } else if (!email.includes('@')) {
                    document.getElementById('emailError').textContent = 'Please enter a valid email';
                    isValid = false;
                }

                if (!password) {
                    document.getElementById('passwordError').textContent = 'Password is required';
                    isValid = false;
                } else if (password.length < 6) {
                    document.getElementById('passwordError').textContent = 'Password must be at least 6 characters';
                    isValid = false;
                }

                if (!address) {
                    document.getElementById('addressError').textContent = 'Address is required';
                    isValid = false;
                }

                if (!isValid) {
                    e.preventDefault();
                }
            });

            // Show toast message if there's an error param in URL
            const urlParams = new URLSearchParams(window.location.search);
            const error = urlParams.get('error');
            if (error) {
                const toast = document.getElementById('toastMsg');
                const toastText = document.getElementById('toastText');
                toastText.textContent = error;
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 4000);
            }
        });
    </script>

</body>
</html>