<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookshop.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Users - Pahana Bookshop</title>
    <link rel="stylesheet" href="styles/users.css">
    <script>
    function deleteUser(email) {
        if (!confirm('Are you sure you want to delete user: ' + email + '?')) return;

        fetch('deleteUser?email=' + encodeURIComponent(email), {
            method: 'DELETE'
        })
        .then(r => r.json())
        .then(data => {
            if (data.success) location.reload();
            else alert(data.error);
        });
    }

    function confirmDelete(email) {
        return confirm('Are you sure you want to delete user: ' + email + '?');
    }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Registered Users - Pahana Bookshop</h2>
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
                List<User> users = (List<User>) request.getAttribute("users");

                if (users == null || users.isEmpty()) {
            %>
                <div class="no-users">
                    <p>No users found.</p>
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
                            <th>Role</th>
                            <th class="actions-column">Actions</th>
                        </tr>
                        <%
                            for (User user : users) {
                        %>
                        <tr>
                            <td><%= user.getEmail() != null ? user.getEmail() : "" %></td>
                            <td><%= user.getName() != null ? user.getName() : "" %></td>
                            <td><%= user.getMobile() != null ? user.getMobile() : "" %></td>
                            <td><%= user.getRole() != null ? user.getRole() : "" %></td>
                            <td class="actions-column">
                                <a href="editUser?email=<%= user.getEmail() %>" class="action-btn edit-btn" title="Edit">✎</a>
                                    <form action="deleteUser" method="post" class="delete-form">
                                          <input type="hidden" name="action" value="delete">
                                          <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                          <button type="submit" class="action-btn delete-btn" title="Delete"
                                                onclick="return confirmDelete('<%= user.getEmail() %>')">
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
                <a href="register.jsp" class="nav-link">Add New User</a>
            </div>
        </div>
    </div>
</body>
</html>