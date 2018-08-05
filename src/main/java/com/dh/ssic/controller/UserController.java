/*yussen*/
package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/users")//colocar el path para acceder a la clase
//@Produces("application/json")
@Produces(MediaType.APPLICATION_JSON)
public class UserController {
    private UserService service;
    @Autowired
    ApplicationContext appContext;
    public UserController(UserService service) {
        this.service = service;
    }

    @GET
    public Response getUsers() {
        List<User> list = new ArrayList<>();
        ReturnModel<List<User>> result = service.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getUserById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<User> result = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }
    @POST
    @Path("/Login")
    public Response Login(User c) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<User> result = service.login(c,entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @POST
    public Response saveUser(User c) {
        System.out.println(c.getUserKey());//colocar el metodo get que recupera la llave de la clase
        ReturnModel<User> cPersisted = service.save(c);
        Response.ResponseBuilder responseBuilder = Response.ok(cPersisted);
        return responseBuilder.build();
    }

    // c es la variable de tipo que nos pasan y sobre la cual se hacen las acciones
    @PUT
    public Response updateRol(User c) {
        ReturnModel<User> cPersisted = service.save(c);
        Response.ResponseBuilder responseBuilder = Response.ok(cPersisted);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteRol(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = service.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }

}