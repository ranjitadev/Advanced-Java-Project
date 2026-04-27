package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateFeePaymentServlet")
public class UpdateFeePaymentServlet extends HttpServlet {

    // Show update form with pre-filled data
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            FeePayment p = new FeePaymentDAO().getPaymentById(id);
            req.setAttribute("payment", p);
            req.getRequestDispatcher("feepaymentupdate.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("DisplayFeePaymentsServlet");
        }
    }

    // Process update
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            FeePayment p = new FeePayment();
            p.setPaymentID(Integer.parseInt(req.getParameter("paymentID")));
            p.setStudentID(Integer.parseInt(req.getParameter("studentID")));
            p.setStudentName(req.getParameter("studentName"));
            p.setPaymentDate(sdf.parse(req.getParameter("paymentDate")));
            p.setDueDate(sdf.parse(req.getParameter("dueDate")));
            p.setAmount(Double.parseDouble(req.getParameter("amount")));
            p.setStatus(req.getParameter("status"));

            boolean success = new FeePaymentDAO().updatePayment(p);
            req.getSession().setAttribute(success ? "message" : "error",
                    success ? "Payment updated successfully!" : "Update failed.");
            resp.sendRedirect("DisplayFeePaymentsServlet");
        } catch (Exception e) {
            req.getSession().setAttribute("error", "Error: " + e.getMessage());
            resp.sendRedirect("feepaymentupdate.jsp");
        }
    }
}