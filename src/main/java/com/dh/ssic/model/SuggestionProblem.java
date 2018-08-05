package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "suggestionProblemId")

public class SuggestionProblem {
    private int suggestionProblemId;
    private int formSmsId;
    private String description;
    private Timestamp dateRegistre;
    private String status;
    private String usuario;
    private Accident accidentByFormSmsId;

    @Id
    @Column(name = "suggestionProblemId", nullable = false)
    public int getSuggestionProblemId() {
        return suggestionProblemId;
    }

    public void setSuggestionProblemId(int suggestionProblemId) {
        this.suggestionProblemId = suggestionProblemId;
    }

    @Basic
    @Column(name = "formSMSId", nullable = false)
    public int getFormSmsId() {
        return formSmsId;
    }

    public void setFormSmsId(int formSmsId) {
        this.formSmsId = formSmsId;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 1000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "DateRegistre", nullable = false)
    public Timestamp getDateRegistre() {
        return dateRegistre;
    }

    public void setDateRegistre(Timestamp dateRegistre) {
        this.dateRegistre = dateRegistre;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 100)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "usuario", nullable = true, length = 100)
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SuggestionProblem that = (SuggestionProblem) o;
        return suggestionProblemId == that.suggestionProblemId &&
                formSmsId == that.formSmsId &&
                Objects.equals(description, that.description) &&
                Objects.equals(dateRegistre, that.dateRegistre) &&
                Objects.equals(status, that.status) &&
                Objects.equals(usuario, that.usuario);
    }

    @Override
    public int hashCode() {

        return Objects.hash(suggestionProblemId, formSmsId, description, dateRegistre, status, usuario);
    }

    @ManyToOne
    @JoinColumn(name = "AccidentKey", referencedColumnName = "AccidentKey", nullable = false, insertable=false, updatable=false)
    public Accident getAccidentByFormSmsId() {
        return accidentByFormSmsId;
    }

    public void setAccidentByFormSmsId(Accident accidentByFormSmsId) {
        this.accidentByFormSmsId = accidentByFormSmsId;
    }
}
