<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/register.css">
    <style>
            .error-message {
                color: #d93025; /* red color for errors */
                background-color: #fce8e6; /* light red background */
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #f5c6cb;
                border-radius: 5px;
            }
            .success-message {
                color: #0f5132;
                background-color: #d1e7dd;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #badbcc;
                border-radius: 5px;
            }
        </style>
</head>
<body>
    <div class="container">
        <h2>Register - Pahana Bookshop</h2>
         <!-- Display error message if exists -->
                <c:if test="${not empty error}">
                    <div class="error-message">${error}</div>
                </c:if>

                <!-- Display success message if exists -->
                <c:if test="${not empty successMessage}">
                    <div class="success-message">${successMessage}</div>
                </c:if>
        <form action="register" method="post">
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder=" " required>
                <label for="email">Email Address</label>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" placeholder=" " required>
                <label for="password">Password</label>
            </div>
            <div class="form-group">
                <input type="text" id="name" name="name" placeholder=" " required>
                <label for="name">Full Name</label>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <input type="text" id="mobile" name="mobile" placeholder=" " required pattern="[0-9]{10}">
                    <label for="mobile">Mobile Number</label>
                </div>
                <div class="form-group">
                    <div class="custom-select-wrapper">
                        <select id="role" name="role" required>
                            <option value="" disabled selected hidden>Select Role</option>
                            <option value="admin">Admin</option>
                            <option value="cashier">Cashier</option>
                        </select>
                        <label for="role"></label>
                    </div>
                </div>
            </div>

            <input type="submit" value="Create Account">
        </form>
        <div class="links">
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>