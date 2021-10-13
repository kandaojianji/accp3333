package com.kgc.controller;
import com.kgc.pojo.Access_control_device;
import com.kgc.pojo.Buiding;
import com.kgc.service.impl.Access_control_deviceServiceImpl;
import com.kgc.service.impl.BuidingServiceImpl;
import com.kgc.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
     //薛尊恒
@Controller
public class Access_control_deviceController {
    @Resource
    Access_control_deviceServiceImpl access_control_deviceService;
    @Resource
    BuidingServiceImpl buidingService;
    @RequestMapping(value = "/show",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Map<String,Object> getAllShow(@RequestParam(value = "pageIndex",defaultValue = "1",required = false)Integer pageIndex, @RequestParam(value = "hospital_id",required = false)Integer hospital_id){
        Map<String,Object> map=new HashMap<>();
        PageUtil<Access_control_device> page = access_control_deviceService.getPage(pageIndex, 2, hospital_id);
        List<Buiding> list = buidingService.getAllForList();
        map.put("page",page);
        map.put("list",list);
        return map;
    }
    @RequestMapping(value = "/show2",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Buiding> getList(){
        return buidingService.getAllForList();
    }

    @RequestMapping("/show")
    public String getShow(Model model, @RequestParam(value = "pageIndex",defaultValue = "1",required = false)Integer pageIndex, @RequestParam(value = "hospital_id",required = false)Integer hospital_id){
        PageUtil<Access_control_device> page = access_control_deviceService.getPage(pageIndex, 2, hospital_id);
        model.addAttribute("page",page);
        return "index";
    }

    @RequestMapping("/update/{id}")
    public String update(@PathVariable("id")Integer id){
        int result = access_control_deviceService.update(id);
        if(result==0){
            return "redirect:/show";
        }else{
            return "redirect:/show";
        }
    }
    @RequestMapping("/update2/{id}")
    public String update2(@PathVariable("id")Integer id){
        int result = access_control_deviceService.update(id);
        if(result==1){
            return "redirect:/show";
        }else{
            return "redirect:/show";
        }
    }
    @RequestMapping("/toadd")
    public String toadd(Model model){
        List<Buiding> list = buidingService.getAllForList();
        model.addAttribute("list",list);
        return "add";
    }
    @RequestMapping("/add")
    public String add(Access_control_device access_control_device){
        int result = access_control_deviceService.add(access_control_device);
        if(result>0){
            return "redirect:/show";
        }else{
            return "redirect:/show";
        }
    }
}
