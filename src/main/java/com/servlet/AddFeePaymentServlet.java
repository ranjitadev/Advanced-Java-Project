package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            // 🔹 Read parameters (must match JSP names)
            String studentIdStr = req.getParameter("studentID");
            String name = req.getParameter("studentName");
            String paymentDateStr = req.getParameter("paymentDate");
            String dueDateStr = req.getParameter("dueDate");
            String amountStr = req.getParameter("amount");
            String status = req.getParameter("status");

            // 🔹 Basic validation – all fields required
            if (studentIdStr == null || studentIdStr.isEmpty() ||
                name == null || name.trim().isEmpty() ||
                paymentDateStr == null || paymentDateStr.isEmpty() ||
                dueDateStr == null || dueDateStr.isEmpty() ||
                amountStr == null || amountStr.isEmpty() ||
                status == null || status.isEmpty()) {

                req.getSession().setAttribute("error", "All fields are required!");
                resp.sendRedirect("feepaymentadd.jsp");
                return;
            }

            int studentId = Integer.parseInt(studentIdStr);
            double amount = Double.parseDouble(amountStr);

            // 🔹 Business validation
            if (studentId <= 0) {
                req.getSession().setAttribute("error", "Student ID must be positive!");
                resp.sendRedirect("feepaymentadd.jsp");
                return;
            }
            if (amount <= 0) {
                req.getSession().setAttribute("error", "Amount must be greater than 0!");
                resp.sendRedirect("feepaymentadd.jsp");
                return;
            }

            // 🔹 Safe date conversion (HTML date format: yyyy-MM-dd)
            Date paymentDate = Date.valueOf(paymentDateStr);
            Date dueDate = Date.valueOf(dueDateStr);

            // 🔹 Ensure due date is not before payment date
            if (dueDate.before(paymentDate)) {
                req.getSession().setAttribute("error", "Due date cannot be before payment date!");
                resp.sendRedirect("feepaymentadd.jsp");
                return;
            }

            // 🔹 Create model object
            FeePayment p = new FeePayment();
            p.setStudentID(studentId);
            p.setStudentName(name.trim());
            p.setPaymentDate(paymentDate);
            p.setDueDate(dueDate);
            p.setAmount(amount);
            p.setStatus(status);

            // 🔹 Save to database
            boolean success = new FeePaymentDAO().addPayment(p);

            req.getSession().setAttribute(
                    success ? "message" : "error",
                    success ? "Payment added successfully!" : "Failed to add payment."
            );

            resp.sendRedirect("DisplayFeePaymentsServlet");

        } catch (NumberFormatException nfe) {
            req.getSession().setAttribute("error", "Invalid number format (Student ID or Amount).");
            resp.sendRedirect("feepaymentadd.jsp");

        } catch (IllegalArgumentException iae) {
            // Catches bad date format from Date.valueOf()
            req.getSession().setAttribute("error", "Invalid date format. Please use YYYY-MM-DD.");
            resp.sendRedirect("feepaymentadd.jsp");

        } catch (Exception e) {
            e.printStackTrace();  // Logs error to server console
            req.getSession().setAttribute("error", "Something went wrong. Please try again.");
            resp.sendRedirect("feepaymentadd.jsp");
        }
    }
}