package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "institutionKey")

public class Institution {
    private int institutionKey;
    private String name;
    private String type;
    private Collection<WorkExperience> workExperiencesByInstitutionKey;

    @Id
    @Column(name = "InstitutionKey", nullable = false)
    public int getInstitutionKey() {
        return institutionKey;
    }

    public void setInstitutionKey(int institutionKey) {
        this.institutionKey = institutionKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Type", nullable = false, length = 50)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Institution that = (Institution) o;
        return institutionKey == that.institutionKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(type, that.type);
    }

    @Override
    public int hashCode() {

        return Objects.hash(institutionKey, name, type);
    }

    @OneToMany(mappedBy = "institutionByInstitutionKey")
    @JsonIgnore
    public Collection<WorkExperience> getWorkExperiencesByInstitutionKey() {
        return workExperiencesByInstitutionKey;
    }

    public void setWorkExperiencesByInstitutionKey(Collection<WorkExperience> workExperiencesByInstitutionKey) {
        this.workExperiencesByInstitutionKey = workExperiencesByInstitutionKey;
    }
}
