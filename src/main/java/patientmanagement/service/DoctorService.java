package patientmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import patientmanagement.entity.Doctor;
import patientmanagement.repository.DoctorRepository;

@Service
public class DoctorService {

	@Autowired
    private DoctorRepository doctorRepository;

	
	public Doctor saveDoctor(Doctor doctor) {
		Doctor d=doctorRepository.save(doctor);
		return d;
	}
	
	public Doctor findDoctor(Integer id) {
		Doctor d= doctorRepository.findById(id).orElseThrow();
		return d;
	}
	
	public List<Doctor> getDoctors() {
		List<Doctor> list= doctorRepository.findAll();
		return list;
	}
}
