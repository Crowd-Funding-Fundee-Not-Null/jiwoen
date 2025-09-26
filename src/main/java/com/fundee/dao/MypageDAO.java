package com.fundee.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.dto.LoginDTO;
import com.fundee.mapper.MypageMapper;

@Service
public class MypageDAO {

	@Autowired
    private MypageMapper mypageMapper;

    public LoginDTO findById(String id){
        return mypageMapper.findById(id);
    }

    public int updateMyInfo(LoginDTO dto){
        return mypageMapper.updateMyInfo(dto);
    }
    
    public int updateMyInfoWithPwAndMaybePassword(
    		LoginDTO dto, 
    		String verifyPassword, 
    		String newPassword){    	
    	
        return mypageMapper.updateMyInfoWithPwAndMaybePassword(dto, verifyPassword, newPassword);
    }
	
}














