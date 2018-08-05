package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "professionKey")
public class Profession {
    private int professionKey;
    private String name;
    private int studyingTime;
    private Collection<AcademicInformation> academicInformationsByProfessionKey;

    @Id
    @Column(name = "ProfessionKey", nullable = false)
    public int getProfessionKey() {
        return professionKey;
    }

    public void setProfessionKey(int professionKey) {
        this.professionKey = professionKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 150)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "StudyingTime", nullable = false)
    public int getStudyingTime() {
        return studyingTime;
    }

    public void setStudyingTime(int studyingTime) {
        this.studyingTime = studyingTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Profession that = (Profession) o;
        return professionKey == that.professionKey &&
                studyingTime == that.studyingTime &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(professionKey, name, studyingTime);
    }

    @OneToMany(mappedBy = "professionByProfessionKey")
    @JsonIgnore
    public Collection<AcademicInformation> getAcademicInformationsByProfessionKey() {
        return academicInformationsByProfessionKey;
    }

    public void setAcademicInformationsByProfessionKey(Collection<AcademicInformation> academicInformationsByProfessionKey) {
        this.academicInformationsByProfessionKey = academicInformationsByProfessionKey;
    }
}
