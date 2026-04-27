<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Add Fee Payment</title>
<style>
    body { background: #ebc6ce; font-family: Arial, sans-serif; margin:0; padding:20px; }
    .card { background: white; max-width: 500px; margin: 2rem auto; padding: 2rem; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    h2 { color: #0d1e42; text-align: center; }
    label { display: block; margin-top: 1rem; color:#0d1e42; font-weight: bold; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    button { background: #0d1e42; color: white; padding: 10px 20px; border: none; border-radius: 5px; margin-top: 1.5rem; width: 100%; cursor: pointer; }
    button:hover { background: #2a4170; }
    .nav-links { text-align: center; margin-bottom: 1rem; }
    .nav-links a { color: #0d1e42; margin: 0 10px; text-decoration: none; }
    .error { color: red; margin-top: 0.5rem; font-size: 0.9rem; }
</style>
<script>
    function validateForm() {
        var studentId = document.getElementById("studentID").value;
        if (studentId === "") {
            alert("Student ID is required.");
            return false;
        }
        var idNum = parseInt(studentId);
        if (isNaN(idNum) || idNum <= 0) {
            document.getElementById("idError").innerHTML = "Student ID must be positive.";
            return false;
        }
        document.getElementById("idError").innerHTML = "";
        return true;
    }
</script>
</head>
<body>
<div class="nav-links">
    <a href="index.jsp">🏠 Home</a> | <a href="DisplayFeePaymentsServlet">📋 View All</a> | <a href="reports.jsp">📊 Reports</a>
</div>
<div class="card">
    <h2>➕ Add New Fee Payment</h2>
    <form action="AddFeePaymentServlet" method="post" onsubmit="return validateForm()">
        <label>Student ID:</label>
        <input type="number" id="studentID" name="studentID" required>
        <div id="idError" class="error"></div>

        <label>Student Name:</label>
        <input type="text" name="studentName" required>

        <label>Payment Date (YYYY-MM-DD):</label>
        <input type="date" name="paymentDate" required>

        <label>Due Date (YYYY-MM-DD):</label>
        <input type="date" name="dueDate" required>

        <label>Amount (₹):</label>
        <input type="number" step="0.01" name="amount" required>

        <label>Status:</label>
        <select name="status" required>
            <option value="Paid">Paid</option>
            <option value="Overdue">Overdue</option>
            <option value="Pending">Pending</option>
        </select>

        <button type="submit">Submit Payment</button>
    </form>
    <% if(request.getAttribute("error") != null) { %>
        <p style="color:red; margin-top:1rem;"><%= request.getAttribute("error") %></p>
    <% } %>
</div>
</body>
</html>