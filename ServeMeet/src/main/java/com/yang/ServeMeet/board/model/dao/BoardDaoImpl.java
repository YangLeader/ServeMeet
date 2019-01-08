package com.yang.ServeMeet.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.vo.Report;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {

		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board.selectBoardList",null,rowBounds);
	}

	@Override
	public int selectBoardTotalContents() {

		return sqlSession.selectOne("board.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(Board board) {
		
		return sqlSession.insert("board.insertBoard", board);
	}

	@Override
	public int insertBoardFile(BoardFile file) {
		
		return sqlSession.insert("board.insertBoardFile", file);
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		return sqlSession.selectOne("board.selectOneBoard",boardNo);
	}

	@Override
	public List<BoardFile> selectBoardFileList(int boardNo) {
		return sqlSession.selectList("board.selectBoardFileList", boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("board.updateBoard", board);
	}

	@Override
	public int updateBoardFile(BoardFile file) {
		return sqlSession.insert("board.updateBoardFile", file);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.delete("board.deleteBoard", boardNo);
	}

	@Override
	public int deleteBoardFile(int boardNo) {
		return sqlSession.delete("board.deleteBoardFile", boardNo);
	}

	@Override
	public int deleteFile(int fileId) {
		return sqlSession.delete("board.deleteBoardFileOne", fileId);
	}

	@Override
	public void updateViewCount(int boardNo) {
		
		sqlSession.update("board.updateViewCount", boardNo);
		
	}
	
	// -------------------- BoardComment 관련 -------------------- //

	@Override
	public int insertBoardComment(BoardComment bComment) {
		
		return sqlSession.insert("boardComment.insertBoardComment", bComment);
	}

	@Override
	public ArrayList<BoardComment> selectCommentList(int boardNo) {
		
		return (ArrayList)sqlSession.selectList("boardComment.selectCommentList", boardNo);
	}

	@Override
	public int selectOrder() {
		
		return sqlSession.selectOne("boardComment.selectOrder");
	}

	@Override
	public int updateBoardComment(BoardComment bComment) {
		
		return sqlSession.update("boardComment.updateBoardComment", bComment);
	}

	@Override
	public int deleteBoardComment(BoardComment bComment) {
		
		return sqlSession.update("boardComment.deleteBoardComment", bComment);
	}

	@Override
	public ArrayList<Map<String, String>> searchBoard(HashMap<String, String> hmap) {

		return new ArrayList<Map<String, String>>(sqlSession.selectList("board.searchBoard", hmap));
	}

	@Override
	public int insertBoardReport(Report report) {
		
		return sqlSession.insert("board.insertBoardReport", report);
	}

	@Override
	public Report selectReportCheck(Map<String, Object> map) {
		
		return sqlSession.selectOne("board.selectReportCheck", map);
	}

}
