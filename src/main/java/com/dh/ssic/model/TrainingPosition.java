package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "trainingPositionKey")

public class TrainingPosition {
    private int trainingPositionKey;
    private int positionKey;
    private int trainingKey;
    private boolean optional;
    private Position positionByPositionKey;
    private Training trainingByTrainingKey;

    @Id
    @Column(name = "TrainingPositionKey", nullable = false)
    public int getTrainingPositionKey() {
        return trainingPositionKey;
    }

    public void setTrainingPositionKey(int trainingPositionKey) {
        this.trainingPositionKey = trainingPositionKey;
    }

    @Basic
    @Column(name = "PositionKey", nullable = false)
    public int getPositionKey() {
        return positionKey;
    }

    public void setPositionKey(int positionKey) {
        this.positionKey = positionKey;
    }

    @Basic
    @Column(name = "TrainingKey", nullable = false)
    public int getTrainingKey() {
        return trainingKey;
    }

    public void setTrainingKey(int trainingKey) {
        this.trainingKey = trainingKey;
    }

    @Basic
    @Column(name = "Optional", nullable = false)
    public boolean isOptional() {
        return optional;
    }

    public void setOptional(boolean optional) {
        this.optional = optional;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TrainingPosition that = (TrainingPosition) o;
        return trainingPositionKey == that.trainingPositionKey &&
                positionKey == that.positionKey &&
                trainingKey == that.trainingKey &&
                optional == that.optional;
    }

    @Override
    public int hashCode() {

        return Objects.hash(trainingPositionKey, positionKey, trainingKey, optional);
    }

    @ManyToOne
    @JoinColumn(name = "PositionKey", referencedColumnName = "PositionKey", nullable = false, insertable=false, updatable=false)
    public Position getPositionByPositionKey() {
        return positionByPositionKey;
    }

    public void setPositionByPositionKey(Position positionByPositionKey) {
        this.positionByPositionKey = positionByPositionKey;
    }

    @ManyToOne
    @JoinColumn(name = "TrainingKey", referencedColumnName = "TrainingKey", nullable = false, insertable=false, updatable=false)
    public Training getTrainingByTrainingKey() {
        return trainingByTrainingKey;
    }

    public void setTrainingByTrainingKey(Training trainingByTrainingKey) {
        this.trainingByTrainingKey = trainingByTrainingKey;
    }
}
