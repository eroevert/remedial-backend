package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "afectedEmployeeKey")

public class AfectedEmployee {
    private int afectedEmployeeKey;
    private int accidentKey;
    private int employeeKey;
    private Accident accidentByAccidentKey;

    @Id
    @Column(name = "AfectedEmployeeKey", nullable = false)
    public int getAfectedEmployeeKey() {
        return afectedEmployeeKey;
    }

    public void setAfectedEmployeeKey(int afectedEmployeeKey) {
        this.afectedEmployeeKey = afectedEmployeeKey;
    }

    @Basic
    @Column(name = "AccidentKey", nullable = false, insertable = false, updatable = false)
    public int getAccidentKey() {
        return accidentKey;
    }

    public void setAccidentKey(int accidentKey) {
        this.accidentKey = accidentKey;
    }

    @Basic
    @Column(name = "EmployeeKey", nullable = false)
    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AfectedEmployee that = (AfectedEmployee) o;
        return afectedEmployeeKey == that.afectedEmployeeKey &&
                accidentKey == that.accidentKey &&
                employeeKey == that.employeeKey;
    }

    @Override
    public int hashCode() {

        return Objects.hash(afectedEmployeeKey, accidentKey, employeeKey);
    }

    @ManyToOne
    @JoinColumn(name = "AccidentKey", referencedColumnName = "AccidentKey", nullable = false, insertable=false, updatable=false)
    public Accident getAccidentByAccidentKey() {
        return accidentByAccidentKey;
    }

    public void setAccidentByAccidentKey(Accident accidentByAccidentKey) {
        this.accidentByAccidentKey = accidentByAccidentKey;
    }
}
