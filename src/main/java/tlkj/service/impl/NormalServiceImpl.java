package tlkj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.NormalMapper;
import tlkj.model.Normal;
import tlkj.service.NormalServiceI;

@Service("normalService")
public class NormalServiceImpl implements NormalServiceI {

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
	public List<Normal> getAll() {
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

}
