package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "investigationKey")

public class Investigation {
    private int investigationKey;
    private Timestamp date;
    private String affectedArea;
    private String shortDescription;
    private String analysisRootCause;
    private String conclusions;
    private String recommendations;
    private Boolean itWasSolved;
    private int accidentKey;
    private int formSmsOrganigramaId;
    private int responsibleEmployeeKey;
    private String status;
    private Integer designateEmployeKey;
    private Integer statusInvestigation;
    private Integer rootCauseKey;
    private Date closeDate;
    private Collection<CorrectiveActions> correctiveActionsByInvestigationKey;
    private Accident accidentByAccidentKey;
    private RootCause rootCauseByRootCauseKey;

    @Id
    @Column(name = "InvestigationKey", nullable = false)
    public int getInvestigationKey() {
        return investigationKey;
    }

    public void setInvestigationKey(int investigationKey) {
        this.investigationKey = investigationKey;
    }

    @Basic
    @Column(name = "Date", nullable = true)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "AffectedArea", nullable = true, length = 1000)
    public String getAffectedArea() {
        return affectedArea;
    }

    public void setAffectedArea(String affectedArea) {
        this.affectedArea = affectedArea;
    }

    @Basic
    @Column(name = "ShortDescription", nullable = true, length = 8000)
    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    @Basic
    @Column(name = "AnalysisRootCause", nullable = true, length = 4000)
    public String getAnalysisRootCause() {
        return analysisRootCause;
    }

    public void setAnalysisRootCause(String analysisRootCause) {
        this.analysisRootCause = analysisRootCause;
    }

    @Basic
    @Column(name = "Conclusions", nullable = true, length = 3000)
    public String getConclusions() {
        return conclusions;
    }

    public void setConclusions(String conclusions) {
        this.conclusions = conclusions;
    }

    @Basic
    @Column(name = "Recommendations", nullable = true, length = 3000)
    public String getRecommendations() {
        return recommendations;
    }

    public void setRecommendations(String recommendations) {
        this.recommendations = recommendations;
    }

    @Basic
    @Column(name = "ItWasSolved", nullable = true)
    public Boolean getItWasSolved() {
        return itWasSolved;
    }

    public void setItWasSolved(Boolean itWasSolved) {
        this.itWasSolved = itWasSolved;
    }

    @Basic
    @Column(name = "AccidentKey", nullable = false)
    public int getAccidentKey() {
        return accidentKey;
    }

    public void setAccidentKey(int accidentKey) {
        this.accidentKey = accidentKey;
    }

    @Basic
    @Column(name = "formSMSOrganigramaId", nullable = false)
    public int getFormSmsOrganigramaId() {
        return formSmsOrganigramaId;
    }

    public void setFormSmsOrganigramaId(int formSmsOrganigramaId) {
        this.formSmsOrganigramaId = formSmsOrganigramaId;
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
    @Column(name = "Status", nullable = true, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "DesignateEmployeKey", nullable = true)
    public Integer getDesignateEmployeKey() {
        return designateEmployeKey;
    }

    public void setDesignateEmployeKey(Integer designateEmployeKey) {
        this.designateEmployeKey = designateEmployeKey;
    }

    @Basic
    @Column(name = "StatusInvestigation", nullable = true)
    public Integer getStatusInvestigation() {
        return statusInvestigation;
    }

    public void setStatusInvestigation(Integer statusInvestigation) {
        this.statusInvestigation = statusInvestigation;
    }

    @Basic
    @Column(name = "RootCauseKey", nullable = true)
    public Integer getRootCauseKey() {
        return rootCauseKey;
    }

    public void setRootCauseKey(Integer rootCauseKey) {
        this.rootCauseKey = rootCauseKey;
    }

    @Basic
    @Column(name = "CloseDate", nullable = true)
    public Date getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Date closeDate) {
        this.closeDate = closeDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Investigation that = (Investigation) o;
        return investigationKey == that.investigationKey &&
                accidentKey == that.accidentKey &&
                formSmsOrganigramaId == that.formSmsOrganigramaId &&
                responsibleEmployeeKey == that.responsibleEmployeeKey &&
                Objects.equals(date, that.date) &&
                Objects.equals(affectedArea, that.affectedArea) &&
                Objects.equals(shortDescription, that.shortDescription) &&
                Objects.equals(analysisRootCause, that.analysisRootCause) &&
                Objects.equals(conclusions, that.conclusions) &&
                Objects.equals(recommendations, that.recommendations) &&
                Objects.equals(itWasSolved, that.itWasSolved) &&
                Objects.equals(status, that.status) &&
                Objects.equals(designateEmployeKey, that.designateEmployeKey) &&
                Objects.equals(statusInvestigation, that.statusInvestigation) &&
                Objects.equals(rootCauseKey, that.rootCauseKey) &&
                Objects.equals(closeDate, that.closeDate);
    }

    @Override
    public int hashCode() {

        return Objects.hash(investigationKey, date, affectedArea, shortDescription, analysisRootCause, conclusions, recommendations, itWasSolved, accidentKey, formSmsOrganigramaId, responsibleEmployeeKey, status, designateEmployeKey, statusInvestigation, rootCauseKey, closeDate);
    }

    @OneToMany(mappedBy = "investigationByInvestigationKey")
    @JsonIgnore
    public Collection<CorrectiveActions> getCorrectiveActionsByInvestigationKey() {
        return correctiveActionsByInvestigationKey;
    }

    public void setCorrectiveActionsByInvestigationKey(Collection<CorrectiveActions> correctiveActionsByInvestigationKey) {
        this.correctiveActionsByInvestigationKey = correctiveActionsByInvestigationKey;
    }

    @ManyToOne
    @JoinColumn(name = "AccidentKey", referencedColumnName = "AccidentKey", nullable = false, insertable=false, updatable=false)
    public Accident getAccidentByAccidentKey() {
        return accidentByAccidentKey;
    }

    public void setAccidentByAccidentKey(Accident accidentByAccidentKey) {
        this.accidentByAccidentKey = accidentByAccidentKey;
    }

    @ManyToOne
    @JoinColumn(name = "RootCauseKey", referencedColumnName = "RootCauseKey", insertable=false, updatable=false)
    public RootCause getRootCauseByRootCauseKey() {
        return rootCauseByRootCauseKey;
    }

    public void setRootCauseByRootCauseKey(RootCause rootCauseByRootCauseKey) {
        this.rootCauseByRootCauseKey = rootCauseByRootCauseKey;
    }
}
