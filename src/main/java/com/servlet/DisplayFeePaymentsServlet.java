package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DisplayFeePaymentsServlet")
public class DisplayFeePaymentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<FeePayment> payments = new FeePaymentDAO().getAllPayments();
            req.setAttribute("payments", payments);
            req.getRequestDispatcher("feepaymentdisplay.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error loading: " + e.getMessage());
            req.getRequestDispatcher("feepaymentdisplay.jsp").forward(req, resp);
        }
    }
}