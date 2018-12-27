package com.yang.ServeMeet.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;
import com.yang.ServeMeet.board.model.vo.BoardFile;

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

}
