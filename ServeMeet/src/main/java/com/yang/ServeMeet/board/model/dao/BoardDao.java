package com.yang.ServeMeet.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.vo.Report;
import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;

public interface BoardDao {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	int insertBoardFile(BoardFile file);

	Board selectOneBoard(int boardNo);

	List<BoardFile> selectBoardFileList(int boardNo, String type);

	int updateBoard(Board board);

	int updateBoardFile(BoardFile file);

	int deleteBoard(int boardNo);

	int deleteBoardFile(int boardNo);

	int deleteFile(int fileId);

	void updateViewCount(int boardNo);

	int insertBoardComment(BoardComment bComment);

	ArrayList<BoardComment> selectCommentList(int no);

	int selectOrder();

	int updateBoardComment(BoardComment bComment);

	int deleteBoardComment(BoardComment bComment);

	ArrayList<Map<String, String>> searchBoard(HashMap<String, String> hmap);

	int insertBoardReport(Report report);

	Report selectReportCheck(Map<String, Object> map);

	ArrayList<Board> selectBoardTop7List();

	List<Map<String, Object>> myBoardList(String userName);

	int selectMyBoardTotalContents(String userName);

	List<Map<String, Object>> selectReportList();

	int selectReportCount();

	void updateRestoreBoard(int boardNo);

	List<Map<String, Object>> selectBlindList();
}
