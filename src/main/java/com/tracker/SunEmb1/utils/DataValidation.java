package com.tracker.SunEmb1.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tracker.SunEmb1.model.Users;
import com.tracker.SunEmb1.repository.CustomersRepository;
import com.tracker.SunEmb1.repository.OrdersRepository;
import com.tracker.SunEmb1.repository.UsersRepository;

@Component
public class DataValidation implements Validator{
	
	@Autowired
	public UsersRepository userRepository;
	
	@Autowired
	public CustomersRepository customerRepository;
	
	@Autowired
	public OrdersRepository orderRepository;
	
	String emailRegex ="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Users.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object o, Errors errors) {
		Users user = (Users) o;
		ValidationUtils.rejectIfEmpty(errors, "firstName", "size.user.firstName");
		ValidationUtils.rejectIfEmpty(errors, "lastName", "size.user.lastName");
		ValidationUtils.rejectIfEmpty(errors, "username", "NotEmpty");
		ValidationUtils.rejectIfEmpty(errors, "email", "NotEmpty");
		if(userRepository.findUserByEmail(user.getEmail()).isPresent()) {
			errors.rejectValue("email", "size.user.unique");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
		if(!user.getPassword2().equals(user.getPassword())) {
			errors.rejectValue("password2", "match.user.password2");
		}
		if(!user.getEmail().matches(emailRegex)) {
			errors.rejectValue("email", "size.user.email");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if(!user.getPassword().matches(passwordRegex)) {
			errors.rejectValue("password", "size.user.password");
		}
	}

}
