package com.x.m0751.repos;

import com.x.m0751.domain.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepository extends CrudRepository<Post, Integer> {

    List<Post> findByTag(String tag);
}
