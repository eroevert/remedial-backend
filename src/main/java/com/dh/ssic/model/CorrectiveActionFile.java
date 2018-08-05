package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "correctiveActionFileKey")

public class CorrectiveActionFile {
    private int correctiveActionFileKey;
    private String nameFile;
    private int correctiveActionKey;
    private Integer employeKey;
    private CorrectiveActions correctiveActionsByCorrectiveActionKey;

    @Id
    @Column(name = "CorrectiveActionFileKey", nullable = false)
    public int getCorrectiveActionFileKey() {
        return correctiveActionFileKey;
    }

    public void setCorrectiveActionFileKey(int correctiveActionFileKey) {
        this.correctiveActionFileKey = correctiveActionFileKey;
    }

    @Basic
    @Column(name = "NameFile", nullable = false, length = 200)
    public String getNameFile() {
        return nameFile;
    }

    public void setNameFile(String nameFile) {
        this.nameFile = nameFile;
    }

    @Basic
    @Column(name = "CorrectiveActionKey", nullable = false)
    public int getCorrectiveActionKey() {
        return correctiveActionKey;
    }

    public void setCorrectiveActionKey(int correctiveActionKey) {
        this.correctiveActionKey = correctiveActionKey;
    }

    @Basic
    @Column(name = "EmployeKey", nullable = true)
    public Integer getEmployeKey() {
        return employeKey;
    }

    public void setEmployeKey(Integer employeKey) {
        this.employeKey = employeKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CorrectiveActionFile that = (CorrectiveActionFile) o;
        return correctiveActionFileKey == that.correctiveActionFileKey &&
                correctiveActionKey == that.correctiveActionKey &&
                Objects.equals(nameFile, that.nameFile) &&
                Objects.equals(employeKey, that.employeKey);
    }

    @Override
    public int hashCode() {

        return Objects.hash(correctiveActionFileKey, nameFile, correctiveActionKey, employeKey);
    }

    @ManyToOne
    @JoinColumn(name = "CorrectiveActionKey", referencedColumnName = "CorrectiveActionKey", nullable = false, insertable=false, updatable=false)
    public CorrectiveActions getCorrectiveActionsByCorrectiveActionKey() {
        return correctiveActionsByCorrectiveActionKey;
    }

    public void setCorrectiveActionsByCorrectiveActionKey(CorrectiveActions correctiveActionsByCorrectiveActionKey) {
        this.correctiveActionsByCorrectiveActionKey = correctiveActionsByCorrectiveActionKey;
    }
}
