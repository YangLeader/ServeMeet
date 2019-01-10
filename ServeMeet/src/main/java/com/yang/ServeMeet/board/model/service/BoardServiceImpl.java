package com.yang.ServeMeet.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.board.model.vo.Report;
import com.yang.ServeMeet.board.model.dao.BoardDao;
import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardComment;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired 
	private BoardDao boardDao;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		return boardDao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {

		return boardDao.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(Board board, List<BoardFile> fileList) {
		
		int result = 0;
		int boardNo = 0;
		
		try {
			result = boardDao.insertBoard(board);
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			
			boardNo = board.getBoardNo(); //boardNo를 리턴함.
			
			//logger.debug("boardNo="+boardNo);
			
			//현재 Attachment객체의 boardNo는 값이 없다. 
			//1. 가져온 boardNo를 대입하던지
			//2. mapper의 insert문에서 selectKey를 사용함
			if(fileList.size()>0) {
				for(BoardFile bf : fileList) {
					// a.setBoardNo(boardNo); //게시물번호 대입
					result = boardDao.insertBoardFile(bf);
					if(result == BOARD_SERVICE_ERROR) throw new BoardException();
				}
			}
		} catch(Exception e){
			//logger.debug("게시물등록 에러");
//			throw new BoardException("게시물등록오류");
			throw e;
		}
		return result;
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		return boardDao.selectOneBoard(boardNo);
	}

	@Override
	public List<BoardFile> selectBoardFileList(int boardNo) {
		return boardDao.selectBoardFileList(boardNo);
	}

	@Override
	public int updateBoard(Board board, List<BoardFile> fileList) {
		int result = 0;
		
		List<BoardFile> originList = boardDao.selectBoardFileList(board.getBoardNo());
		
		try{
			result = boardDao.updateBoard(board);
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			
			if(originList.size() > 0) {
				result = boardDao.deleteBoardFile(board.getBoardNo());
				if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			} 
			
			if(fileList.size()>0){
				for(BoardFile bf : fileList){
					result = boardDao.updateBoardFile(bf);
					if(result == BOARD_SERVICE_ERROR) throw new BoardException();
				}
			}
		} catch(Exception e){
			//logger.debug("게시물등록 에러");
//			throw new BoardException("게시물등록오류");
			throw e;
		}
		
		return result;
	}

	@Override
	public int deleteBoard(int boardNo) {
		int result = boardDao.deleteBoard(boardNo);
		
		if(result > BOARD_SERVICE_ERROR && boardDao.selectBoardFileList(boardNo).size() > 0)
			result = boardDao.deleteBoardFile(boardNo);
		else if(result > BOARD_SERVICE_ERROR) result = 1;
		else throw new BoardException("게시글 삭제 실패!");
		
		if(result < 1) throw new BoardException("게시글 삭제 실패!");
		
		return result;
	}

	@Override
	public int deleteFile(int fileId) {
		return boardDao.deleteFile(fileId);
	}

	@Override
	public void updateViewCount(int boardNo) {
		
		boardDao.updateViewCount(boardNo);
		
	}
	
	// ------------------- BoardComment 관련 ------------------- //

	@Override
	public int insertBoardComment(BoardComment bComment) {
		
		int lastOrder = boardDao.selectOrder();
		
		if(bComment.getRefCid() == 0) {
			lastOrder++;
		} else {
			lastOrder = bComment.getOrderList();
		}
		
		bComment.setOrderList(lastOrder);
		
		return boardDao.insertBoardComment(bComment);
	}

	@Override
	public ArrayList<BoardComment> selectCommentList(int no) {
		
		return boardDao.selectCommentList(no); 
	}

	@Override
	public int updateBoardComment(BoardComment bComment) {
		
		return boardDao.updateBoardComment(bComment);
	}

	@Override
	public int deleteBoardComment(BoardComment bComment) {
		
		return boardDao.deleteBoardComment(bComment);
	}

	@Override
	public ArrayList<Map<String, String>> searchBoard(String condition, String keyword) {
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		
		hmap.put("condition", condition);
		hmap.put("keyword", keyword);
		
		ArrayList<Map<String, String>> list = boardDao.searchBoard(hmap);
		
		return list;
	}

	@Override
	public int insertBoardReport(Report report) {
		
		return boardDao.insertBoardReport(report);
	}

	@Override
	public Report selectReportCheck(int boardNo, String userName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardNo", boardNo);
		map.put("userName", userName);
		
		return boardDao.selectReportCheck(map);
	}

	@Override
	public ArrayList<Board> selectBoardTop7List() {
		
		return boardDao.selectBoardTop7List();
	}


}
