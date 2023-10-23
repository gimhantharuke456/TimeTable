package com.controllers;

import java.util.List;

public class TimeTableModelService {

    private TimeTableModelDAO timeTableModelDAO;

    public TimeTableModelService() {
        this.timeTableModelDAO = new TimeTableModelDAO();
    }

    public void addTimeTable(TimeTableModel timetable) {
        timeTableModelDAO.addTimeTable(timetable);
    }

    public List<TimeTableModel> getAllTimeTables() {
        return timeTableModelDAO.getAllTimeTables();
    }

    public void updateTimeTable(TimeTableModel timetable) {
        timeTableModelDAO.updateTimeTable(timetable);
    }

    public void deleteTimeTable(int classId) {
        timeTableModelDAO.deleteTimeTable(classId);
    }

    // Close the DAO connection
    public void close() {
        timeTableModelDAO.close();
    }
}
