<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Fee Payment System</title>
    <style>
        * { margin:0; padding:0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #ebc6ce; color: #0d1e42; }
        .nav { background: #0d1e42; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; }
        .logo { color: #ebc6ce; font-size: 1.5rem; font-weight: bold; text-decoration: none; }
        .nav-links { list-style: none; display: flex; gap: 1.5rem; }
        .nav-links li a { color: #ebc6ce; text-decoration: none; padding: 0.5rem 1rem; border-radius: 5px; transition: 0.3s; }
        .nav-links li a:hover { background: #ebc6ce; color: #0d1e42; }
        .container { max-width: 1100px; margin: 2rem auto; padding: 0 1rem; }
        .hero { background: white; border-radius: 15px; padding: 2rem; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .hero h1 { color: #0d1e42; margin-bottom: 1rem; }
        .btn-group { margin-top: 2rem; display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; }
        .btn { background: #0d1e42; color: white; padding: 0.75rem 1.5rem; text-decoration: none; border-radius: 8px; transition: 0.3s; display: inline-block; }
        .btn:hover { background: #2a4170; transform: scale(1.02); }
        .footer { text-align: center; margin-top: 2rem; padding: 1rem; color: #0d1e42; }
        .message { padding: 0.75rem; border-radius: 5px; margin-top: 1rem; }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="index.jsp" class="logo">💰 College Fee Payment</a>
        <ul class="nav-links">
            <li><a href="feepaymentadd.jsp">Add</a></li>
            <li><a href="DisplayFeePaymentsServlet">View All</a></li>
            <li><a href="reports.jsp">Reports</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="hero">
            <h1>Welcome to College Fee Payment System</h1>
            <p>Manage student fee payments, track status (Paid / Overdue / Pending), and generate reports.</p>
            <div class="btn-group">
                <a href="feepaymentadd.jsp" class="btn">➕ Add Fee</a>
                <a href="DisplayFeePaymentsServlet" class="btn">👁️ View All</a>
                <a href="reports.jsp" class="btn">📊 Reports</a>
            </div>
        </div>
        <% 
            String msg = (String) session.getAttribute("message");
            if(msg != null) { 
        %>
            <div class="message success"><%= msg %></div>
        <% session.removeAttribute("message"); } %>
        <% 
            String err = (String) session.getAttribute("error");
            if(err != null) { 
        %>
            <div class="message error"><%= err %></div>
        <% session.removeAttribute("error"); } %>
    </div>
    <div class="footer">&copy; 2026 College Fee Portal | Sapphire & Candy Theme</div>
</body>
</html>