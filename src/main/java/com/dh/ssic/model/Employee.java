package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "employeeKey")

public class Employee {
    @Column(name = "OrganizationKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int employeeKey;

    @Column(name = "OrganizationKey", nullable = false)
    private int organizationKey;

    @Column(name = "EmployeeCode", nullable = true, length = 15)
    private String employeeCode;

    @Column(name = "FirstName", nullable = true, length = 150)
    private String firstName;

    @Column(name = "LastName", nullable = true, length = 40)
    private String lastName;

    @Column(name = "BirthDate", nullable = true)
    private Timestamp birthDate;

    @Column(name = "Gender", nullable = true, length = 2)
    private String gender;

    @Column(name = "Nationality", nullable = true, length = 50)
    private String nationality;

    @Column(name = "AdmissionDate", nullable = true)
    private Timestamp admissionDate;

    @Column(name = "Status", nullable = false, length = 1)
    private String status;

    @Column(name = "Photo", nullable = true, length = 1)
    private String photo;

    @Column(name = "RegistrationDate", nullable = true)
    private Timestamp registrationDate;
    private Collection<AcademicInformation> academicInformationsByEmployeeKey;
    private Collection<ContactInformation> contactInformationsByEmployeeKey;
    private Organization organizationByOrganizationKey;
    private Collection<EquipmentAssignment> equipmentAssignmentsByEmployeeKey;
    private Collection<EquipmentReturn> equipmentReturnsByEmployeeKey;
    private Collection<PersonalDocument> personalDocumentsByEmployeeKey;
    private Collection<PositionHistorical> positionHistoricalsByEmployeeKey;
    private Collection<User> usersByEmployeeKey;
    private Collection<WorkExperience> workExperiencesByEmployeeKey;

    @Id
    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Basic
    public int getOrganizationKey() {
        return organizationKey;
    }

    public void setOrganizationKey(int organizationKey) {
        this.organizationKey = organizationKey;
    }

    @Basic
    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    @Basic
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Basic
    public Timestamp getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Timestamp birthDate) {
        this.birthDate = birthDate;
    }

    @Basic
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Basic
    public Timestamp getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Timestamp admissionDate) {
        this.admissionDate = admissionDate;
    }

    @Basic
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Basic
    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Employee employee = (Employee) o;
        return employeeKey == employee.employeeKey &&
                //organizationKey == employee.organizationKey &&
                Objects.equals(employeeCode, employee.employeeCode) &&
                Objects.equals(firstName, employee.firstName) &&
                Objects.equals(lastName, employee.lastName) &&
                Objects.equals(birthDate, employee.birthDate) &&
                Objects.equals(gender, employee.gender) &&
                Objects.equals(nationality, employee.nationality) &&
                Objects.equals(admissionDate, employee.admissionDate) &&
                Objects.equals(status, employee.status) &&
                Objects.equals(photo, employee.photo) &&
                Objects.equals(registrationDate, employee.registrationDate);
    }

    @Override
    public int hashCode() {

        return Objects.hash(employeeKey, organizationKey, employeeCode, firstName, lastName, birthDate, gender, nationality, admissionDate, status, photo, registrationDate);
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<AcademicInformation> getAcademicInformationsByEmployeeKey() {
        return academicInformationsByEmployeeKey;
    }

    public void setAcademicInformationsByEmployeeKey(Collection<AcademicInformation> academicInformationsByEmployeeKey) {
        this.academicInformationsByEmployeeKey = academicInformationsByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<ContactInformation> getContactInformationsByEmployeeKey() {
        return contactInformationsByEmployeeKey;
    }

    public void setContactInformationsByEmployeeKey(Collection<ContactInformation> contactInformationsByEmployeeKey) {
        this.contactInformationsByEmployeeKey = contactInformationsByEmployeeKey;
    }

    @ManyToOne
    @JoinColumn(name = "OrganizationKey", referencedColumnName = "OrganizationKey", nullable = false, insertable=false, updatable=false)
    public Organization getOrganizationByOrganizationKey() {
        return organizationByOrganizationKey;
    }

    public void setOrganizationByOrganizationKey(Organization organizationByOrganizationKey) {
        this.organizationByOrganizationKey = organizationByOrganizationKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<EquipmentAssignment> getEquipmentAssignmentsByEmployeeKey() {
        return equipmentAssignmentsByEmployeeKey;
    }

    public void setEquipmentAssignmentsByEmployeeKey(Collection<EquipmentAssignment> equipmentAssignmentsByEmployeeKey) {
        this.equipmentAssignmentsByEmployeeKey = equipmentAssignmentsByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<EquipmentReturn> getEquipmentReturnsByEmployeeKey() {
        return equipmentReturnsByEmployeeKey;
    }

    public void setEquipmentReturnsByEmployeeKey(Collection<EquipmentReturn> equipmentReturnsByEmployeeKey) {
        this.equipmentReturnsByEmployeeKey = equipmentReturnsByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<PersonalDocument> getPersonalDocumentsByEmployeeKey() {
        return personalDocumentsByEmployeeKey;
    }

    public void setPersonalDocumentsByEmployeeKey(Collection<PersonalDocument> personalDocumentsByEmployeeKey) {
        this.personalDocumentsByEmployeeKey = personalDocumentsByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<PositionHistorical> getPositionHistoricalsByEmployeeKey() {
        return positionHistoricalsByEmployeeKey;
    }

    public void setPositionHistoricalsByEmployeeKey(Collection<PositionHistorical> positionHistoricalsByEmployeeKey) {
        this.positionHistoricalsByEmployeeKey = positionHistoricalsByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<User> getUsersByEmployeeKey() {
        return usersByEmployeeKey;
    }

    public void setUsersByEmployeeKey(Collection<User> usersByEmployeeKey) {
        this.usersByEmployeeKey = usersByEmployeeKey;
    }

    @OneToMany(mappedBy = "employeeByEmployeeKey")
    @JsonIgnore
    public Collection<WorkExperience> getWorkExperiencesByEmployeeKey() {
        return workExperiencesByEmployeeKey;
    }

    public void setWorkExperiencesByEmployeeKey(Collection<WorkExperience> workExperiencesByEmployeeKey) {
        this.workExperiencesByEmployeeKey = workExperiencesByEmployeeKey;
    }
}
