package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "cityKey")

public class City {
    private String code;
    private String name;
    private int countryKey;
    private int cityKey;
    private Collection<AcademicInformation> academicInformationsByCityKey;
    private Country countryByCountryKey;
    private Collection<WorkExperience> workExperiencesByCityKey;

    @Basic
    @Column(name = "Code", nullable = false, length = 3)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "Name", nullable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "CountryKey", nullable = false)
    public int getCountryKey() {
        return countryKey;
    }

    public void setCountryKey(int countryKey) {
        this.countryKey = countryKey;
    }

    @Id
    @Column(name = "CityKey", nullable = false)
    public int getCityKey() {
        return cityKey;
    }

    public void setCityKey(int cityKey) {
        this.cityKey = cityKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        City city = (City) o;
        return countryKey == city.countryKey &&
                cityKey == city.cityKey &&
                Objects.equals(code, city.code) &&
                Objects.equals(name, city.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(code, name, countryKey, cityKey);
    }

    @OneToMany(mappedBy = "cityByCityKey")
    @JsonIgnore
    public Collection<AcademicInformation> getAcademicInformationsByCityKey() {
        return academicInformationsByCityKey;
    }

    public void setAcademicInformationsByCityKey(Collection<AcademicInformation> academicInformationsByCityKey) {
        this.academicInformationsByCityKey = academicInformationsByCityKey;
    }

    @ManyToOne
    @JoinColumn(name = "CountryKey", referencedColumnName = "CountryKey", nullable = false, insertable=false, updatable=false)
    public Country getCountryByCountryKey() {
        return countryByCountryKey;
    }

    public void setCountryByCountryKey(Country countryByCountryKey) {
        this.countryByCountryKey = countryByCountryKey;
    }

    @OneToMany(mappedBy = "cityByCityKey")
    @JsonIgnore
    public Collection<WorkExperience> getWorkExperiencesByCityKey() {
        return workExperiencesByCityKey;
    }

    public void setWorkExperiencesByCityKey(Collection<WorkExperience> workExperiencesByCityKey) {
        this.workExperiencesByCityKey = workExperiencesByCityKey;
    }
}
