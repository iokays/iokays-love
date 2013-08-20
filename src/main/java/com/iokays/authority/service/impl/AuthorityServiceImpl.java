package com.iokays.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iokays.authority.domain.Authority;
import com.iokays.authority.repository.AuthorityRepository;
import com.iokays.authority.service.AuthorityService;

/**
 * 
 * 
 * @author pengyuanbing@gmail.com
 *
 */

@Service("authorityService")
public class AuthorityServiceImpl implements AuthorityService {
	
	public List<String> getIds() {
		return authorityRepository.getIds();
		
	}
	
	@Resource
	private AuthorityRepository authorityRepository;

	@Override
	public Page<Authority> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return authorityRepository.findAll(pageable);
	}

	@Override
	public Authority findOne(String id) {
		// TODO Auto-generated method stub
		return authorityRepository.findOne(id);
	}

	@Override
	public void insert(Authority authority) {
		authorityRepository.save(authority);
		
	}

	@Override
	public void update(Authority authority) {
		authorityRepository.save(authority);
		
	}

	@Override
	public void delete(String id) {
		authorityRepository.delete(id);
		
	}
}
