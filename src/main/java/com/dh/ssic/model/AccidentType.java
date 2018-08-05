package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "accidentTypeKey")

public class AccidentType {
    private int accidentTypeKey;
    private Integer parentKey;
    private String name;
    private String description;
    private String state;
    private boolean haveSubType;
    private Collection<Accident> accidentsByAccidentTypeKey;

    @Id
    @Column(name = "AccidentTypeKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getAccidentTypeKey() {
        return accidentTypeKey;
    }

    public void setAccidentTypeKey(int accidentTypeKey) {
        this.accidentTypeKey = accidentTypeKey;
    }

    @Basic
    @Column(name = "ParentKey", nullable = true)
    public Integer getParentKey() {
        return parentKey;
    }

    public void setParentKey(Integer parentKey) {
        this.parentKey = parentKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 80)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 400)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "State", nullable = false, length = 15)
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Basic
    @Column(name = "HaveSubType", nullable = false)
    public boolean isHaveSubType() {
        return haveSubType;
    }

    public void setHaveSubType(boolean haveSubType) {
        this.haveSubType = haveSubType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccidentType that = (AccidentType) o;
        return accidentTypeKey == that.accidentTypeKey &&
                haveSubType == that.haveSubType &&
                Objects.equals(parentKey, that.parentKey) &&
                Objects.equals(name, that.name) &&
                Objects.equals(description, that.description) &&
                Objects.equals(state, that.state);
    }

    @Override
    public int hashCode() {

        return Objects.hash(accidentTypeKey, parentKey, name, description, state, haveSubType);
    }

    @OneToMany(mappedBy = "accidentTypeByAccidentTypeKey")
    @JsonIgnore
    public Collection<Accident> getAccidentsByAccidentTypeKey() {
        return accidentsByAccidentTypeKey;
    }

    public void setAccidentsByAccidentTypeKey(Collection<Accident> accidentsByAccidentTypeKey) {
        this.accidentsByAccidentTypeKey = accidentsByAccidentTypeKey;
    }
}
