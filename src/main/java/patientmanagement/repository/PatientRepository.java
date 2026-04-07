package patientmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import patientmanagement.entity.Patient;


@Repository
public interface PatientRepository extends JpaRepository<Patient, Integer>{

}
