<%@ page import="java.util.List, com.model.FeePayment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
%>
<!DOCTYPE html>
<html>
<head><title>All Fee Payments</title>
<style>
    body { background: #ebc6ce; font-family: Arial; padding:20px; }
    .container { max-width: 1200px; margin: auto; background: white; border-radius: 15px; padding: 1.5rem; }
    h2 { color: #0d1e42; text-align: center; }
    table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
    th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background: #0d1e42; color: white; }
    tr:hover { background: #f5f5f5; }
    .nav { text-align: center; margin-bottom: 1rem; }
    .nav a { margin: 0 10px; color: #0d1e42; text-decoration: none; font-weight: bold; }
    .message { padding: 10px; border-radius: 5px; margin-bottom: 1rem; }
    .btn-edit, .btn-del { padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-right: 5px; display: inline-block; }
    .btn-edit { background: #0d1e42; color: white; }
    .btn-del { background: #dc3545; color: white; }
    .add-link { display: inline-block; margin-top: 20px; background: #0d1e42; color: white; padding: 8px 16px; text-decoration: none; border-radius: 5px; }
</style>
</head>
<body>
<div class="nav">
    <a href="index.jsp">🏠 Home</a> | <a href="feepaymentadd.jsp">➕ Add New</a> | <a href="reports.jsp">📊 Reports</a>
</div>
<div class="container">
    <h2>📋 All Fee Payments</h2>
    <% String msg = (String) session.getAttribute("message");
       if(msg != null) { %>
        <div class="message" style="background:#d4edda; color:#155724;"><%= msg %></div>
        <% session.removeAttribute("message"); %>
    <% } %>
    <% String err = (String) session.getAttribute("error");
       if(err != null) { %>
        <div class="message" style="background:#f8d7da; color:#721c24;"><%= err %></div>
        <% session.removeAttribute("error"); %>
    <% } %>
    <table>
        <tr><th>ID</th><th>Student ID</th><th>Name</th><th>Payment Date</th><th>Due Date</th><th>Amount</th><th>Status</th><th>Actions</th></tr>
        <% if(payments != null && !payments.isEmpty()) {
            for(FeePayment p : payments) { %>
                <tr>
                    <td><%= p.getPaymentID() %></td>
                    <td><%= p.getStudentID() %></td>
                    <td><%= p.getStudentName() %></td>
                    <td><%= p.getPaymentDate() %></td>
                    <td><%= p.getDueDate() %></td>
                    <td>₹<%= p.getAmount() %></td>
                    <td style="<%= p.getStatus().equals("Overdue") ? "color:red;font-weight:bold" : (p.getStatus().equals("Pending") ? "color:orange;font-weight:bold" : "color:green") %>">
                        <%= p.getStatus() %>
                    </td>
                    <td>
                        <a class="btn-edit" href="UpdateFeePaymentServlet?id=<%= p.getPaymentID() %>">Edit</a>
                        <a class="btn-del" href="feepaymentdelete.jsp?id=<%= p.getPaymentID() %>" onclick="return confirm('Really delete?')">Delete</a>
                    </td>
                </tr>
        <% } } else { %>
            <tr><td colspan="8" style="text-align:center">No records found.</td></tr>
        <% } %>
    </table>
    <div style="text-align:center; margin-top:1rem;">
       
    </div>
</div>
</body>
</html>