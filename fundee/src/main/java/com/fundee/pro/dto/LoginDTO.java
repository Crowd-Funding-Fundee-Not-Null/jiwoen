package com.fundee.pro.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class LoginDTO {
    private String id;
    private String password;
    private String passwordCheck; // 검증용(DB컬럼X)
    private String nickname;
    private String name;
    private String email;
    private String phone;
    private String address;
    private Integer role;
    private Integer join_date;
    
}
