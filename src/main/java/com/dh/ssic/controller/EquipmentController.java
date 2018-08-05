package com.dh.ssic.controller;

import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.EquipmentService;
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
@Path("/equipment")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class EquipmentController {
    private EquipmentService equipmentService;
    @Autowired
    ApplicationContext appContext;

    public EquipmentController(EquipmentService equipmentService) {
        this.equipmentService = equipmentService;
    }

    @GET
    public Response getEquipments() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        List<Equipment> equipmentList = equipmentService.getAllEquipment(entityService);
        ReturnModel<List<Equipment>> result = new ReturnModel<>();
        result.setObject(equipmentList);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }
    @GET
    @Path("/{id}")
    public Response getEquipmentsById(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<Equipment> equipment = equipmentService.getEquipmentById(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(equipment);
        return responseBuilder.build();
    }

    @POST
    public Response saveEquipment(Equipment equipment) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        equipment.setCode("TE");
        ReturnModel<ReturnSPModel> equipmentPersisted = equipmentService.saveEquipment(equipment, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(equipmentPersisted);
        return responseBuilder.build();
    }


    @PUT
    public Response updateEquipment(Equipment equipment) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> equipmentPersisted = equipmentService.updateEquipment(equipment, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(equipmentPersisted);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteEquipment(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> deleteResult = equipmentService.deleteEquipment(Integer.valueOf(id), entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
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
