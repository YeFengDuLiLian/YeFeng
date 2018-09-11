package com.xinshi.service.impl;

import com.xinshi.dao.ProjectinfoDao;
import com.xinshi.entity.Pager;
import com.xinshi.entity.Projectinfo;
import com.xinshi.service.ProjectinfoService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectinfoServiceImpl implements ProjectinfoService {
    @Resource
    private ProjectinfoDao projectinfoDao;

    public Pager<Projectinfo> findFen(int pageNo, int pageSize, int status) {
        Pager<Projectinfo> pager =new Pager<Projectinfo>();
        pager.setPageNo(pageNo);
        pager.setPageSize(pageSize);
        pager.setTotalRows(projectinfoDao.findHang(status));
        pager.setTotalPage((pager.getTotalRows()+pageSize-1)/pageSize );
        pager.setDatas(projectinfoDao.findFen((pageNo-1)*pageSize,pageSize,status));
        return  pager;
    }

    public int findHang(int projectinfo) {
        return projectinfoDao.findHang(projectinfo);
    }

    public List<Projectinfo> findAll(int id) {
        return projectinfoDao.findAll(id);
    }

    public int findUp(int status, int id) {
        return projectinfoDao.findUp(status,id);
    }
}
