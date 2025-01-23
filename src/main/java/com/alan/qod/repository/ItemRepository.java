package com.alan.qod.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.alan.qod.model.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {
}
