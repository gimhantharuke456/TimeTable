<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ page import="com.controllers.*" %>
        <%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Time Tables</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Custom Styles -->
    <style>
        
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-4 mb-4">Time Tables</h1>

    <!-- Button group for CRUD operations -->
    <div class="btn-group">
       <a href="addTimetable.jsp"> <button type="button" class="btn btn-success" onclick="addRow()">Add Row</button></a>
    </div>

    <!-- Display time tables -->
    <!-- Display time tables -->
<table class="table table-striped" id="timetablesTable">
    <thead>
    <tr>
        <th>Class ID</th>
        <th>Class Name</th>
        <th>Subject Name</th>
        <th>Time Slot</th>
        <th>Teacher's Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
        <% List<TimeTableModel> times = (List<TimeTableModel>) request.getAttribute("timeTables"); %>
        <% if(times!=null){
        	for (TimeTableModel model : times) {
        	%>
            <tr>
                <td><%= model.getClassId() %></td>
                <td><%= model.getClassName() %></td>
                <td><%= model.getSubjectName() %></td>
                <td><%= model.getTimeSlot() %></td>
                <td><%= model.getTeachersName() %></td>
                 <td>
                    <!-- Add Edit and Delete buttons -->
                    <button class="btn btn-primary btn-sm" onclick="editRow(<%= model.getClassId() %>)">Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete(<%= model.getClassId() %>)">Delete</button>
                </td>
            </tr>
        <% }} %>
    </tbody>
</table>

</div>
<!-- Modal for Editing -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Time Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Your form for editing -->
                <form id="editForm">
                    <input type="hidden" id="editClassId" name="classId">
                    
                    <div class="form-group">
                        <label for="editClassName">Class Name:</label>
                        <input type="text" class="form-control" id="editClassName" name="className" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="editSubjectName">Subject Name:</label>
                        <input type="text" class="form-control" id="editSubjectName" name="subjectName" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="editTimeSlot">Time Slot:</label>
                        <input type="text" class="form-control" id="editTimeSlot" name="timeSlot" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="editTeachersName">Teacher's Name:</label>
                        <input type="text" class="form-control" id="editTeachersName" name="teachersName" required>
                    </div>
                   

                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Confirm Delete Dialog -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
    <!-- Add your confirmation dialog content here -->
</div>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-XrEUWmON8ZlVaCz9dILC7NjuEfnN6gngVrj4yzgF3HcqTQp0FqRIpswqLQlmh/jW"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyO2BUbuKRcJNoN9vI82+cO+hXO1NQPD8X"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>
function editRow(classId) {
    // Make an AJAX request to fetch the details based on classId
    $.ajax({
        type: 'GET',
        url: '<%= request.getContextPath() %>/timetables?action=edit&classId=' + classId,
        success: function(data) {
            // Populate the modal form with the fetched details
            populateEditModal(data);
            // Open the edit modal
            $('#editModal').modal('show');
        },
        error: function(error) {
            console.error('Error fetching details:', error);
            // Handle the error if needed
        }
    });
}

function populateEditModal(data) {
    // Example: Populate the form fields with the data received
    $('#editClassId').val(data.classId);
    $('#editClassName').val(data.className);
    $('#editSubjectName').val(data.subjectName);
    $('#editTimeSlot').val(data.timeSlot);
    $('#editTeachersName').val(data.teachersName);
    // Add other fields as needed
}

// Example: Handle the form submission in the modal
$('#editForm').submit(function(event) {
    event.preventDefault();
    var formData = $(this).serialize();

    // Send AJAX request
    $.ajax({
        type: 'POST',
        url: '<%= request.getContextPath() %>/timetables?action=update', // Replace with the actual URL of your servlet
        data: formData,
        success: function(response) {
        	   location.reload();
        },
        error: function(error) {
            // Handle error
            console.error('Error updating data:', error);
        }
    });
    $('#editModal').modal('hide');
});

function confirmDelete(classId) {
	 $.ajax({
	        type: 'GET',
	        url: '<%= request.getContextPath() %>/timetables?action=delete&classId='+classId, // Replace with the actual URL of your servlet
	     
	        success: function(response) {
	        	   location.reload();
	        },
	        error: function(error) {
	       
	            console.error('Error updating data:', error);
	        }
	    });
}
</script>

</body>
</html>
