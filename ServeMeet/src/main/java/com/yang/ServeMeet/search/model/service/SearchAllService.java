package com.yang.ServeMeet.search.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

public interface SearchAllService {

	List<MatchingListObj> searchMeet(Map<String, String> map);

}
