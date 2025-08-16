<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Registration - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/createCustomer.css">
</head>
<body>
<div class="container">
    <h2>Register Customer - Pahana Bookshop</h2>
    <form action="saveCustomer" method="post">
        <div class="form-group">
            <input type="email" id="email" name="email" placeholder=" " required>
            <label for="email">Email Address</label>
        </div>
        <div class="form-group">
            <input type="text" id="name" name="name" placeholder=" " required>
            <label for="name">Full Name</label>
        </div>
        <div class="form-group-row">
            <div class="form-group">
                <input type="text" id="mobile" name="mobile" placeholder=" " required pattern="[0-9]{10}">
                <label for="mobile">Mobile Number</label>
            </div>
            <div class="form-group">
                <input type="number" id="accountNo" name="accountNo" placeholder=" " required>
                <label for="accountNo">Account Number</label>
            </div>
        </div>
        <div class="form-group">
            <input type="text" id="address" name="address" placeholder=" " required></input>
            <label for="address">Address</label>
        </div>
        <input type="submit" value="Create Customer">
    </form>
    <div class="links">
       <a href="customers" class="btn btn-secondary">Back To List</a>
    </div>
</div>
</body>
</html>
