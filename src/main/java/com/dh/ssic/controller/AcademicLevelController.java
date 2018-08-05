package com.dh.ssic.controller;

import com.dh.ssic.model.AcademicLevel;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.AcademicLevelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/academicLevel")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class AcademicLevelController {
    private AcademicLevelService academicLevelService;

    public AcademicLevelController(AcademicLevelService academicLevelService) {
        this.academicLevelService = academicLevelService;
    }

    @GET
    public Response getAcademicLevels() {
        ReturnModel<List<AcademicLevel>> result = academicLevelService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result.getObject());
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getAcademicLevelById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<AcademicLevel> academicLevel = academicLevelService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(academicLevel);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }
    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response saveAcademicLevel(AcademicLevel academicLevel) {
        System.out.println(academicLevel.hashCode());
        ReturnModel<AcademicLevel> saveResult = academicLevelService.save(academicLevel);
        Response.ResponseBuilder responseBuilder = Response.ok(saveResult);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateAcademicLevel(AcademicLevel academicLevel) {
        System.out.println(academicLevel.hashCode());
        System.out.println(academicLevel.getDescription());
        ReturnModel<AcademicLevel> updateResult = academicLevelService.save(academicLevel);
        Response.ResponseBuilder responseBuilder = Response.ok(updateResult);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteAcademicLevel(@PathParam("id") Integer id) {
        ReturnModel<String> deleteResult = academicLevelService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

//    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
//        responseBuilder.header("Access-Control-Allow-Origin", "*")
//                .header("Access-Control-Allow-Credentials", "false")
//                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
//                .header("Access-Control-Allow-Headers",
//                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
//    }
}
