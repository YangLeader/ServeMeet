package com.yang.ServeMeet.search.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

public interface SearchAllDao {

	List<MatchingListObj> searchMeet(Map<String, String> map);

}
