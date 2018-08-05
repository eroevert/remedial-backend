package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "severityKey")

public class Severity {
    private int severityKey;
    private String name;
    private String personnel;
    private String enviroment;
    private int material;
    private String mission;
    private String code;
    private int indicatorBaseKey;
    private Collection<RiskValue> riskValuesBySeverityKey;

    @Id
    @Column(name = "SeverityKey", nullable = false)
    public int getSeverityKey() {
        return severityKey;
    }

    public void setSeverityKey(int severityKey) {
        this.severityKey = severityKey;
    }

    @Basic
    @Column(name = "Name", nullable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Personnel", nullable = false, length = 128)
    public String getPersonnel() {
        return personnel;
    }

    public void setPersonnel(String personnel) {
        this.personnel = personnel;
    }

    @Basic
    @Column(name = "Enviroment", nullable = false, length = 128)
    public String getEnviroment() {
        return enviroment;
    }

    public void setEnviroment(String enviroment) {
        this.enviroment = enviroment;
    }

    @Basic
    @Column(name = "Material", nullable = false)
    public int getMaterial() {
        return material;
    }

    public void setMaterial(int material) {
        this.material = material;
    }

    @Basic
    @Column(name = "Mission", nullable = false, length = 512)
    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    @Basic
    @Column(name = "Code", nullable = false, length = 1)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "indicatorBaseKey", nullable = false)
    public int getIndicatorBaseKey() {
        return indicatorBaseKey;
    }

    public void setIndicatorBaseKey(int indicatorBaseKey) {
        this.indicatorBaseKey = indicatorBaseKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Severity severity = (Severity) o;
        return severityKey == severity.severityKey &&
                material == severity.material &&
                indicatorBaseKey == severity.indicatorBaseKey &&
                Objects.equals(name, severity.name) &&
                Objects.equals(personnel, severity.personnel) &&
                Objects.equals(enviroment, severity.enviroment) &&
                Objects.equals(mission, severity.mission) &&
                Objects.equals(code, severity.code);
    }

    @Override
    public int hashCode() {

        return Objects.hash(severityKey, name, personnel, enviroment, material, mission, code, indicatorBaseKey);
    }

    @OneToMany(mappedBy = "severityBySeverityId")
    @JsonIgnore
    public Collection<RiskValue> getRiskValuesBySeverityKey() {
        return riskValuesBySeverityKey;
    }

    public void setRiskValuesBySeverityKey(Collection<RiskValue> riskValuesBySeverityKey) {
        this.riskValuesBySeverityKey = riskValuesBySeverityKey;
    }
}
