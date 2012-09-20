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
package com.campodejazayeri.wedding;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ektorp.CouchDbConnector;
import org.ektorp.ViewQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campodejazayeri.wedding.domain.GuestBookPost;
import com.campodejazayeri.wedding.domain.InvitationGroup;
import com.campodejazayeri.wedding.domain.Invitee;
import com.campodejazayeri.wedding.domain.MusicSuggestion;


/**
 *
 */
@Controller
public class InviteController {
	
	@Autowired
	@Qualifier("couchdb")
	CouchDbConnector db;
	
	@RequestMapping("/invite")
	public String invite(@RequestParam(value="code", required=false) String codeFromRequest,
	                     HttpServletResponse response,
	                     @CookieValue(value="campodejazayeri_id", required=false) String groupId,
		                 Model model) {
		if (codeFromRequest != null) {
			groupId = codeFromRequest;
			response.addCookie(new Cookie("campodejazayeri_id", codeFromRequest));
		}
		
		InvitationGroup group = getGroup(groupId);
		model.addAttribute("group", group);
		
		GuestBookPost lastPost = getLast(GuestBookPost.class, "guestbook", "posts");
		model.addAttribute("lastPost", lastPost);
		
		return "invite";
	}
	
	@RequestMapping("/fragment/quiz")
	public String quiz() {
		return "fragment-quiz";
	}
	
	@RequestMapping("/fragment/travel")
	public String travel() {
		return "fragment-travel";
	}

	@RequestMapping("/fragment/rsvp")
	public String rsvp(@CookieValue(value="campodejazayeri_id", required=false) String groupId,
	                   Model model) {
		
		InvitationGroup group = getGroup(groupId);
		model.addAttribute("group", group);
		
		if (group != null) {
			ViewQuery query = new ViewQuery().designDocId("_design/guestbook").viewName("posts_by_author")
					.key(group.getGroupName())
					.descending(true).includeDocs(true);
			model.addAttribute("postsByUser", db.queryView(query, GuestBookPost.class));
			
			model.addAttribute("suggestions", getAll(MusicSuggestion.class, "music", "suggestions"));
		}
		
		return "fragment-rsvp";
	}
	
	@RequestMapping("submit-rsvp")
	public String submitRsvp(@CookieValue(value="campodejazayeri_id", required=true) String groupId,
	                         HttpServletRequest request) {
		InvitationGroup group = getGroup(groupId);
		for (int i = 0; i < group.getInvitees().size(); ++i) {
			Invitee inv = group.getInvitees().get(i);
			Boolean ceremony = getBooleanParameter(request, "ceremony" + i);
			Boolean fiesta = getBooleanParameter(request, "fiesta" + i);
			Boolean wed = getBooleanParameter(request, "attendingWednesday" + i);
			Boolean thu = getBooleanParameter(request, "attendingThursday" + i);
			Boolean fri = getBooleanParameter(request, "attendingFriday" + i);
			Boolean rehearsal = getBooleanParameter(request, "attendingRehearsal" + i);
			inv.setAttendingCeremony(ceremony);
			inv.setAttendingFiesta(fiesta);
			inv.setAttendingWednesday(wed);
			inv.setAttendingThursday(thu);
			inv.setAttendingFriday(fri);
			inv.setAttendingRehearsal(rehearsal);
		}
		group.setRsvpDate(new Date());
		db.update(group);
		return "redirect:invite";
	}
	
	@RequestMapping("/fragment/schedule")
	public String schedule(@CookieValue(value="campodejazayeri_id", required=false) String groupId,
	                       Model model) {
		InvitationGroup group = getGroup(groupId);
		model.addAttribute("group", group);
		
		return "fragment-schedule";
	}
	
	@RequestMapping("/fragment/gifts")
	public String schedule() {
		return "fragment-gifts";
	}

	@RequestMapping("/fragment/guestbook")
	public String guestbook(@CookieValue(value="campodejazayeri_id", required=false) String groupId,
	                        Model model) {
		InvitationGroup group = getGroup(groupId);
		model.addAttribute("group", group);
		
		model.addAttribute("posts", getAll(GuestBookPost.class, "guestbook", "posts"));
		
		return "fragment-guestbook";
	}
	
	@RequestMapping("/post-to-guest-book")
	public String guestbookPost(@CookieValue(value="campodejazayeri_id", required=true) String groupId,
	                        @ModelAttribute GuestBookPost post) {
		if (StringUtils.hasText(post.getText())) {
			InvitationGroup group = getGroup(groupId);
			post.setDateCreated(new Date());
			post.setAuthor(group.getGroupName());
			db.create(post);
		}
		return "redirect:invite";
	}
	
	@RequestMapping("/suggest-music")
	public String suggestMusic(@CookieValue(value="campodejazayeri_id", required=true) String groupId,
	                        @ModelAttribute MusicSuggestion suggestion, HttpServletRequest request) {
		if (StringUtils.hasText(suggestion.getText())) {
			InvitationGroup group = getGroup(groupId);
			suggestion.setDateCreated(new Date());
			suggestion.setAuthor(group.getGroupName());
			db.create(suggestion);
		}
		return "redirect:invite";
	}
		
	@RequestMapping("/fragment/photos")
	public String guestbook() {
		return "fragment-photos";
	}


    private Boolean getBooleanParameter(HttpServletRequest request, String paramName) {
	    Boolean ret = null;
	    try {
	    	ret = Boolean.valueOf(request.getParameter(paramName));
	    } catch (Exception ex) { }
	    return ret;
    }

	private InvitationGroup getGroup(String groupId) {
    	if (groupId != null) {
			try {
				InvitationGroup group = db.get(InvitationGroup.class, groupId);
				if (group.getFirstView() == null) {
					group.setFirstView(new Date());
				}
				group.setLastView(new Date());
				db.update(group);
				return group;
			} catch (Exception ex) { }
		}
		return null;
    }
	
    private <T> T getLast(Class<T> clazz, String designDoc, String view) {
    	ViewQuery query = new ViewQuery().designDocId("_design/" + designDoc).viewName(view).descending(true).includeDocs(true).limit(1);
		List<T> results = db.queryView(query, clazz);
		if (results == null || results.isEmpty())
			return null;
		T last = results.get(0);
		return last;
    }

    private <T> List<T> getAll(Class<T> clazz, String designDoc, String view) {
    	ViewQuery query = new ViewQuery().designDocId("_design/" + designDoc).viewName(view).descending(true).includeDocs(true);
		return db.queryView(query, clazz);
    }

}
