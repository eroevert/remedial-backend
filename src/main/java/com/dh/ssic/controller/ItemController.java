package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/item")
@Produces("application/json")
public class ItemController {
    private ItemService itemService;
    @Autowired
    ApplicationContext appContext;
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @GET
    public Response getItems() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<Item>> result = itemService.GetAllItems(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getItemById(@PathParam("id") @NotNull int id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<Item> item = itemService.FindItemById(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(item);
        return responseBuilder.build();
    }
    @GET
    @Path("/organization/{id}")
    public Response getItemsOrganization(@PathParam("id") @NotNull int id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<Item>> item = itemService.findByOrganizationKey(id,entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(item);
        return responseBuilder.build();
    }

    @POST
    public Response saveItem(Item item) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> itemPersisted = itemService.SaveItem(item, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(itemPersisted);
        return responseBuilder.build();
    }

    @PUT
    public Response updateItem(Item item) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> itemPersisted = itemService.UpdateItem(item, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(itemPersisted);
        return responseBuilder.build();
    }

    @GET
    @Path("/delete/{id}")
    public Response deleteItem(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> deleteResult = itemService.DeleteItem(Integer.valueOf(id), entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }
}
