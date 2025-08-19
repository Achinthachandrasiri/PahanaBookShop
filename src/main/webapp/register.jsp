<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration - Pahana Bookshop</title>
    <style>
        * {
            box-sizing: border-box;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #f0f2f5, #d9e2ec);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1C2833;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(28, 40, 51, 0.25);
            padding: 40px 35px;
            width: 100%;
            max-width: 500px;
            border: 1px solid rgba(170, 183, 184, 0.3);
        }
        h2 {
            text-align: center;
            color: #1C2833;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 25px;
        }

        /* Floating labels */
        .form-group {
            position: relative;
            margin-bottom: 25px;
        }
        .form-row {
            display: flex;
            gap: 15px;
            width: 100%;
        }
        .form-group-col { width: 50%; }
        .m { margin-left: 0; } /* keep layout tidy */

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 15px;
            border: 2px solid gray;
            border-radius: 12px;
            font-size: 16px;
            outline: none;
            background-color: #fff; /* IMPORTANT: not a gradient */
            color: #1C2833;
            appearance: none;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: gray;
            box-shadow: 0 4px 15px rgba(37, 99, 235, 0.25);
        }

        .form-group label {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #AAB7B8;
            font-size: 16px;
            pointer-events: none;
            background-color: #fff;
            padding: 0 6px;
            transition: all 0.3s ease;
        }
        /* Float labels for inputs when filled/focused */
        input::placeholder { color: transparent; }
        input:focus + label,
        input:not(:placeholder-shown) + label {
            top: -10px;
            left: 12px;
            font-size: 12px;
            color: gray;
            font-weight: 500;
        }
        /* Float label for select when valid (has a value) or focused */
        .custom-select-wrapper { position: relative; }
        .custom-select-wrapper select { padding-right: 40px; cursor: pointer; }
        .custom-select-wrapper::after {
            content: '▼';
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #AAB7B8;
            pointer-events: none;
            font-size: 12px;
        }
        select:focus + label,
        select:valid + label {
            top: -10px;
            left: 12px;
            font-size: 12px;
            color: gray;
            font-weight: 500;
            background-color: #fff;
        }

        /* Remove default green border when valid */
        input:valid, select:valid { border-color: #D5DBDB; }

        /* Submit button (matches login) */
        input[type="submit"] {
            background: linear-gradient(135deg, #1C2833 0%, #2E4053 100%);
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(28, 40, 51, 0.4);
        }
        input[type="submit"]:active {
            transform: translateY(0);
            box-shadow: 0 5px 15px rgba(28, 40, 51, 0.2);
        }

        /* Links (match login) */
        .links {
            text-align: center;
            margin-top: 25px;
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }
        .links a {
            color: gray;
            text-decoration: none;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 25px;
            border: 2px solid gray;
            background-color: transparent;
            transition: all 0.3s ease;
        }
        .links a:hover {
            background: linear-gradient(135deg, #1C2833 0%, #2E4053 100%);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(28, 40, 51, 0.25);
        }

        /* Messages (optional) */
        .error-message, .success-message {
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 10px;
            font-weight: 500;
            text-align: center;
        }
        .error-message {
            color: #e74c3c;
            background-color: rgba(231, 76, 60, 0.1);
            border: 1px solid rgba(231, 76, 60, 0.2);
        }
        .success-message {
            color: #0f5132;
            background-color: #d1e7dd;
            border: 1px solid #badbcc;
        }

        @media (max-width: 600px) {
            .form-row { flex-direction: column; }
            .container { margin: 20px; padding: 30px 25px; }
            h2 { font-size: 24px; }
            .links { flex-direction: column; gap: 10px; }
            .links a { width: 100%; text-align: center; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register - Pahana Bookshop</h2>

        <form action="register" method="post">
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder=" " required>
                <label for="email">Email Address</label>
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" placeholder=" " required>
                <label for="password">Password</label>
            </div>

            <div class="form-group">
                <input type="text" id="name" name="name" placeholder=" " required>
                <label for="name">Full Name</label>
            </div>

            <div class="form-row">
                <div class="form-group form-group-col">
                    <input type="text" id="mobile" name="mobile" placeholder=" " required pattern="[0-9]{10}">
                    <label for="mobile">Mobile Number</label>
                </div>

                <div class="form-group form-group-col">
                    <div class="custom-select-wrapper">
                        <select id="role" name="role" required>
                            <option value="" disabled selected hidden>Select Role</option>
                            <option value="admin">Admin</option>
                            <option value="cashier">Cashier</option>
                        </select>
                        <label for="role">Role</label>
                    </div>
                </div>
            </div>

            <input type="submit" value="Create Account">
        </form>

        <div class="links">
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>
