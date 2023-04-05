package org.v3rmal13n.todo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.v3rmal13n.todo.entity.Task;

public interface TodoRepository extends JpaRepository<Task, Integer> {
}
