package com.tracker.SunEmb1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tracker.SunEmb1.model.Customers;

public interface CustomersRepository extends JpaRepository<Customers, Long>{
	
	@Query("FROM Customers WHERE email=?1 OR firstName=?1 OR lastName=?1 OR company=?1")
	List<Customers> searchCustomer(String keyword);
	
	@Query("Select u FROM Customers u WHERE u.email=:email AND u.firstName LIKE (CONCAT('%',:name,'%' OR u.lastName=:name))")
	List<Customers> customSearchCustomer(@Param("name") String name, @Param("email") String email);
	
	//find Customers by email
	Optional<Customers> findCustomerByEmail(String email);
	
	//find Customers by id
	
	Optional<Customers> findCustomerByCompany(String company);
	
	Optional<Customers> findCustomerByFirstName(String firstName);
	Optional<Customers> findCustomerByLastName(String lastName);

}
