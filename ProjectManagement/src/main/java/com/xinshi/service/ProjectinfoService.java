package com.xinshi.service;

import com.xinshi.entity.Pager;
import com.xinshi.entity.Projectinfo;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

public interface ProjectinfoService extends Serializable {

    Pager<Projectinfo> findFen(int pageNo, int pageSize,int status);

    int findHang(int projectinfo);

    List<Projectinfo> findAll(int id);

    int findUp( int status , int id);
}
