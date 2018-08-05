package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "hierarchicalLevelKey")
public class HierarchicalLevel {
    private int hierarchicalLevelKey;
    private String name;
    private String level;
    private String status;

    private Collection<Organization> organizationsByHierarchicalLevelKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "HierarchicalLevelKey", nullable = false)
    public int getHierarchicalLevelKey() {
        return hierarchicalLevelKey;
    }

    public void setHierarchicalLevelKey(int hierarchicalLevelKey) {
        this.hierarchicalLevelKey = hierarchicalLevelKey;
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
    @Column(name = "Level", nullable = false, length = 2)
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 1)
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
        HierarchicalLevel that = (HierarchicalLevel) o;
        return hierarchicalLevelKey == that.hierarchicalLevelKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(level, that.level) &&
                Objects.equals(status, that.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(hierarchicalLevelKey, name, level, status);
    }

    @OneToMany(mappedBy = "hierarchicalLevelByHierarchicalLevelKey", fetch = FetchType.EAGER)
    @JsonIgnore
    public Collection<Organization> getOrganizationsByHierarchicalLevelKey() {
        return organizationsByHierarchicalLevelKey;
    }

    public void setOrganizationsByHierarchicalLevelKey(Collection<Organization> organizationsByHierarchicalLevelKey) {
        this.organizationsByHierarchicalLevelKey = organizationsByHierarchicalLevelKey;
    }
}
