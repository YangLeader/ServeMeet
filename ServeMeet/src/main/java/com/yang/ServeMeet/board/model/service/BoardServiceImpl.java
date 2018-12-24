package com.yang.ServeMeet.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.dao.BoardDao;
import com.yang.ServeMeet.board.model.vo.Board;
import com.yang.ServeMeet.board.model.vo.BoardFile;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board, List<BoardFile> fileList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int fileId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
