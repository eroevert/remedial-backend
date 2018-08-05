package com.dh.ssic.controller;

import com.dh.ssic.model.EquipmentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.EquipmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;


import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/equipmentType")
//@Produces("application/json")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class EquipmentTypeController {
    private EquipmentTypeService equipmentTypeService;
    @Autowired
    ApplicationContext appContext;
    public EquipmentTypeController(EquipmentTypeService equipmentTypeService) {this.equipmentTypeService = equipmentTypeService;
    }

    @GET
    public Response getEquipmentTypes() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<EquipmentType>> result = equipmentTypeService.GetAll(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getEquipmentTypesById(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<EquipmentType> equipmentType = equipmentTypeService.FindEquipmentTypeById(id,entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(equipmentType);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveEquipmentType(EquipmentType equipmentType) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> equipmentTypePersisted = equipmentTypeService.SaveEquipmentType(equipmentType, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(equipmentTypePersisted);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateEquipmentType(EquipmentType equipmentType) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<EquipmentType> equipmentTypePersisted = equipmentTypeService.save(equipmentType);
        Response.ResponseBuilder responseBuilder = Response.ok(equipmentTypePersisted);
//        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteEquipmentType(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> deleteResult = equipmentTypeService.DeleteEquipmentType(Integer.valueOf(id), entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
//        addCorsHeader(responseBuilder);
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
