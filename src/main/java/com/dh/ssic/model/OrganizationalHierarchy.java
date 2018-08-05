package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "organizationalHierarchyKey")

public class OrganizationalHierarchy {
    private int organizationalHierarchyKey;
    private String description;
    private Collection<Position> positionsByOrganizationalHierarchyKey;

    @Id
    @Column(name = "OrganizationalHierarchyKey", nullable = false)
    public int getOrganizationalHierarchyKey() {
        return organizationalHierarchyKey;
    }

    public void setOrganizationalHierarchyKey(int organizationalHierarchyKey) {
        this.organizationalHierarchyKey = organizationalHierarchyKey;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 50)
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
        OrganizationalHierarchy that = (OrganizationalHierarchy) o;
        return organizationalHierarchyKey == that.organizationalHierarchyKey &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(organizationalHierarchyKey, description);
    }

    @OneToMany(mappedBy = "organizationalHierarchyByOrganizationalHierarchyKey")
    @JsonIgnore
    public Collection<Position> getPositionsByOrganizationalHierarchyKey() {
        return positionsByOrganizationalHierarchyKey;
    }

    public void setPositionsByOrganizationalHierarchyKey(Collection<Position> positionsByOrganizationalHierarchyKey) {
        this.positionsByOrganizationalHierarchyKey = positionsByOrganizationalHierarchyKey;
    }
}
