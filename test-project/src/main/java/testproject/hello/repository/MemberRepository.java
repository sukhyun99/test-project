package testproject.hello.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;

@Slf4j
@Repository
public class MemberRepository {

	private static Map<Long, Member> store = new HashMap<Long, Member>();
	private static long sequence = 0L;
	
	public Member save(Member member) {
		member.setId(++sequence);
		log.info("save: member={}", member);
		
		store.put(member.getId(), member);
		
		return member;
	}
	
	public Member findById(Long id) {
		return store.get(id);
	}
	
	public Optional<Member> findByLoginId(String loginId) {
		return findAll().stream().filter(m -> m.getUsername().equals(loginId)).findFirst();
	}
	
	public List<Member> findAll() {
		return new ArrayList<Member>(store.values());
	}
	
	public void clear() {
		store.clear();
	}
}
