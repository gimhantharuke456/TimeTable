package com.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TimeTableModelDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_table";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    // JDBC Connection
    private Connection connection;

    public TimeTableModelDAO() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Close the connection
    public void close() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Insert a new timetable record
    public void addTimeTable(TimeTableModel timetable) {
        String sql = "INSERT INTO TimeTables (classId, className, subjectName, timeSlot, teachersName) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, timetable.getClassId());
            preparedStatement.setString(2, timetable.getClassName());
            preparedStatement.setString(3, timetable.getSubjectName());
            preparedStatement.setString(4, timetable.getTimeSlot());
            preparedStatement.setString(5, timetable.getTeachersName());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all timetables
    public List<TimeTableModel> getAllTimeTables() {
        List<TimeTableModel> timetables = new ArrayList<>();
        String sql = "SELECT * FROM TimeTables";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                TimeTableModel timetable = new TimeTableModel();
                timetable.setClassId(resultSet.getInt("classId"));
                timetable.setClassName(resultSet.getString("className"));
                timetable.setSubjectName(resultSet.getString("subjectName"));
                timetable.setTimeSlot(resultSet.getString("timeSlot"));
                timetable.setTeachersName(resultSet.getString("teachersName"));

                timetables.add(timetable);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return timetables;
    }

    // Update an existing timetable record
    public void updateTimeTable(TimeTableModel timetable) {
        String sql = "UPDATE TimeTables SET className = ?, subjectName = ?, timeSlot = ?, teachersName = ? WHERE classId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, timetable.getClassName());
            preparedStatement.setString(2, timetable.getSubjectName());
            preparedStatement.setString(3, timetable.getTimeSlot());
            preparedStatement.setString(4, timetable.getTeachersName());
            preparedStatement.setInt(5, timetable.getClassId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a timetable record
    public void deleteTimeTable(int classId) {
        String sql = "DELETE FROM TimeTables WHERE classId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, classId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
