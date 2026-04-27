<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Reports</title>
<style>
    body { background: #ebc6ce; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align: center; padding: 2rem; }
    .report-menu { background: white; max-width: 500px; margin: auto; padding: 2rem; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    h2 { color: #0d1e42; margin-bottom: 1.5rem; }
    .report-btn { display: block; background: #0d1e42; color: white; padding: 14px; margin: 15px 0; text-decoration: none; border-radius: 8px; font-size: 1.1rem; transition: 0.3s; border: none; width: 100%; cursor: pointer; }
    .report-btn:hover { background: #2a4170; transform: scale(1.02); }
    .home-btn { background: #28a745; }
    .home-btn:hover { background: #218838; }
    .date-group { background: #f8f9fa; padding: 1rem; border-radius: 8px; margin: 15px 0; text-align: left; }
    .date-group label { display: block; margin-bottom: 5px; color: #0d1e42; font-weight: bold; }
    .date-group input { width: 100%; padding: 8px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #ccc; }
</style>
</head>
<body>
<div class="report-menu">
    <h2>📊 Reports</h2>

    <!-- Overdue Students -->
    <form action="${pageContext.request.contextPath}/ReportServlet" method="post">
        <input type="hidden" name="reportType" value="overdue">
        <button type="submit" class="report-btn">🔴 View Overdue Students</button>
    </form>

    <!-- Pending Students -->
    <form action="${pageContext.request.contextPath}/ReportServlet" method="post">
        <input type="hidden" name="reportType" value="pending">
        <button type="submit" class="report-btn">🟡 View Pending Students</button>
    </form>

    <!-- Total Collection with From/To fields -->
    <form action="${pageContext.request.contextPath}/ReportServlet" method="post">
        <input type="hidden" name="reportType" value="collection">
        <div class="date-group">
            <label>📅 From:</label>
            <input type="date" name="startDate" required>
            <label>📅 To:</label>
            <input type="date" name="endDate" required>
            <button type="submit" class="report-btn" style="margin-top:10px;">💰 Total Collection</button>
        </div>
    </form>

    <!-- Home button -->
    <a href="${pageContext.request.contextPath}/index.jsp" class="report-btn home-btn">🏠 Home</a>
</div>
</body>
</html>