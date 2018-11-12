package org.userdata.controller;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.userdata.model.Admin;
import org.userdata.model.Userdata;
import org.userdata.service.AdminService;


@Controller
public class AdminController {
	
	private MailSender mailSender;
	
	@Autowired
	public AdminService adminService;
	
	
	@InitBinder     // Converts empty strings into null when a form is submitted 
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
	
	/*Get Index Page*/
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main(ModelMap model, HttpSession session) {
			model.put("adminData", new Admin());
			return "/index";
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String login(ModelMap model, HttpSession session) {
			model.put("adminData", new Admin());
			return "/index";
	}
	
	/*Get Index Page finish*/
	
	/*Get admin home Page*/
	@RequestMapping(value="/admin/home", method=RequestMethod.GET)
	public String adminauth(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			
			model.put("adminData", new Admin());
			redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			return "/admin/home";
	}
	}
	/*Get user home Page*/
	@RequestMapping(value="/user/home", method=RequestMethod.GET)
	public String userauth(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			
			model.put("adminData", new Admin());
			//model.addAttribute("war", "Current Session Expired!!! Please login again");
			redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			return "/user/home";
	}
	}
	
	/*Get admin home Page POST*/
	@RequestMapping(value="/admin/auth", method=RequestMethod.POST)
	public String loginpost(ModelMap model, @ModelAttribute("adminData") Admin admin, HttpSession session, RedirectAttributes redirectAttributes) {
		if(admin.getAdminName()!=null && admin.getAdminPass()!=null && session.getAttribute("admin")== null) {
			admin = adminService.loginAdmin(admin);
			if(admin!=null) {
				if(admin.getAction().equals("0") && admin.getRoll().equals("admin")) {
					session.setAttribute("admin", admin);
					return "redirect:/admin/home";
				}
				else if(admin.getAction().equals("1") && admin.getRoll().equals("user")) {
					session.setAttribute("admin", admin);
					return "redirect:/user/home";
				}else {
					return "/index";
				}
				
			}else {
				// model.addAttribute("error", "Invalid User Name or Password");
				redirectAttributes.addFlashAttribute("error", " Invalid User Name or Password");
				return "redirect:/index";
			}
		}else {
			return "/index";
	}
	}
	
	/*Get admin home Page Finish*/
	
	/*Get admin add user data Page */
	
	@RequestMapping(value="/admin/adddata", method=RequestMethod.GET)
	public String adddata(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			return "/admin/adddata";
	}
	}
	
	@RequestMapping(value="/admin/create", method=RequestMethod.POST)
	public String adduser(@ModelAttribute("userData") Userdata userdata, HttpSession session, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";			
		} 
		Userdata userdata1 = adminService.checkData(userdata); 
		 if(userdata1 != null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("warning", "There is already a person registered with this phone number! please use another Number");
			return "redirect:/admin/adddata";
		}
		
			if(result.hasErrors()) {
				 model.put("adminData", new Admin());
				return "/index";
			}
			else {
			adminService.create(userdata);
			redirectAttributes.addFlashAttribute("successinsert", "New User Details Successfully Added");
			return "redirect:/admin/view";
			}
	}
	
	/*Get admin add user data Page */
	
	/*Get admin view Page */
	
	@RequestMapping(value="/admin/view", method=RequestMethod.GET)
	public String userview(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			model.put("userList", adminService.getAll());
			return "/admin/view";
	}
	}
	
	/*Get admin add user data Page Finish */
	
	/*Get admin update user data Page */
	
	@RequestMapping(value="/user/update/{userdataId}", method=RequestMethod.GET)
	public String userupdate(@PathVariable("userdataId") Long userdataId, Map<String, Object> map, HttpSession session, ModelMap model, RedirectAttributes redirectAttributes) {	
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			 map.put("userData", adminService.find(userdataId));		
			return "/admin/userupdate";
			
	}
	}
	
	@RequestMapping(value="/admin/updates", method=RequestMethod.POST)
	public String userupdates( @Valid @ModelAttribute("userData") Userdata userdata, HttpSession session, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			if(result.hasErrors()) {
				 model.put("adminData", new Admin());
				return "/index";
			}
			adminService.update(userdata);
			redirectAttributes.addFlashAttribute("successupdate", " User Updation Successfully Completed");
			return "redirect:/admin/view";
	}
	}
	
	/*Get admin update user data Page Finish */
	
	/*Get admin delete user data Page */
	
	@RequestMapping(value="/user/delete/{userdataId}", method=RequestMethod.GET)
	public String userdelete(@PathVariable("userdataId") Long userdataId, HttpSession session, ModelMap model,  Map<String, Object> map, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			adminService.delete(userdataId);
			redirectAttributes.addFlashAttribute("successdelete", " User Deletion Successfully Completed");
			return "redirect:/admin/view";
	}
	}
	
	/*Get admin delete user data Page Finish */
	
	/*Logout*/
	
	@RequestMapping(value="/authentication/logout", method=RequestMethod.GET)
	public String logout( HttpServletRequest request, HttpServletResponse response,  HttpSession session, ModelMap model,  Map<String, Object> map, RedirectAttributes redirectAttributes) {
		    model.put("adminData", new Admin());
	         session = request.getSession(false);
	         if(session != null) {
	        	 session.invalidate();
	        	redirectAttributes.addFlashAttribute("success", " Successfully Logout");
	        	 return "redirect:/index";

	}
	         return "/index";     
	}
	
	
	@RequestMapping(value="/admin/addmember", method=RequestMethod.GET)
	public String addmember(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("adminData", new Admin());
			return "/admin/addmember";
	}
	}
	
	@RequestMapping(value="/admin/membercreate", method=RequestMethod.POST)
	public String newmember(@ModelAttribute("adminData") Admin admindata, HttpSession session, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";			
		} 
			if(result.hasErrors()) {
				 model.put("adminData", new Admin());
				return "/index";
			}
			else {
			adminService.createmember(admindata);
			redirectAttributes.addFlashAttribute("successinsert", "New Member Details Successfully Added");
			return "redirect:/admin/memberview";
			}
	}
	
	
	@RequestMapping(value="/admin/memberview", method=RequestMethod.GET)
	public String memberview(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("adminData", new Admin());
			model.put("memList", adminService.getAllMember());
			return "/admin/memberview";
	}
	}
	
	
	@RequestMapping(value="/user/adduser", method=RequestMethod.GET)
	public String adduser(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			return "/user/adduser";
	}
	}
	
	@RequestMapping(value="/user/create", method=RequestMethod.POST)
	public String usercreate(@ModelAttribute("userData") Userdata userdata, HttpSession session, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";			
		} 
		Userdata userdata1 = adminService.checkData(userdata); 
		 if(userdata1 != null) {
			 model.put("adminData", new Admin());
			 redirectAttributes.addFlashAttribute("warning", "There is already a person registered with this phone number! please use another Number");
			return "redirect:/user/adduser";
		}
		
			if(result.hasErrors()) {
				 model.put("adminData", new Admin());
				return "/index";
			}
			else {
			adminService.create(userdata);
			redirectAttributes.addFlashAttribute("successinsert", "New User Details Successfully Added");
			return "redirect:/user/adduser";
			}
	}
	
	
	@RequestMapping(value="/admin/sendmail", method=RequestMethod.GET)
	public String sendmail(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			model.put("useremailList", adminService.getAll());
			return "/admin/sendmail";
	}
	}
	
	@RequestMapping(value="/admin/sendsinglemail", method=RequestMethod.POST)
	public String sendsinglemail(@ModelAttribute("userData") Userdata userdata, BindingResult result, Map<String, Object> map, ModelMap model, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	   
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			
			
		
		ApplicationContext context = 
	             new ClassPathXmlApplicationContext("mail-servlet.xml");
	
	    	 
		AdminController mm = (AdminController) context.getBean("adminController");
	        mm.sendMail("abhilashunni777@gmail.com",
	    		   request.getParameter("to"),
	    		   request.getParameter("subject"), 
	    		   request.getParameter("message") );

	   	redirectAttributes.addFlashAttribute("success", " Mail Successfully Send");
			return "redirect:/admin/sendmail";
	}
	}
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String from, String to, String subject, String msg) {

		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		mailSender.send(message);	
	}
	
	
/*SENDMULTIMAIL START*/
	
	
	@RequestMapping(value="/admin/sendmultimail", method=RequestMethod.GET)
	public String sendmultimail(ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   redirectAttributes.addFlashAttribute("war", " Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
			model.addAttribute("userData", new Userdata());
			model.put("useremailList", adminService.getAll());
			return "/admin/sendmultimail";
	}
	}
	
	
	@RequestMapping(value="/admin/sendmultimail", method=RequestMethod.POST)
	public String sendmultimail(@ModelAttribute("userData") Userdata userdata, BindingResult result, Map<String, Object> map, ModelMap model, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) throws SQLException  {
	   
		 List<Userdata> groups = adminService.getAll();
		 ArrayList<String> s = new ArrayList<String>();
		    for (Userdata m : groups) {
		        s.add(m.getEmail());
		    }	
		
		
		
		if(session.getAttribute("admin")== null) {
			   model.put("adminData", new Admin());
			   model.addAttribute("war", "Current Session Expired!!! Please login again");
			return "redirect:/index";
		}else {
		
		ApplicationContext context = 
	             new ClassPathXmlApplicationContext("mail-servlet.xml");
	
	    	 
		AdminController mm = (AdminController) context.getBean("adminController");
	        mm.sendsMail("abhilashunni777@gmail.com", s,
	       request.getParameter("subject"), 
	    		   request.getParameter("message") );

	   	redirectAttributes.addFlashAttribute("success", " Mail Successfully Send");
			return "redirect:/admin/sendmultimail";
	}
	}
	
	public void setMailsSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendsMail(String from,  ArrayList<String> s, String subject, String msg) throws SQLException  {
		
	        for (int i=0; i<s.size(); i++) {
	        	String x=s.get(i);
	        	//System.out.println(x);
	        SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom(from);
			message.setTo(x);
			message.setSubject(subject);
			message.setText(msg);
			mailSender.send(message);	
			
	        }
		

	}
	
	
}
