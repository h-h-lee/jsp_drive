package kr.teacher.dao;

public class TeacherDAO {
	//싱글톤 패턴
	private static TeacherDAO instance = new TeacherDAO();
	
	public static TeacherDAO getInstance() {
		return instance;
	}
	private TeacherDAO() {}
	
	//강사 추가
	
	//강사 목록
	
	//강사 수정
	
	//강사 삭제
}
