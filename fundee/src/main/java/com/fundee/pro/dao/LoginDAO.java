package com.fundee.pro.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.pro.dto.LoginDTO;
import com.fundee.pro.mapper.LoginMapper;

@Service   
public class LoginDAO {

    @Autowired
    private LoginMapper loginMapper;   
    
    public boolean existsById(String id) {
        return loginMapper.existsById(id) > 0;
    }

    public int existsByEmail(String email) {
        return loginMapper.existsByEmail(email);
    }
    
    public String findIdByEmail(String email) {
        return loginMapper.findIdByEmail(email);
    }

    public int insertMember(com.fundee.pro.dto.LoginDTO dto){
        return loginMapper.insertMember(dto);  
    }

    public boolean canLogin(String id, String password) {
        return loginMapper.loginCount(id, password) > 0;
    }
    
    public int existsByNickname(String nickname){
        return loginMapper.existsByNickname(nickname);
    }
    
    public int loginCount(LoginDTO dto){
   
        return loginMapper.loginCount(dto.getId(), dto.getPassword());
    }
    
    public int findRoleById(String id){
        return loginMapper.findRoleById(id);
    }
    
    public String findNicknameById(String id){
        return loginMapper.findNicknameById(id);
    }
    
    public String findPwdByIdAndEmail(String id, String email) {
        return loginMapper.findPwdByIdAndEmail(id, email);
    }

    public LoginDTO login(LoginDTO input) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id", input.getId());
        param.put("password", input.getPassword()); 

        return loginMapper.selectLogin(param);
    }

    public LoginDTO findById(String id) {
        return loginMapper.findById(id);
    }

    public LoginDTO findByIdAndPassword(String id, String password) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id", id);
        param.put("password", password);
        return loginMapper.selectLogin(param); // mapper에서 <select> 구현
    }

    
    
    
}
    









    
    

