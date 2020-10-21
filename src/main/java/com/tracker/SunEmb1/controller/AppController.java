package com.tracker.SunEmb1.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tracker.SunEmb1.model.Customers;
import com.tracker.SunEmb1.model.Orders;
import com.tracker.SunEmb1.model.Users;
import com.tracker.SunEmb1.repository.CustomersRepository;
import com.tracker.SunEmb1.repository.OrdersRepository;
import com.tracker.SunEmb1.repository.UsersRepository;
import com.tracker.SunEmb1.utils.DataValidation;

@Controller
@SessionAttributes({"loggedInUser", "role", "division"})
public class AppController {
	
	@ModelAttribute("user")
	public Users user() {
		return new Users();
	}
	
	@ModelAttribute("order")
	public Orders order() {
		return new Orders();
	}
	
	@ModelAttribute("cutsomer")
	public Customers customer() {
		return new Customers();
	}
	
	
	@Autowired
	private UsersRepository userRepository;
	
	@Autowired
	private OrdersRepository orderRepository;
	
	@Autowired
	private CustomersRepository customerRepository;
	
	@Autowired
	private DataValidation dataValidation;
	
	@GetMapping({"login" , "/"})
	public String login(Model model) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("Error", "Error - Operation Failed.");
		model.addAttribute("Resp", "Resp - Action Completed.");
		return "login";
	}
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password) {
		// login user
		Optional<Users> user = userRepository.login(email, password);
		// add user email and role in session
		if (user.isPresent()) {
			System.out.println("Setting LOGGEDINUSER");
			model.addAttribute("loggedInUser", email);
			model.addAttribute("role", user.get().getRole());
			model.addAttribute("division", user.get().getDivision());
			System.out.println(user.get().getRole() + "*************");
			System.out.println(user.get().getDivision() + "*************");
			if(user.get().getDivision().contentEquals("ADMIN")) {
				return "redirect:/admin_dashboard";
			}
			else if(user.get().getDivision().contentEquals("EMB")) {
				return "redirect:/embroidery";
			} else if (user.get().getDivision().contentEquals("LAS")) {
				return "redirect:/laser";
			} else if (user.get().getDivision().contentEquals("SCR")) {
				return "redirect:/screenprint";
			} else if (user.get().getDivision().contentEquals("VIN")) {
				return "redirect:/vinyl";
			} else if(user.get().getDivision().contentEquals("DEFAULT")){
				System.out.println("GOING TO PROFILE1");
				return "redirect:/profile";
			}
				

		} else {
			redirect.addFlashAttribute("error", "Invalid Credentials");
			return "redirect:/login";
		}
		System.out.println("GOING TO PROFILE2");
		return "profile";
	}
	
	@PostMapping("loginUsername")
	String loginUsername(RedirectAttributes redirect, Model model, @RequestParam String username, @RequestParam String password) {
		// login user
		Optional<Users> user = userRepository.loginUsername(username, password);
		// add user email and role in session
		if (user.isPresent()) {
			System.out.println("Setting LOGGEDINUSER");
			model.addAttribute("loggedInUser", username);
			model.addAttribute("role", user.get().getRole());
			model.addAttribute("division", user.get().getDivision());
			System.out.println(user.get().getRole() + "*************");
			System.out.println(user.get().getDivision() + "*************");
			if(user.get().getDivision().contentEquals("ADMIN")) {
				return "redirect:/admin_dashboard";
			}
			else if(user.get().getDivision().contentEquals("EMB")) {
				return "redirect:/embroidery";
			} else if (user.get().getDivision().contentEquals("LAS")) {
				return "redirect:/laser";
			} else if (user.get().getDivision().contentEquals("SCR")) {
				return "redirect:/screenprint";
			} else if (user.get().getDivision().contentEquals("VIN")) {
				return "redirect:/vinyl";
			} else if(user.get().getDivision().contentEquals("DEFAULT")){
				System.out.println("GOING TO PROFILE1");
				return "redirect:/profile";
			}
		} else {
			redirect.addFlashAttribute("error", "Invalid Credentials");
			return "redirect:/login";
		}
		System.out.println("GOING TO PROFILE2");
		return "profile";
	}
	
	@GetMapping("logout")
	public String logout(Model model, SessionStatus status, HttpSession session) {
		session.invalidate();
		model.addAttribute("loggedInUser", "");
		model.addAttribute("role", "");
		Users user = new Users();
		model.addAttribute("user", user);
		model.addAttribute("msg1", "msg1 - You have been logged out.");
		return "login";
	}
	
	
	
	@GetMapping("register")
	public String register(Model model) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("Error", "Error - Operation Failed.");
		model.addAttribute("Resp", "Resp - Action Completed.");
		model.addAttribute("users", new Users());
		return "register";
	}
	
	@PostMapping("register")
	public String addUser(Model model, @ModelAttribute Users users)
	{
		users.setRole("USER");
		userRepository.save(users);
		
		return "redirect:/profile";
	}
	
	@GetMapping("dashboard")
	public String dashboard(Model model) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("Error", "Error - Operation Failed.");
		model.addAttribute("Resp", "Resp - Action Completed.");
		return "dashboard";
	}
	
	
	//*****************************
	//Begin Profile functions*****************************
	@GetMapping("profile")
	public String profile(@SessionAttribute("loggedInUser") String loggedInUser, Model model) {
		System.out.println(loggedInUser + "&&&&&&");
		try {
			if(loggedInUser.isEmpty() && loggedInUser != null) {
				System.out.println("USER EMPTY");
				model.addAttribute("Error", "Error - Session expired, please log in again.");
				return "login";
			}
			System.out.println("FINDING USER");
			userRepository.findUserByUsername(loggedInUser).ifPresent(a->{
				System.out.println("USER FOUND");
				model.addAttribute("user_account", a);
			});
			model.addAttribute("page", "Profile");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "profile";
	}
	
	@GetMapping("dash")
	public String dash(@SessionAttribute("loggedInUser") String loggedInUser) {
		System.out.println("FINDING LOGGED IN USER ****************");
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		System.out.println("USER FOUND: " + loggedInUser + "**************");
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}
		return "profile";
	}
	
	@PostMapping("updatemyinfo") 
	public String updateMyinfo(@ModelAttribute("user") Users user, RedirectAttributes red) {
		userRepository.findById(user.getUserId()).ifPresent(u->{
			u.setFirstName(user.getFirstName());
			u.setLastName(user.getLastName());
			
			u.setPassword(user.getPassword());
			u.setPassword2(user.getPassword2());
			userRepository.save(u);
			red.addFlashAttribute("success", "Update successful!");
			red.addFlashAttribute("user_Account", u);
			red.addFlashAttribute("error", "Update failed!");
		});
		return "redirect:profile";
	}
	//End Profile Functions*****************************
	//*****************************
	
	//*****************************
	//Begin Customer Functions*****************************
	@GetMapping("newCustomer")
	public String newCustomer(Model model) {
		model.addAttribute("welcomeMessage", "Welcome Message");
		model.addAttribute("Error", "Error - Operation Failed.");
		model.addAttribute("Resp", "Resp - Action Completed.");
		model.addAttribute("customers", new Customers());
		return "newCustomer";
	}
	
	@PostMapping("newCustomer")
	public String newCustomer(Model model, @ModelAttribute Customers customers, @SessionAttribute("loggedInUser") String loggedInUser)
	{
		try {
			model.addAttribute("welcomeMessage", "You are adding a new customer.");
			//users.setRole("USER");
			//userRepository.save(users);
			customerRepository.save(customers);
			
			System.out.println("FINDING LOGGED IN USER ****************");
			Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
			System.out.println("USER FOUND: " + loggedInUser + "**************");
			return "redirect:/customerList";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Error - Customer not added!");
			return "newCustomer";
		}
		
	}
	
	@PostMapping("searchCustomer")
	public String searchCustomer(@RequestParam String keyword, Model model) {
		List<Customers> customers = customerRepository.searchCustomer(keyword);
		if(customers.isEmpty()) {
			model.addAttribute("error", "No matches found");
		} else {
			model.addAttribute("list", customers);
			model.addAttribute("success", customers.size() + " matches found.");
		}
		return "customerList";
	}
	
	@PostMapping("updateCustomerInfo") 
	public String updateCustomerInfo(@ModelAttribute("customer") Customers customer, RedirectAttributes red) {
		customerRepository.findById(customer.getCustomerId()).ifPresent(c->{
			try {
				c.setFirstName(customer.getFirstName());
				c.setLastName(customer.getLastName());
				c.setCompany(customer.getCompany());
				c.setPhone(customer.getPhone());
				c.setEmail(customer.getEmail());
				c.setPriority(customer.getPriority());			
				customerRepository.save(c);
				red.addFlashAttribute("success", "Update successful!");
				red.addFlashAttribute("customer_account", c);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Update failed!");
			}
			
			red.addFlashAttribute("customer", c);
		});
		return "redirect:customerProfile";
	}
	
	@GetMapping({ "customerProfile" })
	String customerProfile(@SessionAttribute("loggedInUser") String loggedInUser, Model model, @ModelAttribute("customer") Customers customer, RedirectAttributes redirect) {
		System.out.println(customer.toString() + "**************************");
		try {
			System.out.println("FINDING CUSTOMER " + customer.getCustomerId() + "**************");
			customerRepository.findById(customer.getCustomerId()).ifPresent(c->{
				System.out.println("CUSTOMER FOUND**************");				
				
				model.addAttribute("customer_account", c);
			});;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR - CANNOT FIND CUSTOMER " +customer.getCustomerId());
			redirect.addFlashAttribute("error", "ERROR - CANNOT FIND CUSTOMER");
			
			
			//Return to user's Dashboard
			Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
			if(user.get().getDivision().contentEquals("ADMIN")) {
				return "redirect:/admin_dashboard";
			}
			else if(user.get().getDivision().contentEquals("EMB")) {
				return "redirect:/embroidery";
			} else if (user.get().getDivision().contentEquals("LAS")) {
				return "redirect:/laser";
			} else if (user.get().getDivision().contentEquals("SCR")) {
				return "redirect:/screenprint";
			} else if (user.get().getDivision().contentEquals("VIN")) {
				return "redirect:/vinyl";
			}
			return "redirect:/customerList";
			
		}
		return "customerProfile";
	}
	//End Customer Functions*****************************
	//*****************************
	
	//*****************************
	//Begin Order Functions*****************************
	@GetMapping("newOrder")
	public String newOrder(Model model) {
		model.addAttribute("welcomeMessage", "You are creating a new order.");
		model.addAttribute("Error", "Error - Operation Failed.");
		model.addAttribute("Resp", "Resp - Action Completed.");
		model.addAttribute("orders", new Orders());
		return "newOrder";
	}
	
	@PostMapping("newOrder")
	public String newOrder(Model model, @ModelAttribute Orders orders, @SessionAttribute("loggedInUser") String loggedInUser)
	{
		//users.setRole("USER");
		//userRepository.save(users);
		model.addAttribute("custList", customerRepository.findAll());
		LocalDate currentDate = LocalDate.now();
		orders.setReceivedDate(currentDate);
		orders.setStatus("NEW");
		String note = "ORDER CREATED";
		orders.setNote(note);
		orders.setUpdatedDate(currentDate);
		orders.setUserId(loggedInUser);
		orders.setLog(note, loggedInUser, currentDate);
		orderRepository.save(orders);
		model.addAttribute("orderList", orderRepository.findAll());
		
		System.out.println("FINDING LOGGED IN USER ****************");
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		System.out.println("USER FOUND: " + loggedInUser + "**************");
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}
		return "profile";
	}
	
	@PostMapping("editOrderPriority")
	String editCustomerPriority(@SessionAttribute("loggedInUser") String loggedInUser, @ModelAttribute("order") Orders order, RedirectAttributes redirect) {
		try {
			orderRepository.findById(order.getOrderId()).ifPresent(a -> {
				a.setPriority(order.getPriority());
				LocalDate currentDate = LocalDate.now();
				a.setUpdatedDate(currentDate);
				a.setUserId(loggedInUser);
				String note = "ORDER PRIORITY CHANGED to " + order.getPriority().toUpperCase();
				a.setNote(note);
				a.setLog(note, loggedInUser, currentDate);
				orderRepository.save(a);
			});
			redirect.addFlashAttribute("success", order.getPriority() + " Priority Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		return "redirect:/orderList";
	}
	
	@PostMapping("editOrderStatus")
	String editOrderStatus(@SessionAttribute("loggedInUser") String loggedInUser, @ModelAttribute("order") Orders order, RedirectAttributes redirect) {
		try {
			orderRepository.findById(order.getOrderId()).ifPresent(a -> {
				a.setStatus(order.getStatus());
				if(order.getStatus().equalsIgnoreCase("COMPLETE")) {
					//If the order is set to Complete, it will run this block
					LocalDate currentDate = LocalDate.now();
					String note = "ORDER COMPLETED";
					a.setUpdatedDate(currentDate);
					a.setClosedDate(currentDate);
					a.setNote(note);
					a.setLog(note, loggedInUser, currentDate);
					orderRepository.save(a);					
				} else {
				//if the order status is changed to anything other than complete, this code block will execute
					
				LocalDate currentDate = LocalDate.now();
				a.setUpdatedDate(currentDate);
				a.setUserId(loggedInUser);
				
				String note = "ORDER STATUS CHANGED to " + order.getStatus().toUpperCase();
				a.setNote(note);
				a.setLog(note, loggedInUser, currentDate);
				orderRepository.save(a);
				}
				
			});
			redirect.addFlashAttribute("success", order.getStatus() + " Status Updated.");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}
		return "redirect:/orderList";
	}
	
	@GetMapping({ "acceptOrder2" })
	String acceptOrder2(Model model,@SessionAttribute("loggedInUser")String loggedInUser, @ModelAttribute("order") Orders order) {
		System.out.println(order.getOrderId() + "OrderId***************");
		try {
			orderRepository.findById(order.getOrderId()).ifPresent(u->{
				System.out.println("ORDER FOUND");
				
				LocalDate currentDate = LocalDate.now();
				u.setAcceptedDate(currentDate);
				u.setDivAcceptedDate(currentDate);
				u.setUpdatedDate(currentDate);
				u.setUserId(loggedInUser);
				u.setStatus("ACCEPTED");
				String note = "ORDER ACCEPTED BY DIVISION";
				u.setNote(note);
				u.setLog(note, loggedInUser, currentDate);
				orderRepository.save(u);
			});
			
			model.addAttribute("success", "Order accepted");
			model.addAttribute("orderlist", orderRepository.findAll());
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("ORDER NOT FOUND - CHECK ID - " + order.getOrderId() + " and " + order.getOrderId() + "**************");
			model.addAttribute("error", "Operation Failed.");
		}
				
		//return to user dash
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}		
		return "orderList";
	}
	
	@GetMapping({ "removeorder" })
	String deleteOrder(Model model, @RequestParam Long orderId) {
		try {
			System.out.println(orderId + "orderID ************************");
			orderRepository.deleteById(orderId);
			model.addAttribute("success", "Delete success");
			model.addAttribute("list", orderRepository.findAll());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Delete Failed.");
		}
		return "redirect:/orderList";
	}
	
	@PostMapping("searchOrder")
	public String searchOrder(@RequestParam String keyword, Model model) {
		List<Orders> orders = orderRepository.searchOrder(keyword);
		if(orders.isEmpty()) {
			model.addAttribute("error", "No matches found");
		} else {
			model.addAttribute("orderList", orders);
			model.addAttribute("success", orders.size() + " matches found.");
		}
		return "orderList";
	}
	
	@PostMapping("addOrderNote")
	String addOrderNote(@SessionAttribute("loggedInUser") String loggedInUser, @ModelAttribute("order") Orders order, @RequestParam String orderId, RedirectAttributes redirect) {
		try {
			System.out.println("Finding OrderId: "+order.getOrderId() + "*******************");
			System.out.println("Finding customer: "+order.getCustomerName() + "*******************");
			orderRepository.findById(order.getOrderId()).ifPresent(a -> {
				System.out.println("ORDER FOUND**************************");
				LocalDate currentDate = LocalDate.now();
				a.setUpdatedDate(currentDate);
				a.setUserId(loggedInUser);
				
				a.setNote(order.getNote());
				a.setLog(a.getNote(), loggedInUser, currentDate);
				
				orderRepository.save(a);
			});
			redirect.addFlashAttribute("success", "Note added.");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
	//Return to user's Dashboard
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}
		return "redirect:/orderList";
	}
	
	@PostMapping("updateOrderDescription")
	String updateOrderDescription(@SessionAttribute("loggedInUser") String loggedInUser, @ModelAttribute("order") Orders order, @RequestParam String orderId, RedirectAttributes redirect) {
		System.out.println(order.getOrderId() + "*****************");
		System.out.println(orderId + "*******************");
		
		try {
			System.out.println("Finding order: " + order.getOrderId()+" *********************");
			orderRepository.findById(order.getOrderId()).ifPresent(a->{
				System.out.println("ORDER FOUND!!!!!!!!!!!!!!!");
				LocalDate currentDate = LocalDate.now();
				a.setUpdatedDate(currentDate);
				a.setUserId(loggedInUser);
				System.out.println("ORDER DESCRIPTION: " + a.getDescription());
				
				a.setDescription(a.getDescription());
				a.setLog("Description changed", loggedInUser, currentDate);
				System.out.println("NEW ORDER DESCRIPTION: " + a.getDescription());
				
				
				
				orderRepository.save(a);
			});
			redirect.addFlashAttribute("success", "Note added.");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		//Return to user's dashboard
		Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
		if(user.get().getDivision().contentEquals("ADMIN")) {
			return "redirect:/admin_dashboard";
		}
		else if(user.get().getDivision().contentEquals("EMB")) {
			return "redirect:/embroidery";
		} else if (user.get().getDivision().contentEquals("LAS")) {
			return "redirect:/laser";
		} else if (user.get().getDivision().contentEquals("SCR")) {
			return "redirect:/screenprint";
		} else if (user.get().getDivision().contentEquals("VIN")) {
			return "redirect:/vinyl";
		}
		return "redirect:/orderList";
	}
	
	@GetMapping({ "orderPage" })
	String orderPage(@SessionAttribute("loggedInUser") String loggedInUser, Model model, @ModelAttribute("order") Orders order, RedirectAttributes redirect) {
		System.out.println(order.toString() + "**************************");
		try {
			System.out.println("FINDING ORDER " + order.getOrderId() + "**************");
			orderRepository.findById(order.getOrderId()).ifPresent(o->{
				System.out.println("ORDER FOUND**************");
				System.out.println(o.getCustomerName() + "Customer Name *****************");
				
				try {
					String custKey = o.getCustomerName();
					System.out.println("custKey " + custKey + "***************");
					customerRepository.findCustomerByCompany(custKey).ifPresent(c->{
						model.addAttribute("customer_info", c);
					});
					customerRepository.findCustomerByFirstName(custKey).ifPresent(c->{
						model.addAttribute("customer_info", c);
					});
					customerRepository.findCustomerByLastName(custKey).ifPresent(c->{
						model.addAttribute("customer_info", c);
					});
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					model.addAttribute("customer_error", "Could not find customer");
					model.addAttribute("customer_info", "Could not find customer");
				}
				
				model.addAttribute("order_info", o);
			});;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR - CANNOT FIND ORDER " + order.getOrderId());
			redirect.addFlashAttribute("error", "ERROR - CANNOT FIND ORDER");
			
			
			//Return to user's Dashboard
			Optional<Users> user = userRepository.findUserByUsername(loggedInUser);
			if(user.get().getDivision().contentEquals("ADMIN")) {
				return "redirect:/admin_dashboard";
			}
			else if(user.get().getDivision().contentEquals("EMB")) {
				return "redirect:/embroidery";
			} else if (user.get().getDivision().contentEquals("LAS")) {
				return "redirect:/laser";
			} else if (user.get().getDivision().contentEquals("SCR")) {
				return "redirect:/screenprint";
			} else if (user.get().getDivision().contentEquals("VIN")) {
				return "redirect:/vinyl";
			}
			return "redirect:/orderList";
			
		}
		return "orderPage";
	}
	//End Order Functions*****************************
	//*****************************
	
	//*****************************
	//Login/Division landings*****************************
	@GetMapping("embroidery")
	public String embroidery(Model model,@ModelAttribute Orders order) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("msg", "Embroidery Dashboard");
		model.addAttribute("page", "Embroidery");
		model.addAttribute("orderList", orderRepository.findAll());
		return "embroidery";
	}
	
	@GetMapping("vinyl")
	public String vinyl(Model model, @ModelAttribute Orders order) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("msg", "Vinyl Dashboard");
		model.addAttribute("page", "Vinyl");
		model.addAttribute("orderList", orderRepository.findAll());
		return "vinyl";
	}
	
	@GetMapping("laser")
	public String laser(Model model, @ModelAttribute Orders order) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("msg", "Laser Dashboard");
		model.addAttribute("page", "Laser");
		model.addAttribute("orderList", orderRepository.findAll());
		return "laser";
	}
	
	@GetMapping("screenprint")
	public String screenprint(Model model, @ModelAttribute Orders order) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("msg", "Screenprint Dashboard");
		model.addAttribute("page", "Screenprint");
		model.addAttribute("orderList", orderRepository.findAll());
		return "screenprint";
	}
	
	//End Division Landings*****************************
	//*****************************
	
	//*****************************
	//Begin Admin functions*****************************
	@GetMapping("admin_dashboard")
	public String admin(Model model, @ModelAttribute Orders orders) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("list", userRepository.findAll());
		model.addAttribute("orderList", orderRepository.findAll());
		return "admin_dashboard";
	}
	
	@GetMapping("empList")
	public String empList(@ModelAttribute Users user, Model model) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("list", userRepository.findAll());
		return "empList";
	}
	
	@PostMapping("searchUser")
	public String searchUser(@RequestParam String keyword, Model model) {
		List<Users> users = userRepository.searchUser(keyword);
		if(users.isEmpty()) {
			model.addAttribute("error", "No matches found");
		} else {
			model.addAttribute("list", users);
			model.addAttribute("success", users.size() + " matches found.");
		}
		return "empList";
	}
	
	@GetMapping("customerList")
	public String customerList(@ModelAttribute Customers customer, Model model) {
		model.addAttribute("msg1", "msg1 - Message tag");
		model.addAttribute("list", customerRepository.findAll());
		return "customerList";
	}
	
	@GetMapping("orderList")
	public String orderList(@ModelAttribute Orders order, Model model) {
		model.addAttribute("welcomeMessage", "msg1 - Message tag");
		model.addAttribute("orderList", orderRepository.findAll());
		return "orderList";
	}
	
	@GetMapping("orderArchive")
	public String orderArchive(@ModelAttribute Orders order, Model model) {
		model.addAttribute("welcomeMessage", "msg1 - Message tag");
		model.addAttribute("orderList", orderRepository.findAll());
		return "orderArchive";
	}
		
	@PostMapping("editCustomerPriority")
	String editCustomerPriority(@ModelAttribute("customer") Customers customer, RedirectAttributes redirect) {
		try {
			customerRepository.findById(customer.getCustomerId()).ifPresent(a -> {
				a.setPriority(customer.getPriority());
				customerRepository.save(a);
			});
			redirect.addFlashAttribute("success", customer.getPriority() + " Priority Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		return "redirect:/customerList";
	}
	
	@PostMapping("editrole")
	String editrole(@RequestParam Long userId, @RequestParam String role, RedirectAttributes redirect) {
		try {
			userRepository.findById(userId).ifPresent(a -> {
				a.setRole(role);
				userRepository.save(a);
			});
			redirect.addFlashAttribute("success", role + " Role Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		return "redirect:/empList";
	}
	
	@PostMapping("editdivision")
	String editdivision(@RequestParam Long userId, @RequestParam String division, RedirectAttributes redirect) {
		try {
			userRepository.findById(userId).ifPresent(a -> {
				a.setDivision(division);
				userRepository.save(a);
			});
			redirect.addFlashAttribute("success", division + " Division assigned ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		return "redirect:/empList";
	}
	
	@GetMapping({ "removeuser" })
	String deleteUser(Model model, @ModelAttribute("user") Users user) {
		try {
			userRepository.deleteById(user.getUserId());
			model.addAttribute("success", "Delete success");
			model.addAttribute("list", userRepository.findAll());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Delete Failed.");
		}
		return "empList";
	}
	
	@GetMapping({ "removecustomer" })
	String deleteCustomer(Model model, @RequestParam Long customerId) {
		try {
			System.out.println(customerId + "CustomerID ************************");
			customerRepository.deleteById(customerId);
			model.addAttribute("success", "Delete success");
			model.addAttribute("list", customerRepository.findAll());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Delete Failed.");
		}
		return "customerList";
	}
	
	@GetMapping({"resetpassword"})
	String resetPassword(Model model, @RequestParam Long id, RedirectAttributes redirect) {
		try {
			userRepository.findById(id).ifPresent(a->{
				a.setPassword("P@ssw0rd");
				a.setPassword2("P@ssw0rd");
				userRepository.save(a);
			});
			redirect.addFlashAttribute("success", "Password reset");
		} catch(Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Operation Fail");
		}
		return "redirect:/empList";
	}
	
	@PostMapping("addUser2") 
	public String addUser2(@ModelAttribute("user") Users user, RedirectAttributes red, Model model) {
		red.addFlashAttribute("success", "Update successful!");
		user.setRole("USER");
		userRepository.save(user);
		model.addAttribute("user", new Users());
		return "redirect:empList";
		}
}
