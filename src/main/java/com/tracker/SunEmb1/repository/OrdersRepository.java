package com.tracker.SunEmb1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tracker.SunEmb1.model.Orders;

@Repository
public interface OrdersRepository extends JpaRepository<Orders, Long>{
	
	@Query("FROM Orders WHERE customerName=?1 OR userId=?1 OR orderId=?1")
	List<Orders> searchOrder(String keyword);
	
	@Query("Select u FROM Users u WHERE u.email=:email AND u.firstName LIKE (CONCAT('%',:name,'%' OR u.lastName=:name))")
	List<Orders> customSearchOrder(@Param("name") String name, @Param("email") String email);
	
	//find Order by division
	//Optional<Orders> findOrderByDivision(String division);
	

}
