package com.xinshi.controller;

import com.xinshi.entity.Pager;
import com.xinshi.entity.Projectinfo;
import com.xinshi.service.ProjectinfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ProjectinfoController {
    @Resource
    private ProjectinfoService projectinfoService;
    @RequestMapping(value = "/findAll")
    public String findAll(Integer status, Integer pageNo, Model model){
        //sssss

        if (pageNo == null || pageNo==0) {
            pageNo=1;
        }
        if(status == null){
            status=-1;
        }

        Pager<Projectinfo> projectinfo = projectinfoService.findFen(pageNo,3,status);
        model.addAttribute("projectinfo",projectinfo);
        return "index";
    }
    @RequestMapping(value = "/findTiao")
    public String findTiao(int id, Model model){
        List<Projectinfo> projectinfoList = projectinfoService.findAll(id) ;
        model.addAttribute("projectinfoList",projectinfoList);
        return "view";
    }

    @RequestMapping(value = "/findUp")
    public String findUp(int status,int id){
        projectinfoService.findUp(status,id);
        return "redirect:/findAll";
    }
}
