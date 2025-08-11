<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookshop.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Users - Pahana Bookshop</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #1C2833 0%, #2E4053 100%);
            color: #1C2833;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .header {
            background: rgba(244, 246, 246, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px 20px 0 0;
            padding: 30px 40px;
            border: 1px solid rgba(170, 183, 184, 0.3);
            border-bottom: none;
        }

        h2 {
            color: #1C2833;
            margin: 0;
            font-size: 32px;
            font-weight: 600;
            text-align: center;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .content {
            background: rgba(244, 246, 246, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 0 0 20px 20px;
            padding: 40px;
            border: 1px solid rgba(170, 183, 184, 0.3);
            border-top: none;
            box-shadow: 0 20px 40px rgba(28, 40, 51, 0.3);
        }

        .message {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-weight: 500;
            text-align: center;
        }

        .error {
            background-color: rgba(231, 76, 60, 0.1);
            color: #e74c3c;
            border: 1px solid rgba(231, 76, 60, 0.3);
        }

        .success {
            background-color: rgba(39, 174, 96, 0.1);
            color: #27ae60;
            border: 1px solid rgba(39, 174, 96, 0.3);
        }

        .no-users {
            text-align: center;
            color: #AAB7B8;
            font-size: 18px;
            padding: 60px 20px;
            background: rgba(170, 183, 184, 0.1);
            border-radius: 15px;
            border: 2px dashed #D5DBDB;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(28, 40, 51, 0.2);
            background: #F4F6F6;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: #F4F6F6;
            border-radius: 15px;
            overflow: hidden;
        }

        th {
            background: linear-gradient(135deg, #2E4053 0%, #1C2833 100%);
            color: #F4F6F6;
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
        }

        td {
            padding: 18px 15px;
            border-bottom: 1px solid #D5DBDB;
            color: #1C2833;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        tr:hover td {
            background-color: rgba(170, 183, 184, 0.1);
        }

        tr:last-child td {
            border-bottom: none;
        }

        .actions-column {
            width: 160px;
            text-align: center;
        }

        .action-btn {
            padding: 8px 16px;
            margin: 3px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .edit-btn {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
        }

        .edit-btn:hover {
            background: linear-gradient(135deg, #229954 0%, #27ae60 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.4);
        }

        .delete-btn {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
        }

        .delete-btn:hover {
            background: linear-gradient(135deg, #c0392b 0%, #a93226 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }

        .delete-form {
            display: inline-block;
            margin: 0;
        }

        .navigation {
            margin-top: 30px;
            text-align: center;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .nav-link {
            color: #2E4053;
            text-decoration: none;
            font-weight: 600;
            padding: 12px 24px;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: 2px solid #AAB7B8;
            background-color: rgba(244, 246, 246, 0.8);
            backdrop-filter: blur(5px);
        }

        .nav-link:hover {
            background: linear-gradient(135deg, #2E4053 0%, #1C2833 100%);
            color: #F4F6F6;
            border-color: #2E4053;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(46, 64, 83, 0.3);
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 10px;
            }

            .header, .content {
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            .table-container {
                font-size: 14px;
            }

            th, td {
                padding: 12px 8px;
            }

            .actions-column {
                width: 140px;
            }

            .action-btn {
                padding: 6px 12px;
                font-size: 11px;
                margin: 2px;
            }

            .navigation {
                flex-direction: column;
                gap: 10px;
            }

            .nav-link {
                width: 100%;
                text-align: center;
            }
        }

        /* Enhanced animations */
        .table-container {
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Smooth transitions */
        * {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
    </style>
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
                            <th class="actions-column">Actions</th>
                        </tr>
                        <%
                            for (User user : users) {
                        %>
                        <tr>
                            <td><%= user.getEmail() != null ? user.getEmail() : "" %></td>
                            <td><%= user.getName() != null ? user.getName() : "" %></td>
                            <td><%= user.getMobile() != null ? user.getMobile() : "" %></td>
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