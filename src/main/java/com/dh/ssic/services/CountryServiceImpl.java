package com.dh.ssic.services;

//import com.dh.ssic.JDBCUtil;
import com.dh.ssic.ResultSetMapper;
import com.dh.ssic.model.Country;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repository.CountryRepository;

//import com.dh.ssic.repository.JdbcCountryRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.sql.ResultSet;
import java.util.List;

@Service
public class CountryServiceImpl extends GenericServiceImplementation<Country> implements CountryService {
    private CountryRepository countryRepository;
//    private JdbcCountryRepository jdbcCountryRepository;
    public CountryServiceImpl(CountryRepository countryRepository) {
//        jdbcCountryRepository = new JdbcCountryRepository();
    }

    @Override
    protected CrudRepository<Country, Integer> getRepository() {
        return countryRepository;
    }

    public ReturnModel<List<Country>> GetList_DB() {
        ReturnModel<List<Country>> result = new ReturnModel<>();
//        result = jdbcCountryRepository.GetList();
        return result;
    }
}
