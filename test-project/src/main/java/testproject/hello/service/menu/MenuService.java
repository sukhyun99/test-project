package testproject.hello.service.menu;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Menu;
import testproject.hello.mapper.MenuMapper;

@Slf4j
@Service
public class MenuService {

	private final MenuMapper menuMapper;

	public MenuService(MenuMapper menuMapper) {
		super();
		this.menuMapper = menuMapper;
	}

	public ArrayList<Menu> findAll() {
		return menuMapper.findAll();
	}

	public ArrayList<Menu> findByUpperCode(String code) {
		return menuMapper.findByUpperCode(code);
	}

	public void save(Menu menu) {
		menuMapper.save(menu);
	}
}
