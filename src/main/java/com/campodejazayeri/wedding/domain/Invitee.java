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

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 */
public class Invitee {
	
	private String name;
	private Boolean attendingWednesday;
	private Boolean attendingThursday;
	private Boolean attendingFriday;
	private Boolean attendingRehearsal;
	private Boolean attendingCeremony;
	private Boolean attendingFiesta;
	
	private String comments;
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	@JsonIgnore
	public boolean isAttending() {
		return attendingFiesta != null && attendingFiesta; 
	}
	
	
    /**
     * @return the attendingWednesday
     */
    public Boolean getAttendingWednesday() {
    	return attendingWednesday;
    }

	
    /**
     * @param attendingWednesday the attendingWednesday to set
     */
    public void setAttendingWednesday(Boolean attendingWednesday) {
    	this.attendingWednesday = attendingWednesday;
    }

	
    /**
     * @return the attendingThursday
     */
    public Boolean getAttendingThursday() {
    	return attendingThursday;
    }

	
    /**
     * @param attendingThursday the attendingThursday to set
     */
    public void setAttendingThursday(Boolean attendingThursday) {
    	this.attendingThursday = attendingThursday;
    }

	
    /**
     * @return the attendingFriday
     */
    public Boolean getAttendingFriday() {
    	return attendingFriday;
    }

	
    /**
     * @param attendingFriday the attendingFriday to set
     */
    public void setAttendingFriday(Boolean attendingFriday) {
    	this.attendingFriday = attendingFriday;
    }
    
    
    /**
     * @return the attendingRehearsal
     */
    public Boolean getAttendingRehearsal() {
    	return attendingRehearsal;
    }

	
    /**
     * @param attendingRehearsal the attendingRehearsal to set
     */
    public void setAttendingRehearsal(Boolean attendingRehearsal) {
    	this.attendingRehearsal = attendingRehearsal;
    }

    
	/**
     * @return the attendingCeremony
     */
    public Boolean getAttendingCeremony() {
    	return attendingCeremony;
    }

	
    /**
     * @param attendingCeremony the attendingCeremony to set
     */
    public void setAttendingCeremony(Boolean attendingCeremony) {
    	this.attendingCeremony = attendingCeremony;
    }

	
    /**
     * @return the attendingFiesta
     */
    public Boolean getAttendingFiesta() {
    	return attendingFiesta;
    }

	
    /**
     * @param attendingFiesta the attendingFiesta to set
     */
    public void setAttendingFiesta(Boolean attendingFiesta) {
    	this.attendingFiesta = attendingFiesta;
    }

	/**
     * @return the comments
     */
    public String getComments() {
    	return comments;
    }

	
    /**
     * @param comments the comments to set
     */
    public void setComments(String comments) {
    	this.comments = comments;
    }


}
