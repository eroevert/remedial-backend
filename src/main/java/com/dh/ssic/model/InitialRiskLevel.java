package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "initialRiskLevelKey")

public class InitialRiskLevel {
    private int initialRiskLevelKey;
    private int riskValueKey;
    private int accidentKey;
    private String state;
    private Timestamp dateRegister;
    private RiskValue riskValueByRiskValueKey;
    private Accident accidentByAccidentKey;

    @Id
    @Column(name = "InitialRiskLevelKey", nullable = false)
    public int getInitialRiskLevelKey() {
        return initialRiskLevelKey;
    }

    public void setInitialRiskLevelKey(int initialRiskLevelKey) {
        this.initialRiskLevelKey = initialRiskLevelKey;
    }

    @Basic
    @Column(name = "RiskValueKey", nullable = false)
    public int getRiskValueKey() {
        return riskValueKey;
    }

    public void setRiskValueKey(int riskValueKey) {
        this.riskValueKey = riskValueKey;
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
    @Column(name = "State", nullable = false, length = 50)
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Basic
    @Column(name = "DateRegister", nullable = false)
    public Timestamp getDateRegister() {
        return dateRegister;
    }

    public void setDateRegister(Timestamp dateRegister) {
        this.dateRegister = dateRegister;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InitialRiskLevel that = (InitialRiskLevel) o;
        return initialRiskLevelKey == that.initialRiskLevelKey &&
                riskValueKey == that.riskValueKey &&
                accidentKey == that.accidentKey &&
                Objects.equals(state, that.state) &&
                Objects.equals(dateRegister, that.dateRegister);
    }

    @Override
    public int hashCode() {

        return Objects.hash(initialRiskLevelKey, riskValueKey, accidentKey, state, dateRegister);
    }

    @ManyToOne
    @JoinColumn(name = "RiskValueKey", referencedColumnName = "RiskValueKey", nullable = false, insertable=false, updatable=false)
    public RiskValue getRiskValueByRiskValueKey() {
        return riskValueByRiskValueKey;
    }

    public void setRiskValueByRiskValueKey(RiskValue riskValueByRiskValueKey) {
        this.riskValueByRiskValueKey = riskValueByRiskValueKey;
    }

    @ManyToOne
    @JoinColumn(name = "AccidentKey", referencedColumnName = "AccidentKey", nullable = false, insertable=false, updatable=false)
    public Accident getAccidentByAccidentKey() {
        return accidentByAccidentKey;
    }

    public void setAccidentByAccidentKey(Accident accidentByAccidentKey) {
        this.accidentByAccidentKey = accidentByAccidentKey;
    }
}
