<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product - Pahana Bookshop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #d9e2ec);
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
            width: 110px;
            height: 110px;
            border: 2px dashed #1C2833;
            border-radius: 15px;
            margin: 0 auto;
            background: url('../img/camera.png') no-repeat center;
            background-size: 50%;
            cursor: pointer;
            transition: background 0.3s ease;
            position: relative;
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
            gap: 20px 15px;
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
</head>
<body>
<div class="container">
    <h2>Create Product</h2>
    <form action="saveProduct" method="post" enctype="multipart/form-data">

        <div class="image-upload">
            <input type="file" id="image" name="image" accept="image/*">
        </div>

        <div class="form-grid">
            <div class="form-group">
                <input type="text" id="name" name="name" placeholder=" " required>
                <label for="name">Product Name</label>
            </div>
            <div class="form-group">
                <input type="text" id="code" name="code" placeholder=" " required>
                <label for="code">Product Code</label>
            </div>
            <div class="form-group">
                <input type="text" id="brand" name="brand" placeholder=" " required>
                <label for="brand">Brand</label>
            </div>
            <div class="form-group">
                <input type="text" id="category" name="category" placeholder=" " required>
                <label for="category">Category</label>
            </div>
        </div>

        <div class="form-grid">
            <div class="form-group">
                <input type="number" step="0.01" id="cost" name="cost" placeholder=" " required>
                <label for="cost">Cost</label>
            </div>
            <div class="form-group">
                <input type="number" step="0.01" id="price" name="price" placeholder=" " required>
                <label for="price">Price</label>
            </div>
            <div class="form-group">
                <input type="number" step="0.01" id="discount" name="discount" placeholder=" " required>
                <label for="discount">Discount</label>
            </div>
            <div class="form-group">
                <input type="number" id="quantity" name="quantity" placeholder=" " required>
                <label for="quantity">Quantity</label>
            </div>
        </div>

        <input type="submit" value="Save Product">

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <div class="success"><%= request.getAttribute("message") %></div>
        <% } %>

    </form>
</div>

<script>
    const imageInput = document.getElementById('image');
    const imageUpload = document.querySelector('.image-upload');

    imageInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                imageUpload.style.backgroundImage = `url('${e.target.result}')`;
                imageUpload.style.backgroundSize = 'cover';
                imageUpload.style.backgroundPosition = 'center';
            }
            reader.readAsDataURL(file);
        } else {
            imageUpload.style.backgroundImage = "url('../img/camera.png')";
            imageUpload.style.backgroundSize = '50%';
            imageUpload.style.backgroundPosition = 'center';
        }
    });
</script>
</body>
</html>
