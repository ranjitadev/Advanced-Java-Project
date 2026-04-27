<%@ page import="java.util.List, com.model.FeePayment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String reportType = (String) request.getAttribute("reportType");
%>
<!DOCTYPE html>
<html>
<head><title>Report Result</title>
<style>
    body { background: #ebc6ce; font-family: Arial; padding:20px; }
    .container { background: white; max-width: 1000px; margin: auto; padding: 1.5rem; border-radius: 15px; }
    h2 { color: #0d1e42; text-align: center; }
    table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
    th, td { padding: 10px; border-bottom: 1px solid #ddd; text-align: left; }
    th { background: #0d1e42; color: white; }
    .back { display: inline-block; margin-top: 1rem; background:#0d1e42; color:white; padding:8px 16px; text-decoration:none; border-radius:5px; }
    .error { color: red; text-align: center; }
</style>
</head>
<body>
<div class="container">
    <h2>${reportTitle}</h2>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error">${error}</div>
    <% } else if("status".equals(reportType)) { 
        List<FeePayment> list = (List<FeePayment>) request.getAttribute("reportData"); %>
        <table>
            <tr><th>Payment ID</th><th>Student ID</th><th>Student Name</th><th>Due Date</th><th>Amount</th><th>Status</th></tr>
            <% if(list != null && !list.isEmpty()) {
                for(FeePayment p : list) { %>
                    <tr>
                        <td><%= p.getPaymentID() %></td>
                        <td><%= p.getStudentID() %></td>
                        <td><%= p.getStudentName() %></td>
                        <td><%= p.getDueDate() %></td>
                        <td>₹<%= p.getAmount() %></td>
                        <td><%= p.getStatus() %></td>
                    </tr>
            <% } } else { %>
                <tr><td colspan="6">No records found.</td></tr>
            <% } %>
         </table>
    <% } else if("collection".equals(reportType)) { 
        Double total = (Double) request.getAttribute("totalCollection");
        if(total == null) total = 0.0;
    %>
        <div style="text-align:center; font-size:1.5rem; margin:2rem 0;">
            <strong>Total Collection from ${startDate} to ${endDate} :</strong><br>
            <span style="color:#0d1e42; font-weight:bold;">₹ <%= total %></span>
        </div>
    <% } %>

    <div style="text-align:center">
        <a href="${pageContext.request.contextPath}/reports.jsp" class="back">🔙 New Report</a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="back">🏠 Home</a>
    </div>
</div>
</body>
</html>