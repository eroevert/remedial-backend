package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlTransient;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "positionKey")
public class Position {
    private int positionKey;
    private Integer organizationalHierarchyKey;
    private String name;
    private String education;
    private String status;
    private String description;
    private Collection<Item> itemsByPositionKey;
    private OrganizationalHierarchy organizationalHierarchyByOrganizationalHierarchyKey;
    private Collection<SkillsPosition> skillsPositionsByPositionKey;
    private Collection<TrainingPosition> trainingPositionsByPositionKey;

    @Id
    @Column(name = "PositionKey", nullable = false)
    public int getPositionKey() {
        return positionKey;
    }

    public void setPositionKey(int positionKey) {
        this.positionKey = positionKey;
    }

    @Basic
    @Column(name = "OrganizationalHierarchyKey", nullable = true)
    public Integer getOrganizationalHierarchyKey() {
        return organizationalHierarchyKey;
    }

    public void setOrganizationalHierarchyKey(Integer organizationalHierarchyKey) {
        this.organizationalHierarchyKey = organizationalHierarchyKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 200)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Education", nullable = true, length = 500)
    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 1)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "Description", nullable = true, length = 500)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Position position = (Position) o;
        return positionKey == position.positionKey &&
                Objects.equals(organizationalHierarchyKey, position.organizationalHierarchyKey) &&
                Objects.equals(name, position.name) &&
                Objects.equals(education, position.education) &&
                Objects.equals(status, position.status) &&
                Objects.equals(description, position.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(positionKey, organizationalHierarchyKey, name, education, status, description);
    }

    @OneToMany(mappedBy = "positionByPositionKey")
    @JsonIgnore
    public Collection<Item> getItemsByPositionKey() {
        return itemsByPositionKey;
    }

    public void setItemsByPositionKey(Collection<Item> itemsByPositionKey) {
        this.itemsByPositionKey = itemsByPositionKey;
    }

    @ManyToOne
    @JoinColumn(name = "OrganizationalHierarchyKey", referencedColumnName = "OrganizationalHierarchyKey", insertable=false, updatable=false)
    public OrganizationalHierarchy getOrganizationalHierarchyByOrganizationalHierarchyKey() {
        return organizationalHierarchyByOrganizationalHierarchyKey;
    }

    public void setOrganizationalHierarchyByOrganizationalHierarchyKey(OrganizationalHierarchy organizationalHierarchyByOrganizationalHierarchyKey) {
        this.organizationalHierarchyByOrganizationalHierarchyKey = organizationalHierarchyByOrganizationalHierarchyKey;
    }

    @OneToMany(mappedBy = "positionByPositionKey")
    @JsonIgnore
    public Collection<SkillsPosition> getSkillsPositionsByPositionKey() {
        return skillsPositionsByPositionKey;
    }

    public void setSkillsPositionsByPositionKey(Collection<SkillsPosition> skillsPositionsByPositionKey) {
        this.skillsPositionsByPositionKey = skillsPositionsByPositionKey;
    }

    @OneToMany(mappedBy = "positionByPositionKey")
    @JsonIgnore
    public Collection<TrainingPosition> getTrainingPositionsByPositionKey() {
        return trainingPositionsByPositionKey;
    }

    public void setTrainingPositionsByPositionKey(Collection<TrainingPosition> trainingPositionsByPositionKey) {
        this.trainingPositionsByPositionKey = trainingPositionsByPositionKey;
    }
}
