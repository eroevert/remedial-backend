package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "rootCauseKey")

public class RootCause {
    private int rootCauseKey;
    private String description;
    private String details;
    private String status;
    private String code;
    private Collection<Investigation> investigationsByRootCauseKey;

    @Id
    @Column(name = "RootCauseKey", nullable = false)
    public int getRootCauseKey() {
        return rootCauseKey;
    }

    public void setRootCauseKey(int rootCauseKey) {
        this.rootCauseKey = rootCauseKey;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 5000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Details", nullable = true, length = 2000)
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Basic
    @Column(name = "status", nullable = false, length = 2)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "code", nullable = true, length = 8)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RootCause rootCause = (RootCause) o;
        return rootCauseKey == rootCause.rootCauseKey &&
                Objects.equals(description, rootCause.description) &&
                Objects.equals(details, rootCause.details) &&
                Objects.equals(status, rootCause.status) &&
                Objects.equals(code, rootCause.code);
    }

    @Override
    public int hashCode() {

        return Objects.hash(rootCauseKey, description, details, status, code);
    }

    @OneToMany(mappedBy = "rootCauseByRootCauseKey")
    @JsonIgnore
    public Collection<Investigation> getInvestigationsByRootCauseKey() {
        return investigationsByRootCauseKey;
    }

    public void setInvestigationsByRootCauseKey(Collection<Investigation> investigationsByRootCauseKey) {
        this.investigationsByRootCauseKey = investigationsByRootCauseKey;
    }
}
