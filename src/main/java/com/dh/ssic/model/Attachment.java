package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "attachmentKey")

public class Attachment {
    private int attachmentKey;
    private String nameFile;
    private int accidentKey;
    private Integer employeeKey;
    private Accident accidentByAccidentKey;

    @Id
    @Column(name = "AttachmentKey", nullable = false)
    public int getAttachmentKey() {
        return attachmentKey;
    }

    public void setAttachmentKey(int attachmentKey) {
        this.attachmentKey = attachmentKey;
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
    @Column(name = "AccidentKey", nullable = false)
    public int getAccidentKey() {
        return accidentKey;
    }

    public void setAccidentKey(int accidentKey) {
        this.accidentKey = accidentKey;
    }

    @Basic
    @Column(name = "EmployeeKey", nullable = true)
    public Integer getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(Integer employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Attachment that = (Attachment) o;
        return attachmentKey == that.attachmentKey &&
                accidentKey == that.accidentKey &&
                Objects.equals(nameFile, that.nameFile) &&
                Objects.equals(employeeKey, that.employeeKey);
    }

    @Override
    public int hashCode() {

        return Objects.hash(attachmentKey, nameFile, accidentKey, employeeKey);
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
