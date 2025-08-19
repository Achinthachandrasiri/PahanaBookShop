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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #1C2833;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 900px;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            overflow-y: auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #1C2833;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .image-upload {
            width: 150px;
            height: 150px;
            border: 2px dashed #1C2833;
            border-radius: 50%;
            margin: 0 auto;
            background-size: cover;
            background-position: center;
            cursor: pointer;
            position: relative;
            transition: 0.3s ease;
        }

        .image-upload input[type="file"] {
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
            position: absolute;
            top: 0;
            left: 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px 45px;
        }

        .form-group {
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 14px 12px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: 2px solid #1C2833;
        }

        .form-group input[readonly] {
            background-color: #f5f5f5;
            cursor: not-allowed;
        }

        .form-group label {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            background: white;
            padding: 0 5px;
            color: #888;
            pointer-events: none;
            transition: 0.3s ease;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            font-size: 12px;
            color: #1C2833;
        }

        input[type="submit"] {
            padding: 15px;
            background-color: #1C2833;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2C3E50;
        }

        .error, .success {
            text-align: center;
            padding: 10px;
            border-radius: 5px;
        }

        .error { background-color: #f8d7da; color: #721c24; }
        .success { background-color: #d4edda; color: #155724; }

        @media (max-width: 768px) {
            .form-grid { grid-template-columns: 1fr; }
        }
    </style>
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

        <div class="form-grid">
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

        <div class="form-grid">
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
