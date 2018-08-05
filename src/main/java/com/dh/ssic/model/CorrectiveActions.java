package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "correctiveActionKey")

public class CorrectiveActions {
    private int correctiveActionKey;
    private int investigationKey;
    private String description;
    private Timestamp dateExecute;
    private String status;
    private Timestamp dateEnd;
    private int responsibleEmployeeKey;
    private String observation;
    private Integer empleadoKey;
    private Integer statusAccion;
    private Integer parentKey;
    private Collection<CorrectiveActionFile> correctiveActionFilesByCorrectiveActionKey;
    private Investigation investigationByInvestigationKey;

    @Id
    @Column(name = "CorrectiveActionKey", nullable = false)
    public int getCorrectiveActionKey() {
        return correctiveActionKey;
    }

    public void setCorrectiveActionKey(int correctiveActionKey) {
        this.correctiveActionKey = correctiveActionKey;
    }

    @Basic
    @Column(name = "InvestigationKey", nullable = false)
    public int getInvestigationKey() {
        return investigationKey;
    }

    public void setInvestigationKey(int investigationKey) {
        this.investigationKey = investigationKey;
    }

    @Basic
    @Column(name = "Description", nullable = true, length = 3000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "DateExecute", nullable = true)
    public Timestamp getDateExecute() {
        return dateExecute;
    }

    public void setDateExecute(Timestamp dateExecute) {
        this.dateExecute = dateExecute;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "DateEnd", nullable = true)
    public Timestamp getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Timestamp dateEnd) {
        this.dateEnd = dateEnd;
    }

    @Basic
    @Column(name = "ResponsibleEmployeeKey", nullable = false)
    public int getResponsibleEmployeeKey() {
        return responsibleEmployeeKey;
    }

    public void setResponsibleEmployeeKey(int responsibleEmployeeKey) {
        this.responsibleEmployeeKey = responsibleEmployeeKey;
    }

    @Basic
    @Column(name = "Observation", nullable = true, length = 5000)
    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    @Basic
    @Column(name = "EmpleadoKey", nullable = true)
    public Integer getEmpleadoKey() {
        return empleadoKey;
    }

    public void setEmpleadoKey(Integer empleadoKey) {
        this.empleadoKey = empleadoKey;
    }

    @Basic
    @Column(name = "StatusAccion", nullable = true)
    public Integer getStatusAccion() {
        return statusAccion;
    }

    public void setStatusAccion(Integer statusAccion) {
        this.statusAccion = statusAccion;
    }

    @Basic
    @Column(name = "ParentKey", nullable = true)
    public Integer getParentKey() {
        return parentKey;
    }

    public void setParentKey(Integer parentKey) {
        this.parentKey = parentKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CorrectiveActions that = (CorrectiveActions) o;
        return correctiveActionKey == that.correctiveActionKey &&
                investigationKey == that.investigationKey &&
                responsibleEmployeeKey == that.responsibleEmployeeKey &&
                Objects.equals(description, that.description) &&
                Objects.equals(dateExecute, that.dateExecute) &&
                Objects.equals(status, that.status) &&
                Objects.equals(dateEnd, that.dateEnd) &&
                Objects.equals(observation, that.observation) &&
                Objects.equals(empleadoKey, that.empleadoKey) &&
                Objects.equals(statusAccion, that.statusAccion) &&
                Objects.equals(parentKey, that.parentKey);
    }

    @Override
    public int hashCode() {

        return Objects.hash(correctiveActionKey, investigationKey, description, dateExecute, status, dateEnd, responsibleEmployeeKey, observation, empleadoKey, statusAccion, parentKey);
    }

    @OneToMany(mappedBy = "correctiveActionsByCorrectiveActionKey")
    @JsonIgnore
    public Collection<CorrectiveActionFile> getCorrectiveActionFilesByCorrectiveActionKey() {
        return correctiveActionFilesByCorrectiveActionKey;
    }

    public void setCorrectiveActionFilesByCorrectiveActionKey(Collection<CorrectiveActionFile> correctiveActionFilesByCorrectiveActionKey) {
        this.correctiveActionFilesByCorrectiveActionKey = correctiveActionFilesByCorrectiveActionKey;
    }

    @ManyToOne
    @JoinColumn(name = "InvestigationKey", referencedColumnName = "InvestigationKey", nullable = false, insertable=false, updatable=false)
    public Investigation getInvestigationByInvestigationKey() {
        return investigationByInvestigationKey;
    }

    public void setInvestigationByInvestigationKey(Investigation investigationByInvestigationKey) {
        this.investigationByInvestigationKey = investigationByInvestigationKey;
    }
}
