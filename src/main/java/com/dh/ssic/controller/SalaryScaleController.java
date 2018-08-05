package com.dh.ssic.controller;

import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.SalaryScaleService;
import com.dh.ssic.services.SalaryScaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/salaryscale")
@Produces("application/json")
public class SalaryScaleController {
    private SalaryScaleService salaryScaleService;
    @Autowired
    ApplicationContext appContext;
    public SalaryScaleController(SalaryScaleService salaryScaleService) {
        this.salaryScaleService = salaryScaleService;
    }

    @GET
    public Response getSalaryScales() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<SalaryScale>> result = salaryScaleService.GetSalaryScales(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getSalaryScalesById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<SalaryScale> salaryScale = salaryScaleService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(salaryScale);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveSalaryScale(SalaryScale salaryScale) {
        ReturnModel<SalaryScale> salaryScalePersisted = salaryScaleService.save(salaryScale);
        Response.ResponseBuilder responseBuilder = Response.ok(salaryScalePersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateSalaryScale(SalaryScale salaryScale) {
        ReturnModel<SalaryScale> salaryScalePersisted = salaryScaleService.save(salaryScale);
        Response.ResponseBuilder responseBuilder = Response.ok(salaryScalePersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteSalaryScale(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = salaryScaleService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
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
