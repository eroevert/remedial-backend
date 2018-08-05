package com.dh.ssic.controller;

import com.dh.ssic.command.EquipmentAssignmentCommand;
import com.dh.ssic.model.*;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.EquipmentAssignmentRepository;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.repository.UserRepository;
import com.dh.ssic.services.EquipmentAssignmentService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@CrossOrigin
@Controller
@Path("/equipmentAssignment")
@Produces(MediaType.APPLICATION_JSON)
public class EquipmentAssignmentController {
    private EquipmentAssignmentService equipmentAssignmentService;
    private UserRepository userRepository;
    private EquipmentAssignmentRepository equipmentAssignmentRepository;
    @Autowired
    ApplicationContext appContext;
    public EquipmentAssignmentController(EquipmentAssignmentService equipmentAssignmentService,
                                         UserRepository userRepository,
                                         EquipmentAssignmentRepository equipmentAssignmentRepository) {
        this.equipmentAssignmentService = equipmentAssignmentService;
        this.userRepository = userRepository;
        this.equipmentAssignmentRepository = equipmentAssignmentRepository;
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @GET
    public Response getEquipmentAssignments() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<EquipmentAssignmentCommand>> equipmentAssignmentCommand = new ReturnModel<>();
        List<EquipmentAssignment> listEquipmentAssignments = equipmentAssignmentService.getAllEquipmentAssignment(entityService);
        List<EquipmentAssignmentCommand>  listEquipmentAssignmentCommand = new ArrayList<>();
        listEquipmentAssignments.forEach(eq -> {
            listEquipmentAssignmentCommand.add(new EquipmentAssignmentCommand(eq));
        });
        equipmentAssignmentCommand.setObject(listEquipmentAssignmentCommand);
        return Response.ok(equipmentAssignmentCommand).build();
    }

    @GET
    @Path("/employeesWithAssignments")
    public Response getEmployeeWithEquipmentAssignments() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<EquipmentAssignmentCommand>> equipmentAssignmentCommand = new ReturnModel<>();
        List<EquipmentAssignment> listEquipmentAssignments = equipmentAssignmentService.getAllEquipmentAssignment(entityService);
        List<EquipmentAssignmentCommand>  listEquipmentAssignmentCommand = new ArrayList<>();
        listEquipmentAssignments.forEach(eq -> {
            EquipmentAssignmentCommand equipmentAssignmentCommand1 = new EquipmentAssignmentCommand(eq);
            Equipment eeqq= eq.getEquipmentByEquipmentKey();
            equipmentAssignmentCommand1.setEquipmentName(eeqq.getName());
            equipmentAssignmentCommand1.setEquipmentCode(eeqq.getCode());
            AtomicBoolean exist = new AtomicBoolean(false);
            listEquipmentAssignmentCommand.forEach(e -> {
                if(e.getEmployeeCode().equals(equipmentAssignmentCommand1.getEmployeeCode())) {
                    exist.set(true);
                }
            });
            if(!exist.get()) {
                listEquipmentAssignmentCommand.add(equipmentAssignmentCommand1);
            }
        });
        equipmentAssignmentCommand.setObject(listEquipmentAssignmentCommand);
        return Response.ok(equipmentAssignmentCommand).build();
    }

    @GET
    @Path("/{id}")
    public Response getEquipmentAssignmentById(@PathParam("id") @NotNull int id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<EquipmentAssignment> equipmentAssignment = equipmentAssignmentService.getEquipmentAssignmentById(id, entityService);
        return Response.ok(equipmentAssignment).build();
    }

    @GET
    @Path("/employeeKey/{idEmployee}")
    public Response getEquipmentAssignmentByIdEmployee(@PathParam("idEmployee") @NotNull int id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<EquipmentAssignmentCommand>> returnModel = new ReturnModel<List<EquipmentAssignmentCommand>>();
        List<EquipmentAssignment> equipmentAssignments = equipmentAssignmentService.findByEmployeeKey(id, entityService);
        List<EquipmentAssignmentCommand> equipmentAssignmentCommands = new ArrayList<>();
        equipmentAssignments.forEach(eq -> {
            EquipmentAssignmentCommand equipmentAssignmentCommand1 = new EquipmentAssignmentCommand(eq);
            Equipment eeqq= eq.getEquipmentByEquipmentKey();
            equipmentAssignmentCommand1.setEquipmentName(eeqq.getName());
            equipmentAssignmentCommand1.setEquipmentCode(eeqq.getCode());
            equipmentAssignmentCommands.add((equipmentAssignmentCommand1));
        });
        returnModel.setObject(equipmentAssignmentCommands);
        return Response.ok(returnModel).build();
    }

    @POST
    public Response saveEquipmentAssignment(String equipmentAssignmentCommand) {
        GsonBuilder builder = new GsonBuilder();
        builder.serializeNulls();
        Gson gson = builder.create();
        EquipmentAssignmentCommand command = gson.fromJson(equipmentAssignmentCommand, EquipmentAssignmentCommand.class);

        Date date = new Date();
        long time = date.getTime();
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        User user = userRepository.GetUserByUsername("admin",entityService);
        EquipmentAssignment equipmentAssignment = command.toEquipmentAssignment();
        equipmentAssignment.setDateRegistration(new Timestamp(time));
        equipmentAssignment.setDate(new Date());
        equipmentAssignment.setDateRegistration(new Timestamp(time));
        equipmentAssignment.setDate(new Date());
        equipmentAssignment.setStatus("1");
        equipmentAssignment.setUserKey(user.getUserKey());
        ReturnModel<ReturnSPModel> equipmentAssignmentPersisted = equipmentAssignmentService.saveEquipmentAssingment(equipmentAssignment, entityService);
        return Response.ok(equipmentAssignmentPersisted).build();
    }

    @PUT
    public Response updateEquipmentAssignment(String equipmentAssignmentCommand) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        GsonBuilder builder = new GsonBuilder();
        builder.serializeNulls();
        Gson gson = builder.create();
        EquipmentAssignmentCommand command = gson.fromJson(equipmentAssignmentCommand, EquipmentAssignmentCommand.class);

        EquipmentAssignment equipmentAssignment1 = equipmentAssignmentRepository.findById(command.getEquipmentAssignmentKey()).get();

        EquipmentAssignment equipmentAssignment = command.toEquipmentAssignment();
        equipmentAssignment1.setEquipmentKey(equipmentAssignment.getEquipmentKey());
        equipmentAssignment1.setObservations(equipmentAssignment.getObservations());
        ReturnModel<ReturnSPModel> equipmentAssignmentPersisted = equipmentAssignmentService.updateEquipmentAssignment(equipmentAssignment1, entityService);
        return Response.ok(equipmentAssignmentPersisted).build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteEquipmentAssignment(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> deleteResult = equipmentAssignmentService.deleteEquipmentAssignment(Integer.valueOf(id), entityService);
        return Response.ok(deleteResult).build();
    }
}
