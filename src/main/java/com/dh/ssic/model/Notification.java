package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "notificationKey")
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "notificationKey")
    private Integer notificationKey;

    @Basic
    @Column(name = "PoliticsName")
    private String politicsName;

    @ManyToOne
    @JoinColumn(name = "PoliticsKey")
    private Politics politics;

    @Basic
    @Column(name = "employee_id")
    private Integer employeeId;

    @Basic
    @Column(name = "NotificationVisible")
    private Boolean visible;

    public Integer getNotificationKey() {
        return notificationKey;
    }

    public void setNotificationKey(Integer notificationKey) {
        this.notificationKey = notificationKey;
    }

    public String getPoliticsName() {
        return politicsName;
    }

    public void setPoliticsName(String politicsName) {
        this.politicsName = politicsName;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public Politics getPolitics() {
        return politics;
    }

    public void setPolitics(Politics politics) {
        this.politics = politics;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }
}
