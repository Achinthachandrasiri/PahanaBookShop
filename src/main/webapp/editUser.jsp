<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/editUser.css">
</head>
<body>
    <div class="container">
        <h2>Edit User - Pahana Bookshop</h2>
               <form action="updateUser" method="post">
                   <input type="hidden" name="_method" value="PUT">
                   <div class="form-group">
                       <input type="email" id="email" name="email" value="${user.email}" placeholder=" " readonly>
                       <label for="email">Email Address</label>
                   </div>
                   <div class="form-group">
                       <input type="password" id="password" name="password" value="${user.password}" placeholder=" " required>
                       <label for="password">Password</label>
                   </div>
                   <div class="form-group">
                       <input type="text" id="name" name="name" value="${user.name}" placeholder=" " required>
                       <label for="name">Full Name</label>
                   </div>
                   <div class="form-group">
                       <input type="text" id="mobile" name="mobile" value="${user.mobile}" placeholder=" " required pattern="[0-9]{10}">
                       <label for="mobile">Mobile Number</label>
                   </div>
                   <button type="submit" class="btn btn-primary">Update User</button>
                   <a href="users" class="btn btn-secondary">Back to User List</a>
               </form>
    </div>
</body>
</html>