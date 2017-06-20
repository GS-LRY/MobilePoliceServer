package tlkj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.EscapedMapper;
import tlkj.model.Escaped;
import tlkj.service.EscapedService;

@Service("escapedService")
public class EscapedServiceImpl implements EscapedService {

	private EscapedMapper escapedMapper;
	
	public EscapedMapper getEscapedMapper() {
		return escapedMapper;
	}

	@Autowired
	public void setEscapedMapper(EscapedMapper escapedMapper) {
		this.escapedMapper = escapedMapper;
	}

	@Override
	public List<Escaped> getHundredRecord() {
		return escapedMapper.getHundredRecord();
	}

	@Override
	public Escaped selectByPersonId(String personId) {
		return escapedMapper.selectByPersonId(personId);
	}

	@Override
	public List<Escaped> getAllRecord() {
		return escapedMapper.getAllRecord();
	}

	@Override
	public int insertEscaped(Escaped escaped) {
		// TODO Auto-generated method stub
		return escapedMapper.insert(escaped);
	}

	@Override
	public int getAllRecordNumber() {
		// TODO Auto-generated method stub
		return escapedMapper.getAllRecordNumber();
	}

	@Override
	public List<Escaped> searchEscaped(String sfzh, String xm) {
		// TODO Auto-generated method stub
		return escapedMapper.searchEscaped(sfzh, xm);
	}

	

}
