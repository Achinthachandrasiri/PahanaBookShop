<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookshop.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/users.css">
    <script>
    function confirmDelete(code) {
        return confirm('Are you sure you want to delete product with code: ' + code + '?');
    }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Product List - Pahana Bookshop</h2>
        </div>
        <div class="content">
            <a href="createProduct.jsp" class="nav-link" style="margin-bottom: 40px;">➕ Add New Product</a>

            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products == null || products.isEmpty()) {
            %>
                <div class="no-users">
                    <p>No products available.</p>
                </div>
            <%
                } else {
            %>
                <div class="table-container" style="margin-top: 40px;">
                    <table>
                        <tr>
                            <th>Image</th>
                            <th style="width: 200px;">Name</th>
                            <th>Code</th>
                            <th>Brand</th>
                            <th>Cost</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th class="actions-column">Actions</th>
                        </tr>
                        <%
                            for (Product product : products) {
                        %>
                        <tr>
                            <td class="image-cell">
                                <img src="<%= product.getImage() %>" alt="Product Image"
                                     style="max-width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            </td>

                            <td><%= product.getName() != null ? product.getName() : "" %></td>
                            <td><%= product.getCode() != null ? product.getCode() : "" %></td>
                            <td><%= product.getBrand() != null ? product.getBrand() : "" %></td>
                            <td><%= product.getCost() %></td>
                            <td><%= product.getPrice() %></td>
                            <td><%= product.getDiscount() %></td>
                            <td><%= product.getQuantity() %></td>
                            <td><%= product.getCategory() != null ? product.getCategory() : "" %></td>
                            <td class="actions-column">
                               <a href="editProduct?code=<%= product.getCode() %>" class="action-btn edit-btn" title="Edit">✎</a>
                               <form action="deleteProduct" method="post" class="delete-form">
                                   <input type="hidden" name="code" value="<%= product.getCode() %>">
                                   <button type="submit" class="action-btn delete-btn"
                                       onclick="return confirmDelete('<%= product.getCode() %>')">🗑
                                   </button>
                               </form>

                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            <%
                }
            %>

            <div class="navigation">
                <a href="index.jsp" class="nav-link">🏠 Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>
