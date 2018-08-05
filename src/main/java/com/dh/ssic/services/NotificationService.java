package com.dh.ssic.services;

import com.dh.ssic.model.Notification;

import java.util.List;

public interface NotificationService extends GenericService<Notification>{

    List<Notification> getNotificationVisiblesByEmployee(Integer id);
}
