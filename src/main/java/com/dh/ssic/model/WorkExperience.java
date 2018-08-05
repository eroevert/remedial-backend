package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "workExperienceKey")

public class WorkExperience {
    private int workExperienceKey;
    private int institutionKey;
    private int employeeKey;
    private int cityKey;
    private String position;
    private Date start;
    private Date end;
    private String reasonChange;
    private Institution institutionByInstitutionKey;
    private Employee employeeByEmployeeKey;
    private City cityByCityKey;

    @Id
    @Column(name = "WorkExperienceKey", nullable = false)
    public int getWorkExperienceKey() {
        return workExperienceKey;
    }

    public void setWorkExperienceKey(int workExperienceKey) {
        this.workExperienceKey = workExperienceKey;
    }

    @Basic
    @Column(name = "InstitutionKey", nullable = false)
    public int getInstitutionKey() {
        return institutionKey;
    }

    public void setInstitutionKey(int institutionKey) {
        this.institutionKey = institutionKey;
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
    @Column(name = "Position", nullable = false, length = 200)
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Basic
    @Column(name = "Start", nullable = false)
    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    @Basic
    @Column(name = "End", nullable = false)
    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    @Basic
    @Column(name = "ReasonChange", nullable = false, length = 500)
    public String getReasonChange() {
        return reasonChange;
    }

    public void setReasonChange(String reasonChange) {
        this.reasonChange = reasonChange;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WorkExperience that = (WorkExperience) o;
        return workExperienceKey == that.workExperienceKey &&
                institutionKey == that.institutionKey &&
                employeeKey == that.employeeKey &&
                cityKey == that.cityKey &&
                Objects.equals(position, that.position) &&
                Objects.equals(start, that.start) &&
                Objects.equals(end, that.end) &&
                Objects.equals(reasonChange, that.reasonChange);
    }

    @Override
    public int hashCode() {

        return Objects.hash(workExperienceKey, institutionKey, employeeKey, cityKey, position, start, end, reasonChange);
    }

    @ManyToOne
    @JoinColumn(name = "InstitutionKey", referencedColumnName = "InstitutionKey", nullable = false, insertable=false, updatable=false)
    public Institution getInstitutionByInstitutionKey() {
        return institutionByInstitutionKey;
    }

    public void setInstitutionByInstitutionKey(Institution institutionByInstitutionKey) {
        this.institutionByInstitutionKey = institutionByInstitutionKey;
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
    @JoinColumn(name = "CityKey", referencedColumnName = "CityKey", nullable = false, insertable=false, updatable=false)
    public City getCityByCityKey() {
        return cityByCityKey;
    }

    public void setCityByCityKey(City cityByCityKey) {
        this.cityByCityKey = cityByCityKey;
    }
}
