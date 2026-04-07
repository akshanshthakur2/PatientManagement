<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="patientmanagement.entity.Doctor" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient | Nexus Health</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="container">
        <header class="header">
            <a href="/patients" class="back-link">← Back to Patient List</a>
            <h1>Register New Patient</h1>
            <p>Admitting a new patient to the management system.</p>
        </header>

        <section class="form-section">
            <form action="/patients/savePatient" method="POST">
                
                <div class="form-grid">
                    <div class="form-group">
                        <label for="name">Patient Full Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter name" required>
                    </div>

                    <div class="form-group">
                        <label for="age">Age</label>
                        <input type="number" id="age" name="age" required>
                    </div>

                    <div class="form-group">
                        <label for="status">Status</label>
                        <select id="status" name="status" required>
                            <option value="Admitted">Admitted</option>
                            <option value="Pending">Pending</option>
                            <option value="Emergency">Emergency</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="doctor">Assign Doctor</label>
                        <select id="doctor" name="doctor.id" required>
                            <option value="">-- Select Doctor --</option>
                            <% 
                                // Casting the model attribute 'doctors' back to a List
                                List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
                                if (doctors != null) {
                                    for (Doctor doc : doctors) {
                            %>
                                <option value="<%= doc.getId() %>">
                                    Dr. <%= doc.getName() %>
                                </option>
                            <% 
                                    }
                                } 
                            %>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn-submit">Save Patient</button>
            </form>
        </section>
    </div>

</body>
</html>