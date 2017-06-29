package tlkj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.NormalMapper;
import tlkj.model.Normal;
import tlkj.model.NormalTable;
import tlkj.service.NormalService;

@Service("normalService")
public class NormalServiceImpl implements NormalService {

	private NormalMapper normalMapper;

	public NormalMapper getNormalMapper() {
		return normalMapper;
	}

	@Autowired
	public void setNormalMapper(NormalMapper normalMapper) {
		this.normalMapper = normalMapper;
	}

	public Normal getNormalById(int id) {
		return normalMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<NormalTable> getAll() {
		// TODO Auto-generated method stub
		return normalMapper.getAll();
	}

	@Override
	public void AddNormalRecord(Normal record) {
		// TODO Auto-generated method stub
		System.out.println("NSLLL"+record.getCommittime());
		normalMapper.insert(record);
	}

	@Override
	public List<Normal> getAllNormal() {
		// TODO Auto-generated method stub
		return normalMapper.getAllNormal();
	}

	@Override
	public List<NormalTable> searchNormalRecord(String personId, String personName, String addressName,
			String commitTime, String userName, String departmentName) {
		// TODO Auto-generated method stub
		return normalMapper.searchNormalRecord(personId, personName, addressName, commitTime, userName, departmentName);
	}

	@Override
	public List<Normal> compareByPersionIdAndCommitTime(String personId, String commitTime) {
		Map<String, Object> map = new HashMap<>();
		map.put("personId", personId);
		map.put("commitTime", commitTime);
		return normalMapper.compareByPersionIdAndCommitTime(map);
	}

}
