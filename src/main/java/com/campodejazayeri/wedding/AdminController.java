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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.ektorp.CouchDbConnector;
import org.ektorp.ViewQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campodejazayeri.wedding.domain.InvitationGroup;
import com.campodejazayeri.wedding.domain.Invitee;

/**
 *
 */
@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("couchdb")
	private CouchDbConnector db;
	
	@Autowired
	private JavaMailSender mailSender;
	
	List<String> events = Arrays.asList("attendingWednesday", "attendingThursday", "attendingFriday", "attendingCeremony", "attendingFiesta");
		
	@RequestMapping("/admin")
	public String admin(HttpSession session, @RequestParam(required = false, value = "password") String password,
	                    @RequestParam(required = false, value = "view") String groupId,
	                    @RequestParam(required = false, value = "item") String itemId, Model model) throws Exception {
		
		if (password != null)
			session.setAttribute("campodejazayeri-admin-password", password);
		if (!"PASSWORD".equals(session.getAttribute("campodejazayeri-admin-password"))) {
			return "admin-authenticate";
		}
		
		ViewQuery query = new ViewQuery().designDocId("_design/groups").viewName("groups").includeDocs(true);
		List<InvitationGroup> groups = db.queryView(query, InvitationGroup.class);
		model.addAttribute("groups", groups);
		
		List<String> attendees = new ArrayList<String>();
		List<String> notAttending = new ArrayList<String>();
		for (InvitationGroup g : groups) {
			for (Invitee inv : g.getAttending())
				attendees.add(g.getGroupName() + ": " + inv.getName());
			for (Invitee inv : g.getSaidNo())
				notAttending.add(g.getGroupName() + ": " + inv.getName());
		}
		model.addAttribute("numAttendees", attendees.size());
		model.addAttribute("attendees", attendees);
		model.addAttribute("numNotAttending", notAttending.size());
		model.addAttribute("notAttending", notAttending);
		
		List<String> attendingWednesday = new ArrayList<String>();
		List<String> attendingThursday = new ArrayList<String>();
		List<String> attendingFriday = new ArrayList<String>();
		List<String> attendingRehearsal = new ArrayList<String>();
		List<String> attendingCeremony = new ArrayList<String>();
		List<String> attendingFiesta = new ArrayList<String>();
		
		for (InvitationGroup g : groups) {
			for (Invitee i : g.getInvitees()) {
				if (test(i.getAttendingWednesday()))
					attendingWednesday.add(format(g, i));
				if (test(i.getAttendingThursday()))
					attendingThursday.add(format(g, i));
				if (test(i.getAttendingFriday()))
					attendingFriday.add(format(g, i));
				if (test(i.getAttendingRehearsal()))
					attendingRehearsal.add(format(g, i));
				if (test(i.getAttendingCeremony()))
					attendingCeremony.add(format(g, i));
				if (test(i.getAttendingFiesta()))
					attendingFiesta.add(format(g, i));
			}
		}
		
		model.addAttribute("attendingWednesday", attendingWednesday);
		model.addAttribute("attendingThursday", attendingThursday);
		model.addAttribute("attendingFriday", attendingFriday);
		model.addAttribute("attendingRehearsal", attendingRehearsal);
		model.addAttribute("attendingCeremony", attendingCeremony);
		model.addAttribute("attendingFiesta", attendingFiesta);
		
		List<String> englishGroups = new ArrayList<String>();
		List<String> spanishGroups = new ArrayList<String>();
		for (InvitationGroup g : groups) {
			if ("en".equals(g.getLanguage()) && g.getAttending().size() > 0) {
				englishGroups.add(g.getId() + " - " + g.getGroupName());
			} else if ("es".equals(g.getLanguage()) && g.getAttending().size() > 0) {
				spanishGroups.add(g.getId() + " - " + g.getGroupName());
			}
		}
		model.addAttribute("englishComing", englishGroups);
		model.addAttribute("spanishComing", spanishGroups);
		
		if (groupId != null) {
			InvitationGroup group = db.get(InvitationGroup.class, groupId);
			model.addAttribute("group", group);
		}
		
		return null;
	}
	
	/**
     * Auto generated method comment
     * 
     * @param g
     * @param i
     * @return
     */
    private String format(InvitationGroup g, Invitee i) {
    	return "<span style=\"font-size: 0.5em\">" + g.getGroupName() + "</span> - " + i.getName();
    }

	/**
     * Auto generated method comment
     * 
     * @param attending
     * @return
     */
    private boolean test(Boolean attending) {
	    return attending != null && attending;
    }

	@RequestMapping("/admin-add-group")
	public String addGroup(@ModelAttribute InvitationGroup group,
	                       @RequestParam("groupLanguage") String language) {
		if (StringUtils.hasText(group.getGroupName())) {
			group.setId(randomId());
			group.setLanguage(language);
			db.create(group);
		}
		return "redirect:admin";
	}
	
	private String randomId() {
		return "" + ((int) (Math.random() * 10000));
	}
	
	@RequestMapping("/admin-add-invitee")
	public String addInvitee(@RequestParam(required = false, value = "group") String groupId, @ModelAttribute Invitee invitee) {
		InvitationGroup group = db.get(InvitationGroup.class, groupId);
		group.addInvitee(invitee);
		db.update(group);
		return "redirect:admin?view=" + group.getId();
	}
	
	@RequestMapping("/bulk-invite")
	public String bulkInvite(@RequestParam("invitees") MultipartFile invitees) throws Exception {
		if (!invitees.isEmpty()) {
			Map<String, InvitationGroup> groupsByName = new HashMap<String, InvitationGroup>();
			ViewQuery query = new ViewQuery().designDocId("_design/groups").viewName("groups").includeDocs(true);
			 for (InvitationGroup existing : db.queryView(query, InvitationGroup.class)) {
				groupsByName.put(standardizeName(existing.getGroupName()), existing);
			}
			
			BufferedReader r = new BufferedReader(new InputStreamReader(invitees.getInputStream()));
			for (String row = r.readLine(); row != null; row = r.readLine()) {
				String[] cells = row.split(",");
				if (cells[0].equals("Group Name"))
					continue;
				if (!(StringUtils.hasText(cells[0]) && StringUtils.hasText(cells[1]) && StringUtils.hasText(cells[2])))
					throw new RuntimeException("Malformed row: " + row);
				if (cells[0].startsWith("\"") && cells[0].endsWith("\""))
					cells[0] = cells[0].substring(1, cells[0].length() - 1);
				InvitationGroup group = groupsByName.get(cells[0].trim());
				if (group == null) {
					group = new InvitationGroup();
					group.setGroupName(cells[0].trim());
					throw new RuntimeException("Only updates now! Couldn't find " + cells[0]);
				}
				group.setEmail(cells[1].trim());
				group.setLanguage(cells[2].trim());
				group.setInvitedTours(StringUtils.hasText(cells[3]));
				group.setInvitedRehearsal(StringUtils.hasText(cells[4]));
				if (group.getInvitees() != null)
					group.getInvitees().clear();
				for (int i = 5; i < cells.length; ++i) {
					if (StringUtils.hasText(cells[i].trim())) {
						Invitee invitee = new Invitee();
						invitee.setName(cells[i].trim());
						group.addInvitee(invitee);
					}
				}
				if (group.getInvitees().size() == 0)
					throw new RuntimeException("Group with no invitees: " + row);
				if (group.getId() == null) {
					group.setId(randomId());
					db.create(group);
					System.out.println("Created " + group.getGroupName());
				} else {
					db.update(group);
					System.out.println("Updated " + group.getId() + " " + group.getGroupName());
				}
			}
		}
		return "redirect:admin";
	}
	
	/*
	@RequestMapping("/cleanup")
	public String cleanup() {
		ViewQuery query = new ViewQuery().designDocId("_design/groups").viewName("groups").includeDocs(true);
		List<InvitationGroup> groups = db.queryView(query, InvitationGroup.class);
		for (InvitationGroup group : groups) {
			group.setInvitedRehearsal(false);
			db.update(group);
			//if (group.getGroupName().equals("Group Name") || group.getGroupName().equals("Al Graham"))
			//	db.delete(group);
		}
		return "redirect:admin";
	}
	*/
	
	
	/**
     * @param input
     * @return
     */
    private String standardizeName(String input) {
	    return input.replaceAll(",", "").trim();
    }
    
	@RequestMapping("/saidNo")
	@ResponseBody
	public String saidNo(@RequestParam("codes") String codes) throws Exception {
		StringBuilder log = new StringBuilder();
		for (StringTokenizer st = new StringTokenizer(codes, ", "); st.hasMoreTokens(); ) {
			String groupId = st.nextToken();
			InvitationGroup group = db.get(InvitationGroup.class, groupId);
			for (Invitee inv : group.getInvitees()) {
				inv.setAttendingWednesday(false);
				inv.setAttendingThursday(false);
				inv.setAttendingFriday(false);
				inv.setAttendingRehearsal(false);
				inv.setAttendingCeremony(false);
				inv.setAttendingFiesta(false);
			}
			db.update(group);
			log.append("Updated " + group.getGroupName() + " \n<br/>");
		}
		return log.toString();
	}
	
	@RequestMapping("/saidYes")
	@ResponseBody
	public String saidYes(@RequestParam("codes") String codes) throws Exception {
		StringBuilder log = new StringBuilder();
		for (StringTokenizer st = new StringTokenizer(codes, ", "); st.hasMoreTokens(); ) {
			String groupId = st.nextToken();
			InvitationGroup group = db.get(InvitationGroup.class, groupId);
			for (Invitee inv : group.getInvitees()) {
				if (group.isInvitedTours()) {
					inv.setAttendingWednesday(true);
					inv.setAttendingThursday(true);
					inv.setAttendingFriday(true);
				}
				if (group.isInvitedRehearsal())
					inv.setAttendingRehearsal(true);
				inv.setAttendingCeremony(true);
				inv.setAttendingFiesta(true);
			}
			db.update(group);
			log.append("Updated " + group.getGroupName() + " \n<br/>");
		}
		return log.toString();
	}


	@RequestMapping("/testmail")
	@ResponseBody
	public String testMail() throws Exception {
		MimeMessage message = mailSender.createMimeMessage();
		//SimpleMailMessage msg = new SimpleMailMessage();
		MimeMessageHelper msg = new MimeMessageHelper(message, "UTF-8");
		msg.setFrom("Darius and Monica <campodejazayeri@gmail.com>");
		msg.setTo("djazayeri@gmail.com");
		msg.setSubject("Testing wedding mail");
		msg.setText("Monica Campo Pati–o sabe escribir con ‡Ž’—œ.");
		mailSender.send(message);
		return "Sent!";
	}
	
	@RequestMapping("/sendmail")
	public String sendMail(@RequestParam(value="emailLanguage", required=false) String language,
	                       @RequestParam(value="whichPeople", required=false) String whichPeople,
	                       @RequestParam(value="codes", required=false) String whichCodes,
	                       @RequestParam("subject") String subject,
	                       @RequestParam("body") String body, HttpSession session) {
		if (!StringUtils.hasText(whichCodes) && !(StringUtils.hasText(language) && StringUtils.hasText(whichPeople))) {
			throw new RuntimeException("Must give codes or language & which");
		}
		if (!StringUtils.hasText(subject))
			throw new RuntimeException("Missing Subject");
		if (!StringUtils.hasText(body))
			throw new RuntimeException("Missing Body");
		if (body.indexOf("$code") < 0 || body.indexOf("$name") < 0)
			throw new RuntimeException("Must have $code and $name");
		
		if (!"en".equals(language) && !"es".equals(language))
			throw new RuntimeException("Must specify language");
				
		List<String> codes = new LinkedList<String>();
		
		if (StringUtils.hasText(whichCodes)) {
			for (StringTokenizer st = new StringTokenizer(whichCodes, ", "); st.hasMoreTokens(); ) {
				String groupId = st.nextToken();
				InvitationGroup group = db.get(InvitationGroup.class, groupId);
				if (group != null)
					codes.add(groupId);
			}
			
		} else {
			ViewQuery query = new ViewQuery().designDocId("_design/groups").viewName("groups").includeDocs(true);
			List<InvitationGroup> groups = db.queryView(query, InvitationGroup.class);
			for (InvitationGroup group : groups) {
				if (!whichPeople.equals("all")) {
					boolean anyYes = false;
					boolean anyNo = false;
					boolean anyNotYet = false;
					for (Invitee inv : group.getInvitees()) {
						Boolean coming = inv.getAttendingCeremony();
						if (coming == null) {
							anyNotYet = true;
						} else if (coming) {
							anyYes = true;
						} else {
							anyNo = true;
						}
					}
					boolean treatAsYes = anyYes && !anyNotYet;
					
					if (whichPeople.equals("notYet") && !anyNotYet) {
						continue;
					} else if (whichPeople.equals("yes") && !treatAsYes) {
						continue;
					}
				}
				if (group.getLanguage() == null)
					throw new RuntimeException("Group " + group.getId() + " (" + group.getGroupName() + ") doesn't have a language");
				if (group.getLanguage().equals(language))
					codes.add(group.getId());
			}
		
			//codes.add("4659");
		}
		
		session.setAttribute("wedding-mail-to", codes);
		session.setAttribute("wedding-mail-subject", subject);
		session.setAttribute("wedding-mail-body", body);
				
		return "redirect:sendingmail";
	}
	
	@RequestMapping("/sendingmail")
	public String sendingMail(HttpSession session, Model model,
	                          @RequestParam(required=false, value="sendNum") Integer sendNum) throws Exception {
		List<String> codesLeft = (List<String>) session.getAttribute("wedding-mail-to");
		String subject = (String) session.getAttribute("wedding-mail-subject");
		String body = (String) session.getAttribute("wedding-mail-body");
		if (sendNum != null) {
			for (int i = 0; i < sendNum; ++i) {
				if (codesLeft.size() == 0)
					break;
				String groupId = codesLeft.remove(0);
				InvitationGroup group = db.get(InvitationGroup.class, groupId);
				String msgBody = body.replaceAll("\\$code", group.getId());
				msgBody = msgBody.replaceAll("\\$name", group.getGroupName());
				sendEmail(group.getEmail(), subject, msgBody);
			}
		}

		if (codesLeft.size() == 0) {
			return "redirect:/admin";
		} else {
			model.addAttribute("subject", subject);
			model.addAttribute("body", body);
			model.addAttribute("numLeft", codesLeft.size());
			return null;
		}
	}

    private void sendEmail(String to, String subject, String body) throws Exception {
    	MimeMessage msg = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(msg, "UTF-8");
		helper.setFrom("Darius and Monica <campodejazayeri@gmail.com>");
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(body);
		mailSender.send(msg);
    }

    @RequestMapping("/fixRehearsal")
    public void fixRehearsal() throws Exception {
    	ViewQuery query = new ViewQuery().designDocId("_design/groups").viewName("groups").includeDocs(true);
		List<InvitationGroup> groups = db.queryView(query, InvitationGroup.class);
		for (InvitationGroup group : groups) {
			boolean changed = false;
			for (Invitee inv : group.getInvitees()) {
				if (inv.getAttendingFriday() != null && inv.getAttendingFriday()) {
					if (inv.getAttendingRehearsal() == null || !inv.getAttendingRehearsal()) {
						inv.setAttendingRehearsal(true);
						changed = true;
					}
				}
			}
			if (group.isInvitedTours() && !group.isInvitedRehearsal()) {
				group.setInvitedRehearsal(true);
				changed = true;
			} else {
				System.out.println("Not invited to rehearsal: " + group.getGroupName());
			}
			if (changed)
				db.update(group);
		}
    }
}
