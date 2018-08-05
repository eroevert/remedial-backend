package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "personalDocumentKey")

public class PersonalDocument {
    private int personalDocumentKey;
    private int employeeKey;
    private int documentKey;
    private String number;
    private Timestamp issueDate;
    private Timestamp dueDate;
    private String observation;
    private byte[] digital;
    private String status;
    private String reference;
    private Employee employeeByEmployeeKey;
    private DocumentType documentTypeByDocumentKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PersonalDocumentKey", nullable = false)
    public int getPersonalDocumentKey() {
        return personalDocumentKey;
    }

    public void setPersonalDocumentKey(int personalDocumentKey) {
        this.personalDocumentKey = personalDocumentKey;
    }

    @Basic
    @Column(name = "EmployeeKey", nullable = false)
    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Basic
    @Column(name = "DocumentKey", nullable = false)
    public int getDocumentKey() {
        return documentKey;
    }

    public void setDocumentKey(int documentKey) {
        this.documentKey = documentKey;
    }

    @Basic
    @Column(name = "Number", nullable = false, length = 50)
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Basic
    @Column(name = "IssueDate", nullable = false)
    public Timestamp getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Timestamp issueDate) {
        this.issueDate = issueDate;
    }

    @Basic
    @Column(name = "DueDate", nullable = false)
    public Timestamp getDueDate() {
        return dueDate;
    }

    public void setDueDate(Timestamp dueDate) {
        this.dueDate = dueDate;
    }

    @Basic
    @Column(name = "Observation", nullable = false, length = 250)
    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    @Basic
    @Column(name = "Digital", nullable = true)
    public byte[] getDigital() {
        return digital;
    }

    public void setDigital(byte[] digital) {
        this.digital = digital;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 2)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "Reference", nullable = true, length = 4)
    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PersonalDocument that = (PersonalDocument) o;
        return personalDocumentKey == that.personalDocumentKey &&
                employeeKey == that.employeeKey &&
                documentKey == that.documentKey &&
                Objects.equals(number, that.number) &&
                Objects.equals(issueDate, that.issueDate) &&
                Objects.equals(dueDate, that.dueDate) &&
                Objects.equals(observation, that.observation) &&
                Arrays.equals(digital, that.digital) &&
                Objects.equals(status, that.status) &&
                Objects.equals(reference, that.reference);
    }

    @Override
    public int hashCode() {

        int result = Objects.hash(personalDocumentKey, employeeKey, documentKey, number, issueDate, dueDate, observation, status, reference);
        result = 31 * result + Arrays.hashCode(digital);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "EmployeeKey", referencedColumnName = "EmployeeKey", nullable = false, insertable=false, updatable=false)
    public Employee getEmployeeByEmployeeKey() {
        return employeeByEmployeeKey;
    }

    public void setEmployeeByEmployeeKey(Employee employeeByEmployeeKey) {
        this.employeeByEmployeeKey = employeeByEmployeeKey;
    }

    @ManyToOne
    @JoinColumn(name = "DocumentKey", referencedColumnName = "DocumentTypeKey", nullable = false, insertable=false, updatable=false)
    public DocumentType getDocumentTypeByDocumentKey() {
        return documentTypeByDocumentKey;
    }

    public void setDocumentTypeByDocumentKey(DocumentType documentTypeByDocumentKey) {
        this.documentTypeByDocumentKey = documentTypeByDocumentKey;
    }
}
