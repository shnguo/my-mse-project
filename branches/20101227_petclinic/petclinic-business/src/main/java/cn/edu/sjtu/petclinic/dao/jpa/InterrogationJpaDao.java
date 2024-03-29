package cn.edu.sjtu.petclinic.dao.jpa;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import cn.edu.sjtu.common.orm.Page;
import cn.edu.sjtu.common.orm.jpa.AbstractJpaDaoSupport;
import cn.edu.sjtu.common.utils.DateUtils;
import cn.edu.sjtu.petclinic.dao.InterrogationDao;
import cn.edu.sjtu.petclinic.dto.InterrogationQuery;
import cn.edu.sjtu.petclinic.entity.Interrogation;

@Repository("interrogationDao")
public class InterrogationJpaDao extends AbstractJpaDaoSupport<Interrogation, Long> implements InterrogationDao {

	@Override
	public Page<Interrogation> findInterrogations(InterrogationQuery query) {
		StringBuilder jpqlSb = new StringBuilder();
		jpqlSb.append("from Interrogation ");
		jpqlSb.append("where 1 = 1 ");
		
		Map<String, Object> values = new HashMap<String, Object>();
		if (query.getPetId() != null) {
			jpqlSb.append("and pet.id = :petId ");
			values.put("petId", query.getPetId());
		}
		if (query.getPetOwnerId() != null) {
			jpqlSb.append("and petOwner.id = :petOwnerId ");
			values.put("petOwnerId", query.getPetOwnerId());
		}
		if (query.getVeterinarianId() != null) {
			jpqlSb.append("and veterinarian.id = :veterinarianId ");
			values.put("veterinarianId", query.getVeterinarianId());
		}
		if (StringUtils.isNotBlank(query.getName())) {
			jpqlSb.append("and name like :name ");
			values.put("name", "%" + query.getName() + "%");
		}
		if (query.getStartDateFrom() != null) {
			jpqlSb.append("and startDate >= :startDateFrom ");
			values.put("startDateFrom", query.getStartDateFrom());
		}
		if (query.getStartDateTo() != null) {
			jpqlSb.append("and startDate < :startDateTo ");
			values.put("startDateTo", DateUtils.addDays(query.getStartDateTo(), 1));
		}
		if (query.getCreatedDateFrom() != null) {
			jpqlSb.append("and createdTime >= :createdDateFrom ");
			values.put("createdDateFrom", query.getCreatedDateFrom());
		}
		if (query.getCreatedDateTo() != null) {
			jpqlSb.append("and createdTime < :createdDateTo ");
			values.put("createdDateTo", DateUtils.addDays(query.getCreatedDateTo(), 1));
		}
		if (query.getStatus() != null) {
			jpqlSb.append("and status = :status ");
			values.put("status", query.getStatus());
		}
		jpqlSb.append("order by createdTime");
		return findPage(query.getPage(), jpqlSb.toString(), values);
	}

}
