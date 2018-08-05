package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "typeContractKey")
public class TypeContract {
    private int typeContractKey;
    private String name;
    private String code;
    private String status;
    @JsonIgnore
    private Collection<Item> itemsByTypeContractKey;

    @Id
    @Column(name = "TypeContractKey", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTypeContractKey() {
        return typeContractKey;
    }

    public void setTypeContractKey(int typeContractKey) {
        this.typeContractKey = typeContractKey;
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
    @Column(name = "Code", nullable = false, length = 5)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 1)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TypeContract that = (TypeContract) o;
        return typeContractKey == that.typeContractKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(code, that.code) &&
                Objects.equals(status, that.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(typeContractKey, name, code, status);
    }

    @OneToMany(mappedBy = "typeContractByTypeContractKey")
    public Collection<Item> getItemsByTypeContractKey() {
        return itemsByTypeContractKey;
    }

    public void setItemsByTypeContractKey(Collection<Item> itemsByTypeContractKey) {
        this.itemsByTypeContractKey = itemsByTypeContractKey;
    }
}
