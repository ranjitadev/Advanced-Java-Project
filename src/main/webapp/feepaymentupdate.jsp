<%@ page import="com.model.FeePayment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    FeePayment p = (FeePayment) request.getAttribute("payment");
    if(p == null) response.sendRedirect("DisplayFeePaymentsServlet");
%>
<!DOCTYPE html>
<html>
<head><title>Update Fee Payment</title>
<style>
    body { background: #ebc6ce; font-family: Arial, sans-serif; padding:20px; }
    .card { background: white; max-width: 500px; margin: 2rem auto; padding: 2rem; border-radius: 15px; }
    h2 { color: #0d1e42; text-align: center; }
    label { display: block; margin-top: 1rem; color:#0d1e42; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; border-radius: 5px; border:1px solid #ccc; }
    button { background: #0d1e42; color: white; width:100%; padding:10px; margin-top:1.5rem; border:none; border-radius:5px; cursor:pointer; }
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
<div class="card">
    <h2>✏️ Update Payment (ID: <%= p.getPaymentID() %>)</h2>
    <form action="UpdateFeePaymentServlet" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="paymentID" value="<%= p.getPaymentID() %>">

        <label>Student ID:</label>
        <input type="number" id="studentID" name="studentID" value="<%= p.getStudentID() %>" required>
        <div id="idError" class="error"></div>

        <label>Student Name:</label>
        <input type="text" name="studentName" value="<%= p.getStudentName() %>" required>

        <label>Payment Date:</label>
        <input type="date" name="paymentDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(p.getPaymentDate()) %>" required>

        <label>Due Date:</label>
        <input type="date" name="dueDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(p.getDueDate()) %>" required>

        <label>Amount:</label>
        <input type="number" step="0.01" name="amount" value="<%= p.getAmount() %>" required>

        <label>Status:</label>
        <select name="status" required>
            <option value="Paid" <%= p.getStatus().equals("Paid") ? "selected" : "" %>>Paid</option>
            <option value="Overdue" <%= p.getStatus().equals("Overdue") ? "selected" : "" %>>Overdue</option>
            <option value="Pending" <%= p.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
        </select>

        <button type="submit">Update Payment</button>
    </form>
</div>
</body>
</html>