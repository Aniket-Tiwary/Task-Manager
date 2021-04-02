package com.example.taskmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.taskmanager.bean.ProfileBean;
import com.example.taskmanager.bean.Tasks;
import com.example.taskmanager.service.CustomerService;



@RestController
public class CustomerController {

	@Autowired
	private CustomerService cserv;

	
	
    @RequestMapping(value="/login")
    public ModelAndView meth1()
    {
    	
        return new ModelAndView("login");
    }
    
    
    
    @RequestMapping(value="/registered")
    public ModelAndView meth3(@ModelAttribute("customer")ProfileBean customer)
    {
    	
    	if(cserv.checkExistence(customer)==1)
    	{
    		ModelAndView mv = new ModelAndView();
    		mv.addObject("message", "*User is already register, please login");
    		mv.setViewName("signup");
    		return mv;
    	}
    	else
    	{
    		ModelAndView mv = new ModelAndView();
    		mv.addObject("message", "Please login to continue.");
    		cserv.userRegister(customer);
    		mv.setViewName("login");
    		return mv;
            
    	}
    	
    	
    
    
    }
    
    @RequestMapping(value="/signup")
    public ModelAndView meth2()
    {
        return new ModelAndView("signup");
    }
    
    @RequestMapping("/addNewTask")
    public ModelAndView newTaskForm(Model m,@RequestParam(name="email") String email) {
    	m.addAttribute("email", email);
    	return new ModelAndView("addNewTask");
    }
    
    @RequestMapping("/newTask")
    public ModelAndView addNewTask(@ModelAttribute("nt")Tasks nt, Model m,@RequestParam(name="email") String email)
    {
    	System.out.println("Email we extracted is : " + email);
    	
    	nt.setEmail(email);
    	cserv.addNewTask(nt);
    	
    	List<Tasks> tasks = cserv.findAllTasks(email);
		 if(tasks != null) {
//			 System.out.println("printing id for all tasks");
			 for(Tasks t:tasks)
			 {
				 System.out.println(t.getTaskId());
			 }
			 m.addAttribute("tasks", tasks); 
		 }
    	return new ModelAndView("showTasks");
    }
    
    @RequestMapping("/updateTask")
    public ModelAndView updateTask(Model m,@ModelAttribute("ts")Tasks ts)
    {
    	
    	m.addAttribute("mytask", ts); 
    	return new ModelAndView("updateTask");
    }
    
    @RequestMapping("/homeAfterUpdation")
    public ModelAndView homeAfterUpdation(Model m,@ModelAttribute("ts")Tasks ts)
    {
//    	System.out.println("before");
//    	 System.out.println("Email after click on update : " + ts.getEmail());
//		 System.out.println("id after click on update : " + ts.getTaskId());
    	cserv.updateTheTask(ts); 
    	 
		 List<Tasks> tasks = cserv.findAllTasks(ts.getEmail());
		 System.out.println("after");
		 System.out.println("Email after click on update : " + ts.getEmail());
		 System.out.println("id after click on update : " + ts.getTaskId());
		 if(tasks != null) {
			 m.addAttribute("tasks", tasks); 
		 }
		
		 m.addAttribute("aaa", ts.getEmail());
	     return new ModelAndView("showTasks");
    }
    
    @RequestMapping("/deleteTask")
    public ModelAndView deleteTask(Model m,@ModelAttribute("ts")Tasks ts)
    {
    	 cserv.deleteTask(ts);
    	 List<Tasks> tasks = cserv.findAllTasks(ts.getEmail());
		 if(tasks != null) {
			 m.addAttribute("tasks", tasks); 
		 }
		
		 m.addAttribute("aaa", ts.getEmail());
	     return new ModelAndView("showTasks");
    }
    
}

