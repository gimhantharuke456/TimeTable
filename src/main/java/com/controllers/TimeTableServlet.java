package com.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class TimeTableServlet extends HttpServlet {
    private TimeTableModelService timeTableModelService;

    @Override
    public void init() throws ServletException {
        super.init();
        timeTableModelService = new TimeTableModelService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String action = request.getParameter("action");
        if(action!=null) {
        	System.out.println(action);
        	if(action.equals("edit")) {
        		int classId =Integer.parseInt(request.getParameter("classId"));
        		System.out.println(classId);
        		TimeTableModel t;
        		for(TimeTableModel tab : timeTableModelService.getAllTimeTables()) {
        			
        			if(tab.getClassId() == Integer.parseInt(request.getParameter("classId")) ) {
        				t = tab;
        				String json = convertTableToJsonString(t);
                        response.setContentType("application/json");
                        response.getWriter().write(json);
                        
                        return;
        			}
        		}
        		
        	}
        	else if(action.equals("delete")) {
        		int classId =Integer.parseInt(request.getParameter("classId"));
        		System.out.println(classId);
        		timeTableModelService.deleteTimeTable(classId);
        		
                return;
        	}else {
        		System.out.print("else called");
        		List<TimeTableModel> timeTables = timeTableModelService.getAllTimeTables();
                request.setAttribute("timeTables", timeTables);
                request.getRequestDispatcher("/timetables.jsp").forward(request, response);
        	}
        }else {
        	
        }
        List<TimeTableModel> timeTables = timeTableModelService.getAllTimeTables();
        request.setAttribute("timeTables", timeTables);
        request.getRequestDispatcher("/timetables.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            // Handle the addition of a new timetable
            TimeTableModel timetable = createTimetableFromRequest(request);
            timeTableModelService.addTimeTable(timetable);
        } else if ("update".equals(action)) {
            System.out.println("update called");
            TimeTableModel timetable = createTimetableFromRequest(request);
            timeTableModelService.updateTimeTable(timetable);
            
        } else if ("delete".equals(action)) {
            // Handle the deletion of an existing timetable
            int classId = Integer.parseInt(request.getParameter("classId"));
            timeTableModelService.deleteTimeTable(classId);
        }
     
      
        response.sendRedirect(request.getContextPath() + "/timetables");
    }

    private TimeTableModel createTimetableFromRequest(HttpServletRequest request) {
        // Extract parameters from the request and create a TimeTableModel object
        TimeTableModel timetable = new TimeTableModel();
        timetable.setClassId(Integer.parseInt(request.getParameter("classId")));
        timetable.setClassName(request.getParameter("className"));
        timetable.setSubjectName(request.getParameter("subjectName"));
        timetable.setTimeSlot(request.getParameter("timeSlot"));
        timetable.setTeachersName(request.getParameter("teachersName"));
        return timetable;
    }

    @Override
    public void destroy() {
        timeTableModelService.close();
        super.destroy();
    }
    
    private String convertTableToJsonString(TimeTableModel table) {
        // Manually construct a JSON string
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{");
        jsonBuilder.append("\"classId\":").append(table.getClassId()).append(",");
        jsonBuilder.append("\"className\":\"").append(table.getClassName()).append("\",");
        jsonBuilder.append("\"subjectName\":\"").append(table.getSubjectName()).append("\",");
        jsonBuilder.append("\"timeSlot\":\"").append(table.getTimeSlot()).append("\",");
        jsonBuilder.append("\"teachersName\":\"").append(table.getTeachersName()).append("\"");
        // Add other fields as needed
        jsonBuilder.append("}");
        return jsonBuilder.toString();
    }
}
