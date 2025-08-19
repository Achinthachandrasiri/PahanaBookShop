<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookshop.model.Customer" %>
<%@ page import="com.bookshop.model.Product" %>
<%@ page import="com.bookshop.service.CustomerService" %>
<%@ page import="com.bookshop.service.ProductService" %>

<%
    CustomerService customerService = new CustomerService();
    ProductService productService = new ProductService();

    List<Customer> customers = customerService.getAllCustomers();
    List<Product> products = productService.getAllProducts();

    String success = request.getParameter("success");
%>

<html>
<head>
    <title>Billing - Pahana Bookshop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
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

        .billing-container {
            width: 900px;
            height: 640px;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            overflow-y: auto;
        }

        h1 { text-align: center; margin-bottom: 20px; color: #333; }
        label { display: inline-block; width: 150px; font-weight: bold; }
        select, input {
            padding: 12px 10px;
            margin-bottom: 15px;
            border-radius: 7px;
            border: 1px solid #ccc;
            margin-top: 8px;
            outline: none;
        }
        select:focus, input:focus {
            border-color: #888;
        }

        button {
            padding: 15px 15px;
            background-color: #1C2833;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-right: 4px;
        }

        button:hover { background-color: #2C3E50; }

        table {
            width: 100%;
            border: none;
            margin-top: 10px;
        }

        th, td {
            color: #1C2833;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            border: none;
        }

        tr {
            border-bottom: 0.5px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .product-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .no-image {
            width: 50px;
            height: 50px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            color: #6c757d;
            margin: 0 auto;
        }

        .message { padding: 10px; margin-bottom: 15px; border-radius: 5px; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }

        h3 { margin: 10px 0; }

        .product-row { display: flex; align-items: center; gap: 10px; margin-bottom: 5px; }
        .product-row select, .product-row input[type="number"] { flex: 1; }
        .product-row .qty-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .product-row .qty-container button {
            border-radius: 0 7px 7px 0;
            padding: 8px 10px;
        }

        .paying-row { margin-top: 15px; }

        .remove-btn {
            background-color: #dc3545;
            padding: 5px 10px;
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 3px;
        }

        .remove-btn:hover { background-color: #c82333; }

        .product-row .qty-container button {
            border-radius: 0 7px 7px 0;
            padding: 14px; /* Updated padding */
            background-color: #1C2833;
            color: white;
            border: none;
            cursor: pointer;
        }

        .product-row .qty-container button:hover {
            background-color: #2C3E50;
        }
           .flexing {
            display: flex;
            margin-top:10px;
           }

    </style>
</head>
<body>

<div class="billing-container">
 <div style="text-align:right; margin-bottom: 15px; margin-left:720px;">
        <button type="button" onclick="window.location.href='dashboard.jsp'"
                style="background-color:#6c757d; color:white; padding:10px 15px; border:none; border-radius:5px; cursor:pointer;">
            <i class="fa fa-arrow-left"></i> Back to Dashboard
        </button>
    </div>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <div class="message error"><%= errorMessage %></div>
    <% } %>

    <% if ("1".equals(success)) { %>
        <div class="message success"><i class="fa fa-check-circle"></i> Sale saved successfully!</div>
    <% } %>

    <h1>Billing System</h1>

    <form id="billingForm" action="saveSale" method="post">
        <label for="customerEmail">Select Customer:</label>
        <select id="customerEmail" name="customerEmail" required>
            <option value="">-- Select Customer --</option>
            <% for(Customer c : customers) { %>
                <option value="<%= c.getAccountNo() %>"><%= c.getName() %></option>
            <% } %>
        </select>
        <br>

        <div class="product-row">
            <select id="productId">
                <option value="">-- Select Product --</option>
                <% for(Product p : products) { %>
                    <option value="<%= p.getCode() %>"
                            data-name="<%= p.getName() != null ? p.getName().replace("\"", "&quot;") : "" %>"
                            data-discount="<%= p.getDiscount() %>"
                            data-price="<%= p.getPrice() %>"
                            data-quantity="<%= p.getQuantity() %>"
                            data-image="<%= p.getImage() != null ? p.getImage() : "" %>">
                        <%= p.getName() %> (Stock: <%= p.getQuantity() %>)
                    </option>
                <% } %>
            </select>

            <div class="qty-container">
                <input type="number" id="quantity" min="1" value="1">
                <button type="button" onclick="addToCart()"><i class="fa fa-plus"></i></button>
            </div>
        </div>

        <table border="1" id="cartTable">
            <thead>
                <tr>
                    <th><i class="fa fa-image"></i></th>
                    <th><i class="fa fa-book"></i> Product</th>
                    <th><i class="fa fa-sort-numeric-up"></i> Qty</th>
                    <th><i class="fa"></i> LKR Price</th>
                    <th><i class="fa fa-calculator"></i> Total</th>
                    <th><i class="fa fa-trash"></i> Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="paying-row">
            <label for="discount">Discount:</label>
            <input type="number" id="discount" value="0" oninput="updateTotal()"><br>
            <label for="payingAmount">Paying Amount:</label>
            <input type="number" id="payingAmount" value="0" oninput="updateTotal()"><br>
            <h3>Grand Total: <span id="grandTotal">0.00</span></h3>
            <h3>Balance: <span id="balance">0.00</span></h3>
        </div>

        <!-- Hidden fields -->
        <input type="hidden" name="invoiceNumber" id="invoiceNumber">
        <input type="hidden" name="totalAmount" id="totalAmount">
        <input type="hidden" name="paidAmount" id="paidAmount">
        <input type="hidden" name="balanceAmount" id="balanceAmount">
        <input type="hidden" name="customerName" id="customerName">
        <input type="hidden" name="accountNo" id="accountNo">
        <input type="hidden" name="productCodes" id="productCodes">
        <input type="hidden" name="quantities" id="quantities">

        <div class="flexing">
        <button type="button" onclick="submitBill()"><i class="fa fa-credit-card"></i> Process Payment</button>
        <button type="button" onclick="clearCart()"><i class="fa fa-ban"></i> Clear Cart</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    var cart = [];

    function addToCart() {
        let productSelect = document.getElementById("productId");
        let selectedOption = productSelect.options[productSelect.selectedIndex];

        let productCode = selectedOption.value;
        let productName = selectedOption.getAttribute("data-name");
        let price = parseFloat(selectedOption.getAttribute("data-price"));
        let availableQty = parseInt(selectedOption.getAttribute("data-quantity"));
        let quantity = parseInt(document.getElementById("quantity").value);
        let discount = parseFloat(selectedOption.getAttribute("data-discount")) || 0;
        let imageUrl = selectedOption.getAttribute("data-image") || "";

        if (!productCode || quantity <= 0) {
            alert("Please select a valid product and enter a positive quantity!");
            return;
        }

        if (!productName || isNaN(price) || isNaN(availableQty)) {
            alert("Error: Product data is missing.");
            return;
        }

        if (quantity > availableQty) {
            alert(`Cannot add ${quantity} items. Only ${availableQty} available in stock!`);
            return;
        }

        // Check if product already exists in cart
        let existingItem = cart.find(item => item.code === productCode);

        if (existingItem) {
            let newQuantity = existingItem.quantity + quantity;
            if (newQuantity > availableQty) {
                alert(`Cannot add more than available stock!`);
                return;
            }
            existingItem.quantity = newQuantity;
            existingItem.total = (existingItem.price - existingItem.discount) * existingItem.quantity;
        } else {
            cart.push({
                code: productCode,
                name: productName,
                price: price,
                discount: discount,
                quantity: quantity,
                total: (price - discount) * quantity,
                imageUrl: imageUrl
            });
        }

        // Reset product selection and quantity input
        productSelect.selectedIndex = 0;
        document.getElementById("quantity").value = 1;

        // Update cart table and totals
        updateCartTable();
    }


    function removeFromCart(productCode) {
        cart = cart.filter(item => item.code !== productCode);
        updateCartTable();
    }

    function updateCartTable() {
        var tbody = document.querySelector("#cartTable tbody");
        tbody.innerHTML = "";

        cart.forEach(function(item) {
            var row = document.createElement("tr");

            var imageCell = item.imageUrl ? "<img src='" + item.imageUrl + "' alt='Product Image' class='product-image'>" : "<div class='no-image'>No Image</div>";

            row.innerHTML =
                "<td>" + imageCell + "</td>" +
                "<td>" + (item.name || 'N/A') + "</td>" +
                "<td>" + (item.quantity || 0) + "</td>" +
                "<td>" + (item.price || 0).toFixed(2) + "</td>" +
                "<td>" + (item.total || 0).toFixed(2) + "</td>" +
                "<td><button type='button' class='remove-btn' onclick='removeFromCart(\"" + item.code + "\")'><i class='fa fa-trash'></i> Remove</button></td>";
            tbody.appendChild(row);
        });

        updateTotal();
    }

    function updateTotal() {
        var discount = parseFloat(document.getElementById("discount").value) || 0;
        var subtotal = cart.reduce((sum, item) => sum + (item.price - item.discount) * item.quantity, 0);
        var grandTotal = subtotal - discount;
        if (grandTotal < 0) grandTotal = 0;

        document.getElementById("grandTotal").innerText = grandTotal.toFixed(2);

        var payingAmount = parseFloat(document.getElementById("payingAmount").value) || 0;
        var balance = payingAmount - grandTotal;
        document.getElementById("balance").innerText = balance.toFixed(2);
    }

    function clearCart() {
        cart = [];
        updateCartTable();
    }

    function submitBill() {
        if (cart.length === 0) { alert("Cart is empty!"); return; }

        var customerSelect = document.getElementById("customerEmail");
        if (!customerSelect.value) { alert("Please select a customer!"); return; }

        var payingAmount = parseFloat(document.getElementById("payingAmount").value) || 0;
        var grandTotal = parseFloat(document.getElementById("grandTotal").innerText) || 0;

        if (payingAmount < grandTotal) { alert("Paying amount cannot be less than grand total!"); return; }

        // First populate hidden fields
        document.getElementById("invoiceNumber").value = Date.now();
        document.getElementById("totalAmount").value = grandTotal.toFixed(2);
        document.getElementById("paidAmount").value = payingAmount.toFixed(2);
        document.getElementById("balanceAmount").value = (payingAmount - grandTotal).toFixed(2);
        document.getElementById("customerName").value = customerSelect.options[customerSelect.selectedIndex].text;
        document.getElementById("accountNo").value = customerSelect.value;
        document.getElementById("productCodes").value = cart.map(item => item.code).join(",");
        document.getElementById("quantities").value = cart.map(item => item.quantity).join(",");

        // Now generate PDF from cart directly
        generatePDF();

        // Finally, submit form
        document.getElementById("billingForm").submit();
    }


    function generatePDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        doc.setFontSize(16);
        doc.text("Receipt - Pahana Bookshop", 20, 20);

        let y = 30;
        doc.setFontSize(12);
        doc.text("Product    Qty    Price    Total", 20, y);
        y += 10;

        if(cart.length === 0) {
            alert("Cart is empty! Cannot generate PDF.");
            return;
        }

        cart.forEach(item => {
            let line = `${item.name}    ${item.quantity}    ${item.price.toFixed(2)}    ${item.total.toFixed(2)}`;
            doc.text(line, 20, y);
            y += 10;
        });

        y += 10;
        doc.text(`Grand Total: ${document.getElementById("grandTotal").innerText}`, 20, y);
        y += 10;
        doc.text(`Paid: ${document.getElementById("payingAmount").value}`, 20, y);
        y += 10;
        doc.text(`Balance: ${document.getElementById("balance").innerText}`, 20, y);

        doc.save(`Receipt_${Date.now()}.pdf`);
    }



</script>

</body>
</html>
