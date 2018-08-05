package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "documentTypeKey")

public class DocumentType {

    private int documentTypeKey;
    private String name;
    private String status;
    private String repeat;
    private Collection<PersonalDocument> personalDocumentsByDocumentTypeKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DocumentTypeKey", nullable = false)
    public int getDocumentTypeKey() {
        return documentTypeKey;
    }

    public void setDocumentTypeKey(int documentTypeKey) {
        this.documentTypeKey = documentTypeKey;
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
    @Column(name = "Status", nullable = false, length = 1)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "Repeat", nullable = true, length = 2)
    public String getRepeat() {
        return repeat;
    }

    public void setRepeat(String repeat) {
        this.repeat = repeat;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DocumentType that = (DocumentType) o;
        return documentTypeKey == that.documentTypeKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(status, that.status) &&
                Objects.equals(repeat, that.repeat);
    }

    @Override
    public int hashCode() {

        return Objects.hash(documentTypeKey, name, status, repeat);
    }

    @OneToMany(mappedBy = "documentTypeByDocumentKey")
    @JsonIgnore
    public Collection<PersonalDocument> getPersonalDocumentsByDocumentTypeKey() {
        return personalDocumentsByDocumentTypeKey;
    }

    public void setPersonalDocumentsByDocumentTypeKey(Collection<PersonalDocument> personalDocumentsByDocumentTypeKey) {
        this.personalDocumentsByDocumentTypeKey = personalDocumentsByDocumentTypeKey;
    }
}
