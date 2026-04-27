package com.dao;

import com.model.FeePayment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeePaymentDAO {

    // Add new payment
    public boolean addPayment(FeePayment p) throws SQLException {
        String sql = "INSERT INTO FeePayments (StudentID, StudentName, PaymentDate, DueDate, Amount, Status) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getStudentID());
            ps.setString(2, p.getStudentName());
            ps.setDate(3, new java.sql.Date(p.getPaymentDate().getTime()));
            ps.setDate(4, new java.sql.Date(p.getDueDate().getTime()));
            ps.setDouble(5, p.getAmount());
            ps.setString(6, p.getStatus());
            return ps.executeUpdate() > 0;
        }
    }

    // Update payment
    public boolean updatePayment(FeePayment p) throws SQLException {
        String sql = "UPDATE FeePayments SET StudentID=?, StudentName=?, PaymentDate=?, DueDate=?, Amount=?, Status=? WHERE PaymentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getStudentID());
            ps.setString(2, p.getStudentName());
            ps.setDate(3, new java.sql.Date(p.getPaymentDate().getTime()));
            ps.setDate(4, new java.sql.Date(p.getDueDate().getTime()));
            ps.setDouble(5, p.getAmount());
            ps.setString(6, p.getStatus());
            ps.setInt(7, p.getPaymentID());
            return ps.executeUpdate() > 0;
        }
    }

    // Delete payment
    public boolean deletePayment(int paymentID) throws SQLException {
        String sql = "DELETE FROM FeePayments WHERE PaymentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, paymentID);
            return ps.executeUpdate() > 0;
        }
    }

    // Get all payments (sorted by PaymentID ascending)
    public List<FeePayment> getAllPayments() throws SQLException {
        List<FeePayment> list = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments ORDER BY PaymentID ASC";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                FeePayment p = new FeePayment();
                p.setPaymentID(rs.getInt("PaymentID"));
                p.setStudentID(rs.getInt("StudentID"));
                p.setStudentName(rs.getString("StudentName"));
                p.setPaymentDate(rs.getDate("PaymentDate"));
                p.setDueDate(rs.getDate("DueDate"));
                p.setAmount(rs.getDouble("Amount"));
                p.setStatus(rs.getString("Status"));
                list.add(p);
            }
        }
        return list;
    }

    // Get payment by ID
    public FeePayment getPaymentById(int id) throws SQLException {
        String sql = "SELECT * FROM FeePayments WHERE PaymentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                FeePayment p = new FeePayment();
                p.setPaymentID(rs.getInt("PaymentID"));
                p.setStudentID(rs.getInt("StudentID"));
                p.setStudentName(rs.getString("StudentName"));
                p.setPaymentDate(rs.getDate("PaymentDate"));
                p.setDueDate(rs.getDate("DueDate"));
                p.setAmount(rs.getDouble("Amount"));
                p.setStatus(rs.getString("Status"));
                return p;
            }
        }
        return null;
    }

    // Get payments by status (Overdue, Pending, Paid)
    public List<FeePayment> getPaymentsByStatus(String status) throws SQLException {
        List<FeePayment> list = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments WHERE Status=? ORDER BY DueDate";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeePayment p = new FeePayment();
                p.setPaymentID(rs.getInt("PaymentID"));
                p.setStudentID(rs.getInt("StudentID"));
                p.setStudentName(rs.getString("StudentName"));
                p.setPaymentDate(rs.getDate("PaymentDate"));
                p.setDueDate(rs.getDate("DueDate"));
                p.setAmount(rs.getDouble("Amount"));
                p.setStatus(rs.getString("Status"));
                list.add(p);
            }
        }
        return list;
    }

    // Total collection within a date range
    public double getTotalCollection(java.sql.Date start, java.sql.Date end) throws SQLException {
        String sql = "SELECT SUM(Amount) AS total FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, start);
            ps.setDate(2, end);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("total");
            }
            return 0.0;
        }
    }
}