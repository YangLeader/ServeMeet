package com.yang.ServeMeet.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;

public interface BoardService {

	static int BOARD_SERVICE_ERROR = 0;
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board, List<BoardFile> fileList);

	Board selectOneBoard(int boardNo);

	List<BoardFile> selectBoardFileList(int boardNo);
	
	int updateBoard(Board board, List<BoardFile> fileList);
	
	int deleteBoard(int boardNo);

	int deleteFile(int fileId);

	void updateViewCount(int no);

	int insertBoardComment(BoardComment bComment);

	ArrayList<BoardComment> selectCommentList(int no);

	int updateBoardComment(BoardComment bComment);
}
