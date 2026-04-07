<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="patientmanagement.entity.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patients | Nexus Health</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="container">
        <header class="header">
            <a href="${pageContext.request.contextPath}/index" class="back-link">← Back to Dashboard</a>
            <h1>Patient Directory</h1>
            <p>Manage existing records or register new hospital admissions.</p>
        </header>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px;">
            <h2>Active Patient List</h2>
            <a href="${pageContext.request.contextPath}/patients/addPatient" class="btn-submit" style="text-decoration: none; display: inline-block;">+ Add New Patient</a>
        </div>

        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Patient Name</th>
                    <th>Age</th>
                    <th>Assigned Doctor</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieve the 'patients' list from the model attribute
                    List<Patient> patientList = (List<Patient>) request.getAttribute("patients");
                    if (patientList != null && !patientList.isEmpty()) {
                        for (Patient p : patientList) {
                %>
                    <tr>
                        <td>#P-<%= p.getId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getAge() %></td>
                        <td>
                            <%= (p.getDoctor() != null) ? "Dr. " + p.getDoctor().getName() : "Unassigned" %>
                        </td>
                        <td>
                            <span class="badge"><%= p.getStatus() %></span>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="5" style="text-align: center; color: #64748b; padding: 20px;">
                            No patients found in the database.
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>