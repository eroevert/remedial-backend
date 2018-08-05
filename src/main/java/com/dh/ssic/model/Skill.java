package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "skillKey")

public class Skill {
    private int skillKey;
    private String description;
    private Collection<SkillsPosition> skillsPositionsBySkillKey;

    @Id
    @Column(name = "SkillKey", nullable = false)
    public int getSkillKey() {
        return skillKey;
    }

    public void setSkillKey(int skillKey) {
        this.skillKey = skillKey;
    }

    @Basic
    @Column(name = "Description", nullable = true, length = 500)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Skill skill = (Skill) o;
        return skillKey == skill.skillKey &&
                Objects.equals(description, skill.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(skillKey, description);
    }

    @OneToMany(mappedBy = "skillBySkillKey")
    @JsonIgnore
    public Collection<SkillsPosition> getSkillsPositionsBySkillKey() {
        return skillsPositionsBySkillKey;
    }

    public void setSkillsPositionsBySkillKey(Collection<SkillsPosition> skillsPositionsBySkillKey) {
        this.skillsPositionsBySkillKey = skillsPositionsBySkillKey;
    }
}
