package com.servlet;

import com.dao.FeePaymentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean success = new FeePaymentDAO().deletePayment(id);
            req.getSession().setAttribute(success ? "message" : "error",
                    success ? "Payment deleted." : "Delete failed.");
            resp.sendRedirect("DisplayFeePaymentsServlet");
        } catch (Exception e) {
            req.getSession().setAttribute("error", "Error: " + e.getMessage());
            resp.sendRedirect("DisplayFeePaymentsServlet");
        }
    }
}