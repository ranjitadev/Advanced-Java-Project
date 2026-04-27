<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Delete Payment</title>
<style>
    body { background: #ebc6ce; font-family: Arial; text-align: center; padding: 50px; }
    .box { background: white; max-width: 400px; margin: auto; padding: 2rem; border-radius: 15px; }
    h3 { color: #0d1e42; }
    a { display: inline-block; margin: 1rem; padding: 8px 20px; background: #0d1e42; color: white; text-decoration: none; border-radius: 5px; }
</style>
</head>
<body>
<div class="box">
    <h3>⚠️ Confirm Deletion</h3>
    <p>Are you sure you want to delete payment ID: <%= request.getParameter("id") %> ?</p>
    <a href="DeleteFeePaymentServlet?id=<%= request.getParameter("id") %>">Yes, Delete</a>
    <a href="DisplayFeePaymentsServlet">Cancel</a>
</div>
</body>
</html>