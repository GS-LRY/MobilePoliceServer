package tlkj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tlkj.model.Normal;
import tlkj.model.NormalTable;

public interface NormalMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Normal record);

	int insertSelective(Normal record);

	Normal selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Normal record);

	int updateByPrimaryKey(Normal record);

	List<NormalTable> getAll();

	List<NormalTable> searchNormalRecord(@Param("personId") String personId, @Param("personName") String personName,
			@Param("addressName") String addressName, @Param("commitTime") String commitTime, @Param("userName") String userName,
			@Param("departmentName") String departmentName);

	List<Normal> getAllNormal();
}