package com.insight.desafio.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.insight.desafio.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
}
