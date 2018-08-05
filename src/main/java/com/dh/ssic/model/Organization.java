package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;
@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "organizationKey")

public class Organization {
    @Column(name = "OrganizationKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int organizationKey;
    @Column(name = "HierarchicalLevelKey", nullable = false)
    private int hierarchicalLevelKey;
    @Column(name = "IdPadre", nullable = false)
    private int idPadre;
    @Column(name = "Name", nullable = false, length = 200)
    private String name;
    @Column(name = "Description", nullable = false, length = 200)
    private String description;
    @Column(name = "Code", nullable = false, length = 20)
    private String code;
    @Column(name = "Start", nullable = false)
    private Timestamp start;
    @Column(name = "End", nullable = false)
    private Timestamp end;
    @Column(name = "Status", nullable = false, length = 1)
    private String status;
    @Column(name = "Gestion", nullable = true, length = 4)
    private String gestion;
    private Collection<Employee> employeesByOrganizationKey;
    private Collection<Item> itemsByOrganizationKey;
    private HierarchicalLevel hierarchicalLevelByHierarchicalLevelKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getOrganizationKey() {
        return organizationKey;
    }

    public void setOrganizationKey(int organizationKey) {
        this.organizationKey = organizationKey;
    }

    @Basic
    public int getHierarchicalLevelKey() {
        return hierarchicalLevelKey;
    }

    public void setHierarchicalLevelKey(int hierarchicalLevelKey) {
        this.hierarchicalLevelKey = hierarchicalLevelKey;
    }

    @Basic
    public int getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(int idPadre) {
        this.idPadre = idPadre;
    }

    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    public Timestamp getStart() {
        return start;
    }

    public void setStart(Timestamp start) {
        this.start = start;
    }

    @Basic
    public Timestamp getEnd() {
        return end;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }

    @Basic
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    public String getGestion() {
        return gestion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Organization that = (Organization) o;
        return organizationKey == that.organizationKey &&
                hierarchicalLevelKey == that.hierarchicalLevelKey &&
                idPadre == that.idPadre &&
                Objects.equals(name, that.name) &&
                Objects.equals(description, that.description) &&
                Objects.equals(code, that.code) &&
                Objects.equals(start, that.start) &&
                Objects.equals(end, that.end) &&
                Objects.equals(status, that.status) &&
                Objects.equals(gestion, that.gestion);
    }

    @Override
    public int hashCode() {

        return Objects.hash(organizationKey, hierarchicalLevelKey, idPadre, name, description, code, start, end, status, gestion);
    }

    @OneToMany(mappedBy = "organizationByOrganizationKey", cascade = {CascadeType.ALL})
    @JsonIgnore
    public Collection<Employee> getEmployeesByOrganizationKey() {
        return employeesByOrganizationKey;
    }

    public void setEmployeesByOrganizationKey(Collection<Employee> employeesByOrganizationKey) {
        this.employeesByOrganizationKey = employeesByOrganizationKey;
}

    @OneToMany(mappedBy = "organizationByOrganizationKey",cascade = {CascadeType.ALL})
    @JsonIgnore
    public Collection<Item> getItemsByOrganizationKey() {
        return itemsByOrganizationKey;
    }

    public void setItemsByOrganizationKey(Collection<Item> itemsByOrganizationKey) {
        this.itemsByOrganizationKey = itemsByOrganizationKey;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name = "HierarchicalLevelKey", referencedColumnName = "HierarchicalLevelKey", nullable = false, insertable=false, updatable=false)
    public HierarchicalLevel getHierarchicalLevelByHierarchicalLevelKey() {
        return hierarchicalLevelByHierarchicalLevelKey;
    }

    public void setHierarchicalLevelByHierarchicalLevelKey(HierarchicalLevel hierarchicalLevelByHierarchicalLevelKey) {
        this.hierarchicalLevelByHierarchicalLevelKey = hierarchicalLevelByHierarchicalLevelKey;
    }
}
