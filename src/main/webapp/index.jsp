<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>
    <div class="container">
         <div class="logo-section">
                        <div class="logo-icon">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M2 3h6l2 13h10l4-8H8"/>
                                <circle cx="9" cy="19" r="1"/>
                                <circle cx="20" cy="19" r="1"/>
                            </svg>
                        </div>
                        <div class="logo-text">
                            <h1>Pahana</h1>
                        </div>
                    </div>

                    <!-- Welcome Text -->
                    <div class="welcome-section">
                        <h2>Welcome Back</h2>
                        <p>Sign in to access your dashboard and manage your bookshop</p>
                    </div>
        <form action="login" method="post">
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder=" " required>
                <label for="email">Email Address</label>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" placeholder=" " required>
                <label for="password">Password</label>
            </div>
            <input type="submit" value="Sign In">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <div class="links">
            <a href="register.jsp">Create New Account</a>
        </div>
    </div>
</body>
</html>