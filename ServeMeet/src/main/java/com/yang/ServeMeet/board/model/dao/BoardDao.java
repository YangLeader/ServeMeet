package com.yang.ServeMeet.board.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.vo.Board;

public interface BoardDao {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	int insertBoardFile(BoardFile file);

	Board selectOneBoard(int boardNo);

	List<BoardFile> selectBoardFileList(int boardNo);

	int updateBoard(Board board);

	int updateBoardFile(BoardFile file);

	int deleteBoard(int boardNo);

	int deleteBoardFile(int boardNo);

	int deleteFile(int fileId);
}
