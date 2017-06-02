package tlkj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.EscapedMapper;
import tlkj.model.Escaped;
import tlkj.service.EscapedServiceI;

@Service("escapedService")
public class EscapedServiceImpl implements EscapedServiceI {

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

}
