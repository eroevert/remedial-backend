package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "trainingKey")

public class Training {
    private int trainingKey;
    private String description;
    private Collection<TrainingPosition> trainingPositionsByTrainingKey;

    @Id
    @Column(name = "TrainingKey", nullable = false)
    public int getTrainingKey() {
        return trainingKey;
    }

    public void setTrainingKey(int trainingKey) {
        this.trainingKey = trainingKey;
    }

    @Basic
    @Column(name = "Description", nullable = true, length = 300)
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
        Training training = (Training) o;
        return trainingKey == training.trainingKey &&
                Objects.equals(description, training.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(trainingKey, description);
    }

    @OneToMany(mappedBy = "trainingByTrainingKey")
    @JsonIgnore
    public Collection<TrainingPosition> getTrainingPositionsByTrainingKey() {
        return trainingPositionsByTrainingKey;
    }

    public void setTrainingPositionsByTrainingKey(Collection<TrainingPosition> trainingPositionsByTrainingKey) {
        this.trainingPositionsByTrainingKey = trainingPositionsByTrainingKey;
    }
}
