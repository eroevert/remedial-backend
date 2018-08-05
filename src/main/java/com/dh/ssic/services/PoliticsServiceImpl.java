package com.dh.ssic.services;

import com.dh.ssic.command.PoliticNotifications;
import com.dh.ssic.model.Employee;
import com.dh.ssic.model.Notification;
import com.dh.ssic.model.Politics;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EmployeeRepository;
import com.dh.ssic.repository.NotificationRepository;
import com.dh.ssic.repository.PoliticsRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PoliticsServiceImpl extends GenericServiceImplementation<Politics> implements PoliticsService {

    private PoliticsRepository politicsRepository;
    private NotificationRepository notificationRepository;
    private EmployeeRepository employeeRepository;

    public PoliticsServiceImpl(PoliticsRepository politicsRepository, NotificationRepository notificationRepository, EmployeeRepository employeeRepository) {
        this.politicsRepository = politicsRepository;
        this.notificationRepository = notificationRepository;
        this.employeeRepository = employeeRepository;
    }

    @Override
    protected CrudRepository<Politics, Integer> getRepository() {
        return politicsRepository;
    }

    @Override
    public ReturnModel<Politics> createPolitic(PoliticNotifications politicNotifications) {
        ReturnModel<Politics> returnModel = save(politicNotifications.getPolitic());
        createNotifications(returnModel.getObject(), politicNotifications.getOrganizations(), politicNotifications.getCreateById());
        return returnModel;
    }

    @Override
    public void createNotifications(Politics politics, List<Integer> organizations, Integer createById) {
        List<Employee> employees = employeeRepository.findByOrganizationKeyIn(organizations);
        for (Employee employee: employees) {
            if (employee.getEmployeeKey() != createById)
                createNotifications(politics, employee.getEmployeeKey());
        }
        createNotifications(politics, createById);
    }

    private void createNotifications(Politics politics, Integer employeeKey) {
        Notification notification = new Notification();
        notification.setPolitics(politics);
        notification.setPoliticsName(politics.getPoliticsName());
        notification.setVisible(Boolean.TRUE);
        notification.setEmployeeId(employeeKey);
        notificationRepository.save(notification);
    }
}
