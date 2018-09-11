package com.xinshi.dao;

import com.xinshi.entity.Projectinfo;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

public interface ProjectinfoDao extends Serializable {

    List<Projectinfo> findFen(@Param("offset") int offset, @Param("pageSize") int pageSize,@Param("status") int status);

    int findHang(@Param("projectinfo") int projectinfo);

    List<Projectinfo> findAll(int id);

    int findUp(@Param("status") int status , @Param("id") int id);
}
