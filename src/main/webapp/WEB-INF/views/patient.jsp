<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="patientmanagement.entity.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patients | Nexus Health</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Specific style for the Discharge action */
        .btn-discharge {
            color: #059669;
            text-decoration: none;
            font-weight: 600;
            padding: 5px 12px;
            border: 1.5px solid #059669;
            border-radius: 8px;
            font-size: 0.85rem;
            transition: all 0.2s;
        }
        .btn-discharge:hover {
            background-color: #059669;
            color: white;
        }
        .text-discharged {
            color: red;
            font-style: italic;
            font-size: 0.85rem;
			font-weight: 600;
        }
    </style>
</head>
<body>

    <div class="container">
        <header class="header">
            <a href="${pageContext.request.contextPath}/index" class="back-link">← Back to Dashboard</a>
            <h1>Patient Directory</h1>
            <p>Monitor patient status and manage hospital discharges.</p>
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
                    <th style="text-align: center;">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
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
                        <td style="text-align: center;">
                            <% if (!"Discharged".equalsIgnoreCase(p.getStatus())) { %>
                                <a href="/patients/discharge/<%= p.getId() %>" 
                                   class="btn-discharge"
                                   onclick="return confirm('Confirm discharge for <%= p.getName() %>?')">
                                   Discharge
                                </a>
                            <% } else { %>
                                <span class="text-discharged">Discharged</span>
                            <% } %>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="6" style="text-align: center; color: #64748b; padding: 20px;">
                            No patients found in the database.
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>