package tlkj.service;

import java.util.List;
import java.util.Map;

import tlkj.model.Normal;
import tlkj.model.NormalTable;
import tlkj.model.NormalTwoWeek;

public interface NormalService {

	public Normal getNormalById(int id);
	
	public List<NormalTable> getAll();
	
	public List<NormalTable> getNewNormalRecords();
	
	public List<NormalTable> searchNormalRecord(String personId,String personName,String addressName,String commitTime,String userName,String departmentName);
	
	public void AddNormalRecord(Normal record);
	
	public int getTodayNormalRecordsNum(String commitTime);
	
	public int getTodayEscapedNormalRecordsNum(String commitTime);
	
	public List<Normal> getAllNormal();
	
	public List<Normal> compareByPersionIdAndCommitTime(String personId,String commitTime);
	
	public List<NormalTwoWeek> getNormalRecordsTwoWeek(String startdate,String enddate);
}
