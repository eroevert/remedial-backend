package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "typeContactKey")

public class TypeContact {
    private int typeContactKey;
    private String name;
    private Collection<ContactInformation> contactInformationsByTypeContactKey;

    @Id
    @Column(name = "TypeContactKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTypeContactKey() {
        return typeContactKey;
    }

    public void setTypeContactKey(int typeContactKey) {
        this.typeContactKey = typeContactKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TypeContact that = (TypeContact) o;
        return typeContactKey == that.typeContactKey &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(typeContactKey, name);
    }

    @OneToMany(mappedBy = "typeContactByTypeContactKey")
    @JsonIgnore
    public Collection<ContactInformation> getContactInformationsByTypeContactKey() {
        return contactInformationsByTypeContactKey;
    }

    public void setContactInformationsByTypeContactKey(Collection<ContactInformation> contactInformationsByTypeContactKey) {
        this.contactInformationsByTypeContactKey = contactInformationsByTypeContactKey;
    }
}
