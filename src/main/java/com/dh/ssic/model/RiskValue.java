package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "riskValueKey")

public class RiskValue {
    private int riskValueKey;
    private int probabilityId;
    private int severityId;
    private Timestamp daysToResolve;
    private String color;
    private Collection<FinalRiskLevel> finalRiskLevelsByRiskValueKey;
    private Collection<InitialRiskLevel> initialRiskLevelsByRiskValueKey;
    private Probability probabilityByProbabilityId;
    private Severity severityBySeverityId;

    @Id
    @Column(name = "RiskValueKey", nullable = false)
    public int getRiskValueKey() {
        return riskValueKey;
    }

    public void setRiskValueKey(int riskValueKey) {
        this.riskValueKey = riskValueKey;
    }

    @Basic
    @Column(name = "probabilityId", nullable = false)
    public int getProbabilityId() {
        return probabilityId;
    }

    public void setProbabilityId(int probabilityId) {
        this.probabilityId = probabilityId;
    }

    @Basic
    @Column(name = "severityId", nullable = false)
    public int getSeverityId() {
        return severityId;
    }

    public void setSeverityId(int severityId) {
        this.severityId = severityId;
    }

    @Basic
    @Column(name = "daysToResolve", nullable = true)
    public Timestamp getDaysToResolve() {
        return daysToResolve;
    }

    public void setDaysToResolve(Timestamp daysToResolve) {
        this.daysToResolve = daysToResolve;
    }

    @Basic
    @Column(name = "color", nullable = false, length = 20)
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RiskValue riskValue = (RiskValue) o;
        return riskValueKey == riskValue.riskValueKey &&
                probabilityId == riskValue.probabilityId &&
                severityId == riskValue.severityId &&
                Objects.equals(daysToResolve, riskValue.daysToResolve) &&
                Objects.equals(color, riskValue.color);
    }

    @Override
    public int hashCode() {

        return Objects.hash(riskValueKey, probabilityId, severityId, daysToResolve, color);
    }

    @OneToMany(mappedBy = "riskValueByRiskValueKey")
    @JsonIgnore
    public Collection<FinalRiskLevel> getFinalRiskLevelsByRiskValueKey() {
        return finalRiskLevelsByRiskValueKey;
    }

    public void setFinalRiskLevelsByRiskValueKey(Collection<FinalRiskLevel> finalRiskLevelsByRiskValueKey) {
        this.finalRiskLevelsByRiskValueKey = finalRiskLevelsByRiskValueKey;
    }

    @OneToMany(mappedBy = "riskValueByRiskValueKey")
    @JsonIgnore
    public Collection<InitialRiskLevel> getInitialRiskLevelsByRiskValueKey() {
        return initialRiskLevelsByRiskValueKey;
    }

    public void setInitialRiskLevelsByRiskValueKey(Collection<InitialRiskLevel> initialRiskLevelsByRiskValueKey) {
        this.initialRiskLevelsByRiskValueKey = initialRiskLevelsByRiskValueKey;
    }

    @ManyToOne
    @JoinColumn(name = "ProbabilityKey", referencedColumnName = "ProbabilityKey", nullable = false, insertable=false, updatable=false)
    public Probability getProbabilityByProbabilityId() {
        return probabilityByProbabilityId;
    }

    public void setProbabilityByProbabilityId(Probability probabilityByProbabilityId) {
        this.probabilityByProbabilityId = probabilityByProbabilityId;
    }

    @ManyToOne
    @JoinColumn(name = "SeverityKey", referencedColumnName = "SeverityKey", nullable = false, insertable=false, updatable=false)
    public Severity getSeverityBySeverityId() {
        return severityBySeverityId;
    }

    public void setSeverityBySeverityId(Severity severityBySeverityId) {
        this.severityBySeverityId = severityBySeverityId;
    }
}
