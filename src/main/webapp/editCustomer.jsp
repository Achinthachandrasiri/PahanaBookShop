<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/editCustomers.css">
</head>
<body>
    <div class="container">
        <h2>Edit Customer - Pahana Bookshop</h2>
              <form action="updateCustomer" method="post">
                   <input type="hidden" name="_method" value="PUT">
                    <div class="form-group">
                         <input type="hidden" id="email" name="email" value="${customer.email}" placeholder=" " readonly>
                          <label for="email">Email Address</label>
                    </div>
                   <div class="form-group">
                       <input type="text" id="name" name="name" value="${customer.name}" placeholder=" " required>
                       <label for="name">Full Name</label>
                   </div>
                   <div class="form-group">
                       <input type="text" id="mobile" name="mobile" value="${customer.mobile}" placeholder=" " required pattern="[0-9]{10}">
                       <label for="mobile">Mobile Number</label>
                   </div>
                   <div class="form-group">
                        <input type="text" id="accountNo" name="accountNo" value="${customer.accountNo}" placeholder=" " required pattern="[0-9]{10}">
                        <label for="accountNo">Account No</label>
                   </div>
                    <div class="form-group">
                        <input type="text" id="address" name="address" value="${customer.address}" placeholder=" " required>
                        <label for="address">Address</label>
                    </div>
                   <div class="button-group">
                       <button type="submit" class="btn btn-primary">Update</button>
                       <a href="customers" class="btn btn-secondary">Back To List</a>
                   </div>

               </form>
    </div>
</body>
</html>