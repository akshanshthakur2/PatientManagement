<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="patientmanagement.entity.Doctor" %>
<%@ page import="patientmanagement.entity.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctors</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

    <div class="container">
        <header class="header">
            <a href="/index" class="back-link" style="color: #10b981;">← Back to Dashboard</a>
            <h1>Doctor Directory</h1>
            <p>Add medical professionals and review their patient load.</p>
        </header>

        <section class="form-section">
            <form action="/doctors/saveDoctor" method="POST">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="name">Doctor Name</label>
                        <input type="text" id="name" name="name" placeholder="Full Name" required>
                    </div>
                    <div class="form-group">
                        <label for="specialization">Specialization</label>
                        <input type="text" id="specialization" name="specialization" placeholder="e.g. Neurology" required>
                    </div>
                </div>
                <button type="submit" class="btn-submit btn-doctor-theme">Add to Staff</button>
            </form>
        </section>

        <h2>Staff & Patient Assignments</h2>
        
        <% 
            // Fetching the doctors list from the model attribute
            List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctors");
            if (doctorList != null && !doctorList.isEmpty()) {
                for (Doctor doc : doctorList) {
        %>
            <div class="doctor-card">
                <h3>Dr. <%= doc.getName() %> 
                    <small style="font-weight: 400; color: #64748b;">— <%= doc.getSpecialization() %></small>
                </h3>
                <p class="patient-list-text">
                    <strong>Current Patients:</strong> 
                    <% 
                        List<Patient> patients = doc.getPatients();
                        if (patients != null && !patients.isEmpty()) {
                            for (int i = 0; i < patients.size(); i++) {
                                out.print(patients.get(i).getName() + (i < patients.size() - 1 ? ", " : ""));
                            }
                        } else {
                            out.print("No patients assigned yet.");
                        }
                    %>
                </p>
            </div>
        <% 
                }
            } else {
        %>
            <p style="color: #64748b;">No doctors found in the database.</p>
        <% } %>
    </div>

</body>
</html>