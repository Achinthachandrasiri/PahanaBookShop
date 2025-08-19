<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer - Pahana Bookshop</title>
    <style>
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
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(28, 40, 51, 0.15);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #1C2833;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 25px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #D5DBDB;
            border-radius: 10px;
            background-color: #F4F6F6;
            font-size: 16px;
            outline: none;
            color: #1C2833;
        }

        .form-group input:focus {
            border-color: #1C2833;
            box-shadow: 0 5px 15px rgba(28, 40, 51, 0.2);
        }

        .form-group input[readonly] {
            background: #e9ecef;
            color: #6c757d;
            cursor: not-allowed;
        }

        .form-group label {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #AAB7B8;
            font-size: 16px;
            pointer-events: none;
            transition: all 0.3s ease;
            background: #fff;
            padding: 0 5px;
        }

        input:focus + label,
        input:not(:placeholder-shown) + label {
            top: -10px;
            font-size: 12px;
            color: #1C2833;
        }

        input::placeholder {
            color: transparent;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: #1C2833;
            color: #F4F6F6;
        }

        .btn-primary:hover {
            background: #2E4053;
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(28, 40, 51, 0.3);
        }

        .btn-secondary {
            background: #E8E7E7;
            color: #1C2833;
        }

        .btn-secondary:hover {
            background: #D5D4D4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Customer - Pahana Bookshop</h2>

        <form action="updateCustomer" method="post">
            <input type="hidden" name="_method" value="PUT">

            <!-- Email (readonly field) -->
            <div class="form-group">
                <input type="text" id="email" name="email" value="${customer.email}" placeholder=" " readonly>
                <label for="email">Email Address</label>
            </div>

            <!-- Full Name -->
            <div class="form-group">
                <input type="text" id="name" name="name" value="${customer.name}" placeholder=" " required>
                <label for="name">Full Name</label>
            </div>

            <!-- Mobile Number -->
            <div class="form-group">
                <input type="text" id="mobile" name="mobile" value="${customer.mobile}" placeholder=" " required pattern="[0-9]{10}">
                <label for="mobile">Mobile Number</label>
            </div>

            <!-- Account Number -->
            <div class="form-group">
                <input type="text" id="accountNo" name="accountNo" value="${customer.accountNo}" placeholder=" " required pattern="[0-9]{10}">
                <label for="accountNo">Account No</label>
            </div>

            <!-- Address -->
            <div class="form-group">
                <input type="text" id="address" name="address" value="${customer.address}" placeholder=" " required>
                <label for="address">Address</label>
            </div>

            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="customers" class="btn btn-secondary">Back To List</a>
            </div>
        </form>
    </div>
</body>
</html>
