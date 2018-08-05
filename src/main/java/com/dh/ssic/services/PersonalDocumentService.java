/*
yussen Solis Garro
*/
package com.dh.ssic.services;

import com.dh.ssic.model.PersonalDocument;
import com.dh.ssic.model.ReturnModel;

public interface PersonalDocumentService extends GenericService<PersonalDocument> {
    ReturnModel<PersonalDocument> findByEmployeeKey(int id);
}
