package com.dh.ssic.repository;


import com.dh.ssic.model.Notification;
import com.dh.ssic.model.Politics;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface NotificationRepository extends CrudRepository<Notification, Integer> {

    @Query("select n from Notification n where n.politics = :politics  and n.visible = :visible")
    List<Notification> getNotificationsVisible(@Param("politics") Politics politics, @Param("visible")   Boolean visible);

    List<Notification> findByEmployeeIdAndAndVisible(Integer employeeKey, Boolean visible);
}
