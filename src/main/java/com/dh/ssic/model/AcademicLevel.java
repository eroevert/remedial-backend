package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "academicLevelKey")

public class AcademicLevel {
    private int academicLevelKey;
    private String description;
    private String status;
    private Collection<AcademicInformation> academicInformationsByAcademicLevelKey;

    @Id
    @Column(name = "AcademicLevelKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getAcademicLevelKey() {
        return academicLevelKey;
    }

    public void setAcademicLevelKey(int academicLevelKey) {
        this.academicLevelKey = academicLevelKey;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 100)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 2)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AcademicLevel that = (AcademicLevel) o;
        return academicLevelKey == that.academicLevelKey &&
                Objects.equals(description, that.description) &&
                Objects.equals(status, that.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(academicLevelKey, description, status);
    }

    @OneToMany(mappedBy = "academicLevelByAcademicLevelKey")
    @JsonIgnore
    public Collection<AcademicInformation> getAcademicInformationsByAcademicLevelKey() {
        return academicInformationsByAcademicLevelKey;
    }

    public void setAcademicInformationsByAcademicLevelKey(Collection<AcademicInformation> academicInformationsByAcademicLevelKey) {
        this.academicInformationsByAcademicLevelKey = academicInformationsByAcademicLevelKey;
    }
}
