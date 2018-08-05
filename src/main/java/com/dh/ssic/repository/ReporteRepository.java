package com.dh.ssic.repository;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.Equipment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ReporteRepository extends CrudRepository<Accident, Integer> {

//    @Query("SELECT t.title FROM Todo t where t.id = :id")
//    Optional<String> findTitleById(@Param("id") Long id);
//
//     @Query("select p from Accident p where p.nombre = :nombre  and p.cargo = :cargo")
//    List<Accident> reporteAccident(@Param("nombre") String nombre, @Param("cargo")   String cargo);

    @Query("select p from Accident p")
    List<Accident> reporteAccident(@Param("nombre") String nombre, @Param("cargo")   String cargo);


}

