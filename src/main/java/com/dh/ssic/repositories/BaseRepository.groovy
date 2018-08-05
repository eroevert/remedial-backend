package com.dh.ssic.repositories

import com.dh.ssic.model.ReturnModel
import com.dh.ssic.util.ApplicationUtil
import org.springframework.web.context.support.WebApplicationContextUtils


public interface BaseRepository {
    ReturnModel<List> spGetAllEntity()
    ReturnModel spGetEntityById(int id)
    ReturnModel spSaveEntity(Object model)
    ReturnModel spUpdateEntity(Object model)
    ReturnModel<String> spDeleteEntity(int id)
}
