package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String type = req.getParameter("reportType");
            FeePaymentDAO dao = new FeePaymentDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            if ("overdue".equals(type)) {
                List<FeePayment> overdue = dao.getPaymentsByStatus("Overdue");
                req.setAttribute("reportData", overdue);
                req.setAttribute("reportTitle", "Overdue Students");
                req.setAttribute("reportType", "status");
            } 
            else if ("pending".equals(type)) {
                List<FeePayment> pending = dao.getPaymentsByStatus("Pending");
                req.setAttribute("reportData", pending);
                req.setAttribute("reportTitle", "Pending Students");
                req.setAttribute("reportType", "status");
            }
            else if ("collection".equals(type)) {
                // Get date parameters
                String startStr = req.getParameter("startDate");
                String endStr = req.getParameter("endDate");
                if (startStr == null || endStr == null || startStr.isEmpty() || endStr.isEmpty()) {
                    throw new Exception("Please provide both From and To dates.");
                }
                java.sql.Date start = new java.sql.Date(sdf.parse(startStr).getTime());
                java.sql.Date end = new java.sql.Date(sdf.parse(endStr).getTime());
                
                double total = dao.getTotalCollection(start, end);
                req.setAttribute("totalCollection", total);
                req.setAttribute("startDate", start);
                req.setAttribute("endDate", end);
                req.setAttribute("reportTitle", "Total Collection Report");
                req.setAttribute("reportType", "collection");
            }
            req.getRequestDispatcher("report_result.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace(); // This will print to server log
            req.setAttribute("error", "Report error: " + e.getMessage());
            req.getRequestDispatcher("reports.jsp").forward(req, resp);
        }
    }
}