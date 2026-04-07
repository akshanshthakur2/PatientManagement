package patientmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import patientmanagement.entity.Doctor;
import patientmanagement.service.DoctorService;
import patientmanagement.service.PatientService;

@Controller
@RequestMapping("/doctors")
public class DoctorController {


    private final DoctorService doctorService;

    DoctorController(DoctorService doctorService, PatientService patientService) {
        this.doctorService = doctorService;
    }

	@GetMapping
	public String doctorHome(Model m) {
		List<Doctor> list= doctorService.getDoctors();
		m.addAttribute("doctors", list);
		return "doctor";
	}
	
	@PostMapping("/saveDoctor")
	public String saveDoctor(Doctor doctor) {
		Doctor d= doctorService.saveDoctor(doctor);
		return "redirect:/doctors";
	}
}
