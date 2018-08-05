package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Controller
@Path("/login")
@Produces(MediaType.APPLICATION_JSON)
public class LoginController {
    private UserService service;
    @Autowired
    ApplicationContext appContext;
    public LoginController(UserService service) {
        this.service = service;
    }

    @POST
    public Response Login(User c) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<User> cLoged = service.login(c,entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(cLoged);
        return responseBuilder.build();
    }
}