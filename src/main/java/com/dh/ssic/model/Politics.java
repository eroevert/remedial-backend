package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.List;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "politicsKey")
public class Politics {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PoliticsKey")
    private Integer politicsKey;

    @Basic
    @Column(name = "PoliticsName")
    private String politicsName;

    @Basic
    @Column(name = "PoliticsDesc")
    private String politicsDesc;

    @OneToMany(mappedBy = "politics", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Notification> notifications;

    public Integer getPoliticsKey() {
        return politicsKey;
    }

    public void setPoliticsKey(Integer politicsKey) {
        this.politicsKey = politicsKey;
    }

    public String getPoliticsName() {
        return politicsName;
    }

    public void setPoliticsName(String politicsName) {
        this.politicsName = politicsName;
    }

    public String getPoliticsDesc() {
        return politicsDesc;
    }

    public void setPoliticsDesc(String politicsDesc) {
        this.politicsDesc = politicsDesc;
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }
}


