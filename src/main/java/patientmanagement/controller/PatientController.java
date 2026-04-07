package patientmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import patientmanagement.entity.Doctor;
import patientmanagement.entity.Patient;
import patientmanagement.repository.DoctorRepository;
import patientmanagement.service.DoctorService;
import patientmanagement.service.PatientService;

@Controller
@RequestMapping("/patients")
public class PatientController {

    private final DoctorRepository doctorRepository;

    private final PatientService patientService;

    private final DoctorService doctorService;

    PatientController(DoctorService doctorService, PatientService patientService, DoctorRepository doctorRepository) {
        this.doctorService = doctorService;
        this.patientService = patientService;
        this.doctorRepository = doctorRepository;
    }
	
	@GetMapping
	public String patientHome(Model m) {
		List<Patient> list= patientService.getPatient();
		m.addAttribute("patients", list);
		return "patient";
	}
	
	@GetMapping("/addPatient")
	public String addPatient(Model m) {
		List<Doctor> list= doctorService.getDoctors();
		m.addAttribute("doctors", list);
		return "addPatient";
	}
	
	@PostMapping("/savePatient")
	public String savePatient(Patient p, Model m) {
		Doctor d= doctorService.findDoctor(p.getDoctor().getId());
		p.setDoctor(d);
		patientService.savePatient(p);
		return "redirect:/patients";
	}
}
