package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "rolKey")

public class Rol {
    private int rolKey;
    private String name;
    private String description;
    private Collection<User> usersByRolKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "RolKey", nullable = false)
    public int getRolKey() {
        return rolKey;
    }

    public void setRolKey(int rolKey) {
        this.rolKey = rolKey;
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
    @Column(name = "Description", nullable = false, length = 150)
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
        Rol rol = (Rol) o;
        return rolKey == rol.rolKey &&
                Objects.equals(name, rol.name) &&
                Objects.equals(description, rol.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(rolKey, name, description);
    }

    @OneToMany(mappedBy = "rolByRolKey")
    @JsonIgnore
    public Collection<User> getUsersByRolKey() {
        return usersByRolKey;
    }

    public void setUsersByRolKey(Collection<User> usersByRolKey) {
        this.usersByRolKey = usersByRolKey;
    }
}
