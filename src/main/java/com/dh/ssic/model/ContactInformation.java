package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "contactInformationKey")

public class ContactInformation {
    private int contactInformationKey;
    private int typeContactKey;
    private int employeeKey;
    private String value;
    private String reference;
    private TypeContact typeContactByTypeContactKey;
    private Employee employeeByEmployeeKey;

    @Id
    @Column(name = "ContactInformationKey", nullable = false)
    public int getContactInformationKey() {
        return contactInformationKey;
    }

    public void setContactInformationKey(int contactInformationKey) {
        this.contactInformationKey = contactInformationKey;
    }

    @Basic
    @Column(name = "TypeContactKey", nullable = false)
    public int getTypeContactKey() {
        return typeContactKey;
    }

    public void setTypeContactKey(int typeContactKey) {
        this.typeContactKey = typeContactKey;
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
    @Column(name = "Value", nullable = false, length = 100)
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Basic
    @Column(name = "Reference", nullable = true, length = 50)
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
        ContactInformation that = (ContactInformation) o;
        return contactInformationKey == that.contactInformationKey &&
                typeContactKey == that.typeContactKey &&
                employeeKey == that.employeeKey &&
                Objects.equals(value, that.value) &&
                Objects.equals(reference, that.reference);
    }

    @Override
    public int hashCode() {

        return Objects.hash(contactInformationKey, typeContactKey, employeeKey, value, reference);
    }

    @ManyToOne
    @JoinColumn(name = "TypeContactKey", referencedColumnName = "TypeContactKey", nullable = false, insertable=false, updatable=false)
    public TypeContact getTypeContactByTypeContactKey() {
        return typeContactByTypeContactKey;
    }

    public void setTypeContactByTypeContactKey(TypeContact typeContactByTypeContactKey) {
        this.typeContactByTypeContactKey = typeContactByTypeContactKey;
    }

    @ManyToOne
    @JoinColumn(name = "EmployeeKey", referencedColumnName = "EmployeeKey", nullable = false, insertable=false, updatable=false)
    public Employee getEmployeeByEmployeeKey() {
        return employeeByEmployeeKey;
    }

    public void setEmployeeByEmployeeKey(Employee employeeByEmployeeKey) {
        this.employeeByEmployeeKey = employeeByEmployeeKey;
    }
}
