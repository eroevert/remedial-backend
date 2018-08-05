package com.dh.ssic.services;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.Position;
import com.dh.ssic.repository.ReporteRepository;
import org.glassfish.jersey.internal.guava.Lists;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ReporteService {

    @Autowired
    ReporteRepository reporteRepository;

    public List<Accident> findAll() {
        Iterable<Accident> iterable = reporteRepository.findAll();
        List<Accident> accident = Lists.newArrayList(iterable);
        return accident;
    }
    public List<Accident> reporteAccident(String nombre, String cargo) {
        Iterable<Accident> iterable = reporteRepository.reporteAccident(nombre,cargo);
        List<Accident> accident = Lists.newArrayList(iterable);
        return accident;
    }


}
