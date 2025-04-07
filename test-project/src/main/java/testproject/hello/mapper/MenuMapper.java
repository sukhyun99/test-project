package testproject.hello.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import testproject.hello.domain.Menu;

@Mapper
public interface MenuMapper {

	public ArrayList<Menu> findAll();
	
	public ArrayList<Menu> findByUpperCode(String code);
	
	public void save(Menu menu);
}
