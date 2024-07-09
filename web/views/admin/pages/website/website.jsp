<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="../../../../public/admin/css/dashBoardCss.css"/>
    <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<head>
    <title>Footer Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; /* Remove default body margin */
            padding: 20px;
            background-color: #f5f5f5;
        }
        .main-container {
            display: flex;
            align-items: flex-start;
        }
        .navbar-container {
            flex: 1;
            margin-right: 10px; /* Reduced margin to make form closer to navbar */
            margin-left: 0; /* Ensure navbar is flush against the left */
        }
        .form-container-wrapper {
            flex: 3;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .form-container {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            background-color: #fafafa;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: inline-block;
            width: 150px;
            text-align: right;
            margin-right: 10px;
            font-weight: bold;
        }
        input[type="text"] {
            width: calc(100% - 170px); /* Adjust width based on label width */
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"], .btn-back {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            display: inline-block;
        }
        input[type="submit"]:hover, .btn-back:hover {
            background-color: #0056b3;
        }
        .btn-back {
            background-color: #6c757d;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="navbar-container">
            <c:import url="/views/admin/component/NavBar.jsp" />
        </div>
        <div class="form-container-wrapper">
            <h2>Footer Information</h2>
            <c:forEach var="footer" items="${footers}">
                <div class="form-container">
                    <form action="${pageContext.request.contextPath}/admin/footer" method="post">
                        <input type="hidden" name="id" value="${footer.id}" />

                        <label>Address:</label>
                        <input type="text" name="address" value="${footer.address}" /><br/>

                        <label>Useful Links:</label>
                        <input type="text" name="useful_links" value="${footer.useful_links}" /><br/>

                        <label>Working Hours:</label>
                        <input type="text" name="working_hours" value="${footer.working_hours}" /><br/>

                        <label>Phone Number:</label>
                        <input type="text" name="phone_number" value="${footer.phone_number}" /><br/>

                        <label>Email:</label>
                        <input type="text" name="email" value="${footer.email}" /><br/>

                        <label>Facebook:</label>
                        <input type="text" name="facebook" value="${footer.facebook}" /><br/>

                        <label>Zalo:</label>
                        <input type="text" name="zalo" value="${footer.zalo}" /><br/>

                        <input type="submit" value="Update" onclick="return confirm('Are you sure you want to update?')" />
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-back">Back</a>
                    </form>
                </div>
            </c:forEach>

            <!-- Success message -->
            <c:if test="${not empty param.success}">
                <div class="success-message">Update successful!</div>
            </c:if>
        </div>
    </div>
    <script src="../../../../public/admin/js/reportDashboardJs.js"></script>
</body>
</html>
