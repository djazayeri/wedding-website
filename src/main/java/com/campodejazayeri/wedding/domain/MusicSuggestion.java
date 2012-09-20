/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package com.campodejazayeri.wedding.domain;

import java.util.Date;


/**
 *
 */
public class MusicSuggestion extends WeddingCouchDbDocument {

    private static final long serialVersionUID = 1L;
    
    String text;
    String author;
    Date dateCreated;
	
    /**
     * @return the text
     */
    public String getText() {
    	return text;
    }
	
    /**
     * @param text the text to set
     */
    public void setText(String text) {
    	this.text = text;
    }
	
    /**
     * @return the author
     */
    public String getAuthor() {
    	return author;
    }
	
    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
    	this.author = author;
    }
	
    /**
     * @return the dateCreated
     */
    public Date getDateCreated() {
    	return dateCreated;
    }
	
    /**
     * @param dateCreated the dateCreated to set
     */
    public void setDateCreated(Date dateCreated) {
    	this.dateCreated = dateCreated;
    }
	
}
