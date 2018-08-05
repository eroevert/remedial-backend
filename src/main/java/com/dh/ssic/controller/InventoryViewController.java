package com.dh.ssic.controller;

import com.dh.ssic.model.InventoryInput;
import com.dh.ssic.model.InventoryView;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.InventoryViewService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/inventory_report")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class InventoryViewController {
    @Autowired
    private InventoryViewService inventoryViewService;

    @GET
    public Response getInventoryReport() {
        List<InventoryInput> result = inventoryViewService.reportInventory();
        System.out.println("llego al get");
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

}
