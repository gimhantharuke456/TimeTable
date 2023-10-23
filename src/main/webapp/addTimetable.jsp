<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Time Table</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Custom Styles -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        form {
            width: 70%;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        button {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-4 mb-4">Add Time Table</h1>

    <form method="POST" action="timetables?action=add">
        <!-- Replace "/your-context-path" with the actual context path of your application -->

        <div class="form-group">
            <label for="classId">Class:</label>
            <select name="classId" class="form-control" required>
                <option value="1">Grade 01</option>
                 <option value="2">Grade 02</option>
                  <option value="3">Grade 03</option>
                   <option value="4">Grade 04</option>
                    <option value="5">Grade 05</option>
                    
            </select>
        </div>

        <div class="form-group">
            <label for="className">Class Name:</label>
            
            <select name="className" class="form-control" required>
             <option value="Olu">Olu</option>
                 <option value="Nelum">Nelum</option>
                  <option value="Manel">Manel</option>
            </select>
        </div>

        <div class="form-group">
            <label for="subjectName">Subject Name:</label>
            <input type="text" name="subjectName" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="timeSlot">Time Slot:</label>
            <input type="text" name="timeSlot" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="teachersName">Teacher's Name:</label>
            <input type="text" name="teachersName" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Time Table</button>
    </form>
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

</body>
</html>
