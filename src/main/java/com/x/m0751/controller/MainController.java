package com.x.m0751.controller;

import com.x.m0751.domain.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.x.m0751.repos.PostRepository;

import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private PostRepository postRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping ("/main")
    public String main(Map<String, Object> model){
        Iterable<Post> posts = postRepository.findAll();
        model.put("posts", posts);
        return "main";
    }

    @PostMapping ("/main")
    public String add(@RequestParam String text, @RequestParam String tag,  Map<String, Object> model){
        Post post = new Post(text, tag);
        postRepository.save(post);

        //update
        Iterable<Post> posts = postRepository.findAll();
        model.put("posts", posts);

        return "main";
    }

    @PostMapping("filter")
    public String filter (@RequestParam String filter, Map <String, Object> model) {
        Iterable<Post> posts;
        if (filter !=null && !filter.isEmpty()) {
            posts= postRepository.findByTag(filter);
        } else  {
            posts = postRepository.findAll();

        }
        model.put("posts", posts);
        return "main";
    }

}
