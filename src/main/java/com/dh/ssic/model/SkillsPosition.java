package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "skillPositionKey")

public class SkillsPosition {
    private int skillPositionKey;
    private Integer positionKey;
    private int skillKey;
    private String level;
    private Position positionByPositionKey;
    private Skill skillBySkillKey;

    @Id
    @Column(name = "SkillPositionKey", nullable = false)
    public int getSkillPositionKey() {
        return skillPositionKey;
    }

    public void setSkillPositionKey(int skillPositionKey) {
        this.skillPositionKey = skillPositionKey;
    }

    @Basic
    @Column(name = "PositionKey", nullable = false)
    public Integer getPositionKey() {
        return positionKey;
    }

    public void setPositionKey(Integer positionKey) {
        this.positionKey = positionKey;
    }

    @Basic
    @Column(name = "SkillKey", nullable = false)
    public int getSkillKey() {
        return skillKey;
    }

    public void setSkillKey(int skillKey) {
        this.skillKey = skillKey;
    }

    @Basic
    @Column(name = "Level", nullable = false, length = 50)
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SkillsPosition that = (SkillsPosition) o;
        return skillPositionKey == that.skillPositionKey &&
                skillKey == that.skillKey &&
                Objects.equals(positionKey, that.positionKey) &&
                Objects.equals(level, that.level);
    }

    @Override
    public int hashCode() {

        return Objects.hash(skillPositionKey, positionKey, skillKey, level);
    }

    @ManyToOne
    @JoinColumn(name = "PositionKey", referencedColumnName = "PositionKey", insertable=false, updatable=false)
    public Position getPositionByPositionKey() {
        return positionByPositionKey;
    }

    public void setPositionByPositionKey(Position positionByPositionKey) {
        this.positionByPositionKey = positionByPositionKey;
    }

    @ManyToOne
    @JoinColumn(name = "SkillKey", referencedColumnName = "SkillKey", nullable = false, insertable=false, updatable=false)
    public Skill getSkillBySkillKey() {
        return skillBySkillKey;
    }

    public void setSkillBySkillKey(Skill skillBySkillKey) {
        this.skillBySkillKey = skillBySkillKey;
    }
}
