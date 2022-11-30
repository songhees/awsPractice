package com.awsProject.config.auth.dto;

import com.awsProject.domain.user.User;
import lombok.Getter;

import java.io.Serializable;

/**
 * 검증된 유저 정보만 받아서 전달하는 dto역할
 * 직렬화가 필요하기 때문에 따로 만듬 (entity는 직렬화 할 수 없다.)
 */
@Getter
public class SessionUser implements Serializable {
    private String name;
    private String email;
    private String picture;

    public SessionUser(User user) {
        this.name = user.getName();
        this.email = user.getEmail();
        this.picture = user.getPicture();
    }
}
