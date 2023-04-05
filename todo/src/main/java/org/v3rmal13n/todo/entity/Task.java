package org.v3rmal13n.todo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.type.descriptor.jdbc.TinyIntJdbcType;

@Entity
//@Table(name = "task")
public class  Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @NotNull(message = "Заполните поле")
    private String title;

    private boolean done;

    public Task () {}

    public Task(String title, boolean done) {
        this.title = title;
        this.done = done;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean getDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }
}

