package com.dh.ssic.services;

import com.dh.ssic.model.Notification;
import com.dh.ssic.model.Politics;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repository.NotificationRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationServiceImpl extends GenericServiceImplementation<Notification> implements NotificationService {

    private NotificationRepository notificationRepository;
    private PoliticsService politicsService;

    public NotificationServiceImpl(NotificationRepository notificationRepository, PoliticsService politicsService) {
        this.notificationRepository = notificationRepository;
        this.politicsService = politicsService;
    }

    @Override
    protected CrudRepository<Notification, Integer> getRepository() {
        return notificationRepository;
    }

    @Override
    public List<Notification> getNotificationVisiblesByEmployee(Integer employeeKey) {
        return notificationRepository.findByEmployeeIdAndAndVisible(employeeKey, Boolean.TRUE);
    }
}
