/*yussen*/
package com.dh.ssic.controller;

import com.dh.ssic.model.AcademicInformation;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.AcademicInformationService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/academicinfos")//colocar el path para acceder a la clase
//@Produces("application/json")
@Produces(MediaType.APPLICATION_JSON)
public class AcademicInformationController {
    private AcademicInformationService service;

    public AcademicInformationController(AcademicInformationService service) {
        this.service = service;
    }

    @GET
    public Response getAcademicInformations() {
        List<AcademicInformation> list = new ArrayList<>();
        ReturnModel<List<AcademicInformation>> result = service.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getAcademicInformationById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<AcademicInformation> result = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveAcademicInformation(AcademicInformation c) {
        System.out.println(c.getAcademicInformationKey());//colocar el metodo get que recupera la llave de la clase
        ReturnModel<AcademicInformation> cPersisted = service.save(c);
        Response.ResponseBuilder responseBuilder = Response.ok(cPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    // c es la variable de tipo que nos pasan y sobre la cual se hacen las acciones
    @PUT
    public Response updateRol(AcademicInformation c) {
        ReturnModel<AcademicInformation> cPersisted = service.save(c);
        Response.ResponseBuilder responseBuilder = Response.ok(cPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteRol(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = service.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        addCorsHeader(responseBuilder);
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