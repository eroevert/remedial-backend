package com.dh.ssic.controller;

import com.dh.ssic.model.Notification;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.NotificationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/notifications")
@Controller
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class NotificationController {

    private NotificationService notificationService;

    public NotificationController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }
    @GET
    public Response getPolitics() {
        ReturnModel<List<Notification>> result = notificationService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getNotificationById(@PathParam("id") @NotNull int id) {
        ReturnModel<Notification> profession = notificationService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(profession);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/visible/{employeKey}")
    public Response getNotifications(@PathParam("employeKey") @NotNull int employeKey) {
        ReturnModel<List<Notification>> returnModel = new ReturnModel<List<Notification>>();
        List<Notification> notifications = notificationService.getNotificationVisiblesByEmployee(employeKey);
        returnModel.setObject(notifications);
        Response.ResponseBuilder responseBuilder = Response.ok(returnModel);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updatePosition(Notification notification) {
        ReturnModel<Notification> positionPersisted = notificationService.save(notification);
        Response.ResponseBuilder responseBuilder = Response.ok(positionPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    }
}
