package patientmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import patientmanagement.entity.Patient;
import patientmanagement.repository.PatientRepository;

@Service
public class PatientService {

    private final PatientRepository patientRepository;

    PatientService(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }
	
	public Patient savePatient(Patient patient) {
		Patient p=patientRepository.save(patient);
		return p;
	}
	
	public List<Patient> getPatient() {
		List<Patient> p=patientRepository.findAll();
		return p;
	}
	
	
}
