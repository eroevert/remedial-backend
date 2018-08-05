package com.dh.ssic.services;

import com.dh.ssic.command.PoliticNotifications;
import com.dh.ssic.model.Notification;
import com.dh.ssic.model.Politics;
import com.dh.ssic.model.Position;
import com.dh.ssic.model.ReturnModel;

import java.util.List;

public interface PoliticsService extends GenericService<Politics> {
    ReturnModel<Politics> createPolitic(PoliticNotifications politicNotifications);
    void createNotifications(Politics politics, List<Integer> organizations, Integer createById);
}
