<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bookshop.model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("viewProducts");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/productForm.css">
    <script>
        function previewImage(event) {
            const preview = document.getElementById('imagePreview');
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.style.backgroundImage = `url('${e.target.result}')`;
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Edit Product</h2>
    <form action="updateProduct" method="post" enctype="multipart/form-data">

        <!-- Image Upload Circle -->
        <div class="image-upload" id="imagePreview"
             style="background-image: url('<%= product.getImage() != null ? product.getImage() : "img/camera.png" %>');">
            <input type="file" name="image" accept="image/*" onchange="previewImage(event)">
        </div>

        <div class="form-row">
            <div class="form-group">
                <input type="text" name="name" placeholder=" " value="<%= product.getName() %>" required>
                <label>Product Name</label>
            </div>
            <div class="form-group">
                <input type="text" name="code" placeholder=" " value="<%= product.getCode() %>" readonly>
                <label>Product Code</label>
            </div>
            <div class="form-group">
                <input type="text" name="brand" placeholder=" " value="<%= product.getBrand() %>" required>
                <label>Brand</label>
            </div>
            <div class="form-group">
                <input type="text" name="category" placeholder=" " value="<%= product.getCategory() %>" required>
                <label>Category</label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <input type="number" step="0.01" name="cost" placeholder=" " value="<%= product.getCost() %>" required>
                <label>Cost</label>
            </div>
            <div class="form-group">
                <input type="number" step="0.01" name="price" placeholder=" " value="<%= product.getPrice() %>" required>
                <label>Price</label>
            </div>
            <div class="form-group">
                <input type="number" step="0.01" name="discount" placeholder=" " value="<%= product.getDiscount() %>" required>
                <label>Discount</label>
            </div>
            <div class="form-group">
                <input type="number" name="quantity" placeholder=" " value="<%= product.getQuantity() %>" required>
                <label>Quantity</label>
            </div>
        </div>

        <input type="hidden" name="oldImage" value="<%= product.getImage() %>">
        <input type="submit" value="Update Product">

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <div class="success"><%= request.getAttribute("message") %></div>
        <% } %>

    </form>
</div>
</body>
</html>
