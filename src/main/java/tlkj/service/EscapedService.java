package tlkj.service;

import java.util.Date;
import java.util.List;

import tlkj.model.Escaped;

public interface EscapedService {
	public List<Escaped> getHundredRecord();

	public List<Escaped> getAllRecord();

	public Escaped selectByPersonId(String personid);

	public int insertEscaped(Escaped escaped);

	public int getAllRecordNumber();

	public List<Escaped> searchEscaped(String sfzh, String xm);

	public Escaped getServerLatestEscaped();

	public List<Escaped> getServerUpdateEscaped(Date nrbjzdryksj,String sfzh);
}
