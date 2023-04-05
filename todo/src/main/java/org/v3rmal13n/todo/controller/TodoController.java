package org.v3rmal13n.todo.controller;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.v3rmal13n.todo.entity.Task;
import org.v3rmal13n.todo.repository.TodoRepository;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/v3rmal13n")
public class TodoController {

    private final TodoRepository todoRepository;
    @CrossOrigin
    @GetMapping("/getAll")
    public List<Task> findAll (HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        return todoRepository.findAll();
    }

    @CrossOrigin
    @PostMapping("/post")
    public Task post (@Valid
                     @RequestBody Task task,
                      HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        return todoRepository.save(task);
    }

    @CrossOrigin
    @PutMapping("/edit/{id}")
    public ResponseEntity edit (@PathVariable Integer id,
                                HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        boolean hasId = todoRepository.existsById(id);
        if (hasId) {
            Task task = todoRepository.getById(id);
            boolean done = task.getDone();
            task.setDone(!done);
            todoRepository.save(task);
            return new ResponseEntity<>("task edited", HttpStatus.OK);
        }
        return new ResponseEntity<>("not found", HttpStatus.NOT_FOUND);
    }

    @CrossOrigin
    @DeleteMapping("/remove/{id}")
    public String remove (@PathVariable Integer id,
                          HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        boolean hasId = todoRepository.existsById(id);
        if (hasId) {
            todoRepository.deleteById(id);
            return "task is deleted";
        }
        return "not deleted";
    }
}
