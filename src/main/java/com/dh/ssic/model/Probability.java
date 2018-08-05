package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "probabilityKey")

public class Probability {
    private int probabilityKey;
    private String name;
    private int indiceP;
    private int indicatorBaseKey;
    private Collection<RiskValue> riskValuesByProbabilityKey;

    @Id
    @Column(name = "ProbabilityKey", nullable = false)
    public int getProbabilityKey() {
        return probabilityKey;
    }

    public void setProbabilityKey(int probabilityKey) {
        this.probabilityKey = probabilityKey;
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
    @Column(name = "IndiceP", nullable = false)
    public int getIndiceP() {
        return indiceP;
    }

    public void setIndiceP(int indiceP) {
        this.indiceP = indiceP;
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
        Probability that = (Probability) o;
        return probabilityKey == that.probabilityKey &&
                indiceP == that.indiceP &&
                indicatorBaseKey == that.indicatorBaseKey &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(probabilityKey, name, indiceP, indicatorBaseKey);
    }

    @OneToMany(mappedBy = "probabilityByProbabilityId")
    @JsonIgnore
    public Collection<RiskValue> getRiskValuesByProbabilityKey() {
        return riskValuesByProbabilityKey;
    }

    public void setRiskValuesByProbabilityKey(Collection<RiskValue> riskValuesByProbabilityKey) {
        this.riskValuesByProbabilityKey = riskValuesByProbabilityKey;
    }
}
