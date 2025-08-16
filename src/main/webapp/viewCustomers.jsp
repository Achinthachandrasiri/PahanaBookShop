<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookshop.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Customers - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/customers.css">
   <script>
       function deleteUser(email) {
           if (!confirm('Are you sure you want to delete customer: ' + email + '?')) return;

           fetch('deleteCustomer?email=' + encodeURIComponent(email), {
               method: 'DELETE'
           })
           .then(r => r.json())
           .then(data => {
               if (data.success) location.reload();
               else alert(data.error);
           });
       }

       function confirmDelete(email) {
           return confirm('Are you sure you want to delete customer: ' + email + '?');
       }
       </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Registered Customers - Pahana Bookshop</h2>
        </div>

        <div class="content">
            <%
                String message = (String) request.getAttribute("message");
                String error = (String) request.getAttribute("error");

                if (message != null) {
            %>
                <div class="message success"><%= message %></div>
            <%
                }

                if (error != null) {
            %>
                <div class="message error">Error: <%= error %></div>
            <%
                }
            %>

            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");

                if (customers == null || customers.isEmpty()) {
            %>
                <div class="no-customers">
                    <p>No customers found.</p>
                </div>
            <%
                } else {
            %>
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Email Address</th>
                            <th>Full Name</th>
                            <th>Mobile Number</th>
                            <th>Account No</th>
                            <th>Address</th>
                            <th class="actions-column">Actions</th>
                        </tr>
                        <%
                            for (Customer customer : customers) {
                        %>
                        <tr>
                            <td><%= customer.getEmail() != null ? customer.getEmail() : "" %></td>
                            <td><%= customer.getName() != null ? customer.getName() : "" %></td>
                            <td class="mobile-column"><%= customer.getMobile() != null ? customer.getMobile() : "" %></td>
                            <td class="account-column"><%= customer.getAccountNo() %></td>
                            <td class="address-column"><%= customer.getAddress() != null ? customer.getAddress() : "" %></td>
                            <td class="actions-column">
                                <!-- Edit button -->
                                <a href="editCustomer?email=<%= customer.getEmail() %>"
                                   class="action-btn edit-btn"
                                   title="Edit">
                                    ✎
                                </a>

                                <!-- Delete button -->
                                <form action="deleteCustomer" method="post" class="delete-form" style="display:inline;">
                                    <input type="hidden" name="email" value="<%= customer.getEmail() %>">
                                    <button type="submit"
                                            class="action-btn delete-btn"
                                            title="Delete"
                                            onclick="return confirmDelete('<%= customer.getEmail() %>')">
                                        🗑
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
                <a href="index.jsp" class="nav-link">Back to Home</a>
                <a href="createCustomer.jsp" class="nav-link">Add New Customer</a>
            </div>
        </div>
    </div>
</body>
</html>