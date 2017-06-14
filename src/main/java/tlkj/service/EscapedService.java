package tlkj.service;

import java.util.List;

import tlkj.model.Escaped;

public interface EscapedService {
	public List<Escaped> getHundredRecord();
	
	public List<Escaped> getAllRecord();
	
	public Escaped selectByPersonId(String personid);
	
	public int insertEscaped(Escaped escaped);
}
