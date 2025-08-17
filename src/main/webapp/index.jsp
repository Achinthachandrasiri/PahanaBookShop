<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>
    <div class="container">
        <h2>Login - Pahana Bookshop</h2>
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
            <a href="customers">View Customers</a>
            <a href="register.jsp">Create New Account</a>
            <a href="users">View Registered Users</a>
            <a href="createProduct.jsp">Create Product</a>
            <a href="viewProducts">View Product</a>
        </div>
    </div>
</body>
</html>