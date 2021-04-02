package com.example.taskmanager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.taskmanager.bean.Tasks;
import com.example.taskmanager.bean.UserCredential;
import com.example.taskmanager.service.CustomerService;
import com.example.taskmanager.service.MyEmailService;
import com.example.taskmanager.service.OtpService;
import com.example.taskmanager.utility.EmailTemplate;


@Controller
public class OtpController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public OtpService otpService;
	
	@Autowired
	private CustomerService cserv;
	
	@Autowired
	public MyEmailService myEmailService;
	
	@RequestMapping("/generateOtp")
	public ModelAndView generateOtp(Model m,@ModelAttribute("uc")UserCredential uc){
		if(cserv.isAuth(uc)) {
			String email = uc.getEmail();
			
			int otp = otpService.generateOTP(email);
			
			logger.info("OTP : "+otp);
			
			//Generate The Template to send OTP 
			EmailTemplate template = new EmailTemplate("SendOtp.html");
			
			Map<String,String> replacements = new HashMap<String,String>();
			replacements.put("user", email);
			replacements.put("otpnum", String.valueOf(otp));
			
//			System.out.println(email +" is the authenticated user");
//			System.out.println(otp +" is the OTP");
			
			
			String message = template.getTemplate(replacements);
//			System.out.println(message +" is the message for the email");
			
			myEmailService.sendOtpMessage(email, "OTP -SpringBoot", String.valueOf(otp));
			m.addAttribute("aaa", email);
			return new ModelAndView("otppage");
		}
		else {
			String message="Please register to login";
			 ModelAndView mv=new ModelAndView();
			 mv.addObject("message", message);
			 mv.setViewName("login");	
			 return mv;	
		}
	}
	
	@RequestMapping("/home")
	public ModelAndView loadHome() {
		return new ModelAndView("showTasks");
	}
	
	
	@RequestMapping(value ="/validateOtp", method = RequestMethod.POST)
	public ModelAndView validateOtp(Model m,@RequestParam("otpnum") int otpnum,@RequestParam("email") String email){		  
		logger.info(" Otp Number entered : "+ otpnum);
//		System.out.println("OTP sent is : " + otpService.getOtp(email));
		//Validate the OTP
		if(otpnum >= 0){
			int serverOtp = otpService.getOtp(email);
			if(serverOtp > 0){
				if(otpnum == serverOtp){
					otpService.clearOTP(email);
					ModelAndView mv = new ModelAndView();
					List<Tasks> tasks = cserv.findAllTasks(email);
					if(tasks != null) {
						 m.addAttribute("tasks", tasks); 
					}
//					System.out.println("Email from signup : " + email);
					m.addAttribute("aaa", email);
					return loadHome();
				}else{
					m.addAttribute("aaa", email);
					String message="Entered OTP is invalid please check again and enter!";
					ModelAndView mv = new ModelAndView();
					mv.addObject("message", message);
					mv.setViewName("otppage");	
					return mv;
				}
			}else {
				m.addAttribute("aaa", email);
				String message="There was a problem in generating OTP kindly login again.";
				ModelAndView mv=new ModelAndView();
				mv.addObject("message", message);
				mv.setViewName("login");	
				return mv;
			}
		}else {
			m.addAttribute("aaa", email);
			String message="Enter an OTP to continue";
			ModelAndView mv=new ModelAndView();
			mv.addObject("message", message);
			mv.setViewName("otppage");	
			return mv;
		}
	}
}
