package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "accidentKey")

public class Accident {
    private int accidentKey;
    private Timestamp dateEvent;
    private Timestamp dateRegister;
    private String title;
    private String describeIssue;
    private String suggestion;
    private int levelRiskId;
    private int accidentTypeKey;
    private int employeeKey;
    private boolean isAnonymous;
    private Integer responsibleEmployeeKey;
    private String status;
    private Timestamp closeDate;
    private String code;
    private Boolean isMandatory;
    private Boolean isVoluntary;
    private Timestamp endDate;
    private Integer createdReportFromAdmin;
    private Integer statusReport;
    private AccidentType accidentTypeByAccidentTypeKey;
    private Collection<AfectedEmployee> afectedEmployeesByAccidentKey;
    private Collection<Attachment> attachmentsByAccidentKey;
    private Collection<FinalRiskLevel> finalRiskLevelsByAccidentKey;
    private Collection<InitialRiskLevel> initialRiskLevelsByAccidentKey;
    private Collection<Investigation> investigationsByAccidentKey;
    private Collection<SuggestionProblem> suggestionProblemsByAccidentKey;

    @Id
    @Column(name = "AccidentKey", nullable = false)
    public int getAccidentKey() {
        return accidentKey;
    }

    public void setAccidentKey(int accidentKey) {
        this.accidentKey = accidentKey;
    }

    @Basic
    @Column(name = "DateEvent", nullable = true)
    public Timestamp getDateEvent() {
        return dateEvent;
    }

    public void setDateEvent(Timestamp dateEvent) {
        this.dateEvent = dateEvent;
    }

    @Basic
    @Column(name = "DateRegister", nullable = true)
    public Timestamp getDateRegister() {
        return dateRegister;
    }

    public void setDateRegister(Timestamp dateRegister) {
        this.dateRegister = dateRegister;
    }

    @Basic
    @Column(name = "Title", nullable = false, length = 200)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "DescribeIssue", nullable = true, length = 8000)
    public String getDescribeIssue() {
        return describeIssue;
    }

    public void setDescribeIssue(String describeIssue) {
        this.describeIssue = describeIssue;
    }

    @Basic
    @Column(name = "Suggestion", nullable = true, length = 2000)
    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    @Basic
    @Column(name = "levelRiskId", nullable = true)
    public int getLevelRiskId() {
        return levelRiskId;
    }

    public void setLevelRiskId(int levelRiskId) {
        this.levelRiskId = levelRiskId;
    }

    @Basic
    @Column(name = "AccidentTypeKey", nullable = false)
    public int getAccidentTypeKey() {
        return accidentTypeKey;
    }

    public void setAccidentTypeKey(int accidentTypeKey) {
        this.accidentTypeKey = accidentTypeKey;
    }

    @Basic
    @Column(name = "EmployeeKey", nullable = false)
    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Basic
    @Column(name = "IsAnonymous", nullable = true)
    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }

    @Basic
    @Column(name = "ResponsibleEmployeeKey", nullable = true)
    public Integer getResponsibleEmployeeKey() {
        return responsibleEmployeeKey;
    }

    public void setResponsibleEmployeeKey(Integer responsibleEmployeeKey) {
        this.responsibleEmployeeKey = responsibleEmployeeKey;
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
    @Column(name = "CloseDate", nullable = true)
    public Timestamp getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Timestamp closeDate) {
        this.closeDate = closeDate;
    }

    @Basic
    @Column(name = "Code", nullable = true, length = 30)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "IsMandatory", nullable = true)
    public Boolean getMandatory() {
        return isMandatory;
    }

    public void setMandatory(Boolean mandatory) {
        isMandatory = mandatory;
    }

    @Basic
    @Column(name = "isVoluntary", nullable = true)
    public Boolean getVoluntary() {
        return isVoluntary;
    }

    public void setVoluntary(Boolean voluntary) {
        isVoluntary = voluntary;
    }

    @Basic
    @Column(name = "EndDate", nullable = true)
    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    @Basic
    @Column(name = "createdReportFromAdmin", nullable = true)
    public Integer getCreatedReportFromAdmin() {
        return createdReportFromAdmin;
    }

    public void setCreatedReportFromAdmin(Integer createdReportFromAdmin) {
        this.createdReportFromAdmin = createdReportFromAdmin;
    }

    @Basic
    @Column(name = "StatusReport", nullable = true)
    public Integer getStatusReport() {
        return statusReport;
    }

    public void setStatusReport(Integer statusReport) {
        this.statusReport = statusReport;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Accident accident = (Accident) o;
        return accidentKey == accident.accidentKey &&
                levelRiskId == accident.levelRiskId &&
                accidentTypeKey == accident.accidentTypeKey &&
                employeeKey == accident.employeeKey &&
                isAnonymous == accident.isAnonymous &&
                Objects.equals(dateEvent, accident.dateEvent) &&
                Objects.equals(dateRegister, accident.dateRegister) &&
                Objects.equals(title, accident.title) &&
                Objects.equals(describeIssue, accident.describeIssue) &&
                Objects.equals(suggestion, accident.suggestion) &&
                Objects.equals(responsibleEmployeeKey, accident.responsibleEmployeeKey) &&
                Objects.equals(status, accident.status) &&
                Objects.equals(closeDate, accident.closeDate) &&
                Objects.equals(code, accident.code) &&
                Objects.equals(isMandatory, accident.isMandatory) &&
                Objects.equals(isVoluntary, accident.isVoluntary) &&
                Objects.equals(endDate, accident.endDate) &&
                Objects.equals(createdReportFromAdmin, accident.createdReportFromAdmin) &&
                Objects.equals(statusReport, accident.statusReport);
    }

    @Override
    public int hashCode() {

        return Objects.hash(accidentKey, dateEvent, dateRegister, title, describeIssue, suggestion, levelRiskId, accidentTypeKey, employeeKey, isAnonymous, responsibleEmployeeKey, status, closeDate, code, isMandatory, isVoluntary, endDate, createdReportFromAdmin, statusReport);
    }

    @ManyToOne
    @JoinColumn(name = "AccidentTypeKey", referencedColumnName = "AccidentTypeKey", nullable = false, insertable=false, updatable=false)
    public AccidentType getAccidentTypeByAccidentTypeKey() {
        return accidentTypeByAccidentTypeKey;
    }

    public void setAccidentTypeByAccidentTypeKey(AccidentType accidentTypeByAccidentTypeKey) {
        this.accidentTypeByAccidentTypeKey = accidentTypeByAccidentTypeKey;
    }

    @OneToMany(mappedBy = "accidentByAccidentKey")
    @JsonIgnore
    public Collection<AfectedEmployee> getAfectedEmployeesByAccidentKey() {
        return afectedEmployeesByAccidentKey;
    }

    public void setAfectedEmployeesByAccidentKey(Collection<AfectedEmployee> afectedEmployeesByAccidentKey) {
        this.afectedEmployeesByAccidentKey = afectedEmployeesByAccidentKey;
    }

    @OneToMany(mappedBy = "accidentByAccidentKey")
    @JsonIgnore
    public Collection<Attachment> getAttachmentsByAccidentKey() {
        return attachmentsByAccidentKey;
    }

    public void setAttachmentsByAccidentKey(Collection<Attachment> attachmentsByAccidentKey) {
        this.attachmentsByAccidentKey = attachmentsByAccidentKey;
    }

    @OneToMany(mappedBy = "accidentByAccidentKey")
    @JsonIgnore
    public Collection<FinalRiskLevel> getFinalRiskLevelsByAccidentKey() {
        return finalRiskLevelsByAccidentKey;
    }

    public void setFinalRiskLevelsByAccidentKey(Collection<FinalRiskLevel> finalRiskLevelsByAccidentKey) {
        this.finalRiskLevelsByAccidentKey = finalRiskLevelsByAccidentKey;
    }

    @OneToMany(mappedBy = "accidentByAccidentKey")
    @JsonIgnore
    public Collection<InitialRiskLevel> getInitialRiskLevelsByAccidentKey() {
        return initialRiskLevelsByAccidentKey;
    }

    public void setInitialRiskLevelsByAccidentKey(Collection<InitialRiskLevel> initialRiskLevelsByAccidentKey) {
        this.initialRiskLevelsByAccidentKey = initialRiskLevelsByAccidentKey;
    }

    @OneToMany(mappedBy = "accidentByAccidentKey")
    @JsonIgnore
    public Collection<Investigation> getInvestigationsByAccidentKey() {
        return investigationsByAccidentKey;
    }

    public void setInvestigationsByAccidentKey(Collection<Investigation> investigationsByAccidentKey) {
        this.investigationsByAccidentKey = investigationsByAccidentKey;
    }

    @OneToMany(mappedBy = "accidentByFormSmsId")
    @JsonIgnore
    public Collection<SuggestionProblem> getSuggestionProblemsByAccidentKey() {
        return suggestionProblemsByAccidentKey;
    }

    public void setSuggestionProblemsByAccidentKey(Collection<SuggestionProblem> suggestionProblemsByAccidentKey) {
        this.suggestionProblemsByAccidentKey = suggestionProblemsByAccidentKey;
    }
}
