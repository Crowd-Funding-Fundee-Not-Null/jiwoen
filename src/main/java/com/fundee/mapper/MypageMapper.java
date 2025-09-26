package com.fundee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fundee.dto.LoginDTO;

@Mapper
public interface MypageMapper {

    LoginDTO findById(@Param("id") String id);
    int updateMyInfo(LoginDTO dto);
  
    int updateMyInfoWithPwAndMaybePassword(
            @Param("dto") LoginDTO dto,
            @Param("verifyPassword") String verifyPassword,
            @Param("newPassword") String newPassword
    );
}
