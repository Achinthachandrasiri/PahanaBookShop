<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/productForm.css">
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
            // if no file selected, show default camera image
            imageUpload.style.backgroundImage = "url('../img/camera.png')";
            imageUpload.style.backgroundSize = '50%';
            imageUpload.style.backgroundPosition = 'center';
        }
    });
    </script>

</head>
<body>
    <div class="container">
        <h2>Create Product</h2>
        <form action="saveProduct" method="post" enctype="multipart/form-data">

            <div class="image-upload">
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <div class="form-row">
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

            <div class="form-row">
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
</body>
</html>
