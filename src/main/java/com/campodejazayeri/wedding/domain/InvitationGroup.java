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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;


/**
 *
 */
public class InvitationGroup extends WeddingCouchDbDocument {
	   
    private static final long serialVersionUID = 1L;

    private String groupName;
	private String email;
	private boolean invitedTours;
	private boolean invitedRehearsal;
	private String language;
	private Date firstView;
	private Date lastView;
	private Date rsvpDate;
	
	List<Invitee> invitees;
			
    /**
     * @return the email
     */
    public String getEmail() {
    	return email;
    }
	
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
    	this.email = email;
    }

    /**
     * @return the groupName
     */
    public String getGroupName() {
    	return groupName;
    }

    /**
     * @param groupName the groupName to set
     */
    public void setGroupName(String groupName) {
    	this.groupName = groupName;
    }

	
    /**
     * @return the invitees
     */
    public List<Invitee> getInvitees() {
    	return invitees;
    }

	
    /**
     * @param invitees the invitees to set
     */
    public void setInvitees(List<Invitee> invitees) {
    	this.invitees = invitees;
    }
	
    
    /**
     * @return the invitedTours
     */
    public boolean isInvitedTours() {
    	return invitedTours;
    }

	
    /**
     * @param invitedTours the invitedTours to set
     */
    public void setInvitedTours(boolean invitedTours) {
    	this.invitedTours = invitedTours;
    }

	
    /**
     * @return the invitedRehearsal
     */
    public boolean isInvitedRehearsal() {
    	return invitedRehearsal;
    }

	
    /**
     * @param invitedRehearsal the invitedRehearsal to set
     */
    public void setInvitedRehearsal(boolean invitedRehearsal) {
    	this.invitedRehearsal = invitedRehearsal;
    }

	/**
     * @return the language
     */
    public String getLanguage() {
    	return language;
    }

	
    /**
     * @param language the language to set
     */
    public void setLanguage(String language) {
    	this.language = language;
    }
    
	
    /**
     * @return the firstView
     */
    public Date getFirstView() {
    	return firstView;
    }

	
    /**
     * @param firstView the firstView to set
     */
    public void setFirstView(Date firstView) {
    	this.firstView = firstView;
    }
   
    
    /**
     * @return the lastView
     */
    public Date getLastView() {
    	return lastView;
    }

	
    /**
     * @param lastView the lastView to set
     */
    public void setLastView(Date lastView) {
    	this.lastView = lastView;
    }

	/**
     * @return the rsvpDate
     */
    public Date getRsvpDate() {
    	return rsvpDate;
    }

	
    /**
     * @param rsvpDate the rsvpDate to set
     */
    public void setRsvpDate(Date rsvpDate) {
    	this.rsvpDate = rsvpDate;
    }

    
	public void addInvitee(Invitee invitee) {
	    if (invitees == null)
	    	invitees = new ArrayList<Invitee>();
	    invitees.add(invitee);
    }
	
	@JsonIgnore
	public int getNumReplied() {
		int count = 0;
		if (invitees != null)
			for (Invitee inv : invitees)
				if (inv.isAttending())
					++count;
		return count;
	}
	
	@JsonIgnore
	public List<Invitee> getAttending() {
		List<Invitee> ret = new ArrayList<Invitee>();
		if (invitees != null)
			for (Invitee inv : invitees)
				if (inv.isAttending())
					ret.add(inv);
		return ret;
	}
	
	@JsonIgnore
	public List<Invitee> getSaidNo() {
		List<Invitee> ret = new ArrayList<Invitee>();
		if (invitees != null)
			for (Invitee inv : invitees)
				if (inv.getAttendingFiesta() != null && !inv.getAttendingFiesta())
					ret.add(inv);
		return ret;
	}
	
}
