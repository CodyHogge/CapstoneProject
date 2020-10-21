package com.tracker.SunEmb1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.tracker.SunEmb1.model.Users;

public interface UsersRepository extends JpaRepository<Users, Long>{
	
	@Query("FROM Users WHERE username=?1 OR firstName=?1 OR lastName=?1")
	List<Users> searchUser(String keyword);
	
	@Query("Select u FROM Users u WHERE u.email=:email AND u.firstName LIKE (CONCAT('%',:name,'%' OR u.lastName=:name))")
	List<Users> customSearchUser(@Param("name") String name, @Param("email") String email);
	
	//Login
	@Query("FROM Users WHERE email=?1 AND password=?2")
	Optional<Users> login(String email, String password);
	//Login with Username
	@Query("FROM Users WHERE username=?1 AND password=?2")
	Optional<Users> loginUsername(String username, String password);
	//find Users by email
	Optional<Users> findUserByEmail(String email);
	//find Users by username
	Optional<Users> findUserByUsername(String username);

}
