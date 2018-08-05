package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "academicInformationKey")

public class AcademicInformation {
    private int academicInformationKey;
    private int employeeKey;
    private int cityKey;
    private int academicLevelKey;
    private int professionKey;
    private String status;
    private String start;
    private String end;
    private String institution;
    private boolean academicTitle;
    private boolean nationalTitle;
    private Employee employeeByEmployeeKey;
    private City cityByCityKey;
    private AcademicLevel academicLevelByAcademicLevelKey;
    private Profession professionByProfessionKey;

    @Id
    @Column(name = "AcademicInformationKey", nullable = false)
    public int getAcademicInformationKey() {
        return academicInformationKey;
    }

    public void setAcademicInformationKey(int academicInformationKey) {
        this.academicInformationKey = academicInformationKey;
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
    @Column(name = "CityKey", nullable = false)
    public int getCityKey() {
        return cityKey;
    }

    public void setCityKey(int cityKey) {
        this.cityKey = cityKey;
    }

    @Basic
    @Column(name = "AcademicLevelKey", nullable = false)
    public int getAcademicLevelKey() {
        return academicLevelKey;
    }

    public void setAcademicLevelKey(int academicLevelKey) {
        this.academicLevelKey = academicLevelKey;
    }

    @Basic
    @Column(name = "ProfessionKey", nullable = false)
    public int getProfessionKey() {
        return professionKey;
    }

    public void setProfessionKey(int professionKey) {
        this.professionKey = professionKey;
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
    @Column(name = "Start", nullable = false, length = 12)
    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    @Basic
    @Column(name = "End", nullable = false, length = 12)
    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    @Basic
    @Column(name = "Institution", nullable = false, length = 500)
    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    @Basic
    @Column(name = "AcademicTitle", nullable = false)
    public boolean isAcademicTitle() {
        return academicTitle;
    }

    public void setAcademicTitle(boolean academicTitle) {
        this.academicTitle = academicTitle;
    }

    @Basic
    @Column(name = "NationalTitle", nullable = false)
    public boolean isNationalTitle() {
        return nationalTitle;
    }

    public void setNationalTitle(boolean nationalTitle) {
        this.nationalTitle = nationalTitle;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AcademicInformation that = (AcademicInformation) o;
        return academicInformationKey == that.academicInformationKey &&
                employeeKey == that.employeeKey &&
                cityKey == that.cityKey &&
                academicLevelKey == that.academicLevelKey &&
                professionKey == that.professionKey &&
                academicTitle == that.academicTitle &&
                nationalTitle == that.nationalTitle &&
                Objects.equals(status, that.status) &&
                Objects.equals(start, that.start) &&
                Objects.equals(end, that.end) &&
                Objects.equals(institution, that.institution);
    }

    @Override
    public int hashCode() {

        return Objects.hash(academicInformationKey, employeeKey, cityKey, academicLevelKey, professionKey, status, start, end, institution, academicTitle, nationalTitle);
    }

    @ManyToOne
    @JoinColumn(name = "EmployeeKey", referencedColumnName = "EmployeeKey", nullable = false,insertable = false,updatable = false)
    public Employee getEmployeeByEmployeeKey() {
        return employeeByEmployeeKey;
    }

    public void setEmployeeByEmployeeKey(Employee employeeByEmployeeKey) {
        this.employeeByEmployeeKey = employeeByEmployeeKey;
    }

    @ManyToOne
    @JoinColumn(name = "CityKey", referencedColumnName = "CityKey", nullable = false, insertable=false, updatable=false)
    public City getCityByCityKey() {
        return cityByCityKey;
    }

    public void setCityByCityKey(City cityByCityKey) {
        this.cityByCityKey = cityByCityKey;
    }

    @ManyToOne
    @JoinColumn(name = "AcademicLevelKey", referencedColumnName = "AcademicLevelKey", nullable = false, insertable=false, updatable=false)
    public AcademicLevel getAcademicLevelByAcademicLevelKey() {
        return academicLevelByAcademicLevelKey;
    }

    public void setAcademicLevelByAcademicLevelKey(AcademicLevel academicLevelByAcademicLevelKey) {
        this.academicLevelByAcademicLevelKey = academicLevelByAcademicLevelKey;
    }

    @ManyToOne
    @JoinColumn(name = "ProfessionKey", referencedColumnName = "ProfessionKey", nullable = false, insertable=false, updatable=false)
    public Profession getProfessionByProfessionKey() {
        return professionByProfessionKey;
    }

    public void setProfessionByProfessionKey(Profession professionByProfessionKey) {
        this.professionByProfessionKey = professionByProfessionKey;
    }
}
