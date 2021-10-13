package com.kgc.service.impl;

import com.kgc.mapper.Access_control_deviceMapper;
import com.kgc.pojo.Access_control_device;
import com.kgc.service.Access_control_deviceService;
import com.kgc.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class Access_control_deviceServiceImpl implements Access_control_deviceService {
    @Resource
    Access_control_deviceMapper access_control_deviceMapper;
    @Override
    public PageUtil<Access_control_device> getPage(Integer pageIndex, Integer pageSize, Integer hospital_id) {
        PageUtil<Access_control_device> pageUtil=new PageUtil<>();
        pageUtil.setPageSize(pageSize);
        pageUtil.setTotalCount(access_control_deviceMapper.getCount(hospital_id));
        pageUtil.setList(access_control_deviceMapper.getAll((pageIndex-1)*pageSize,pageSize,hospital_id));
        pageUtil.setPageIndex(pageIndex);
        return pageUtil;
    }

    @Override
    public int update(Integer id) {
        return access_control_deviceMapper.update(id);
    }

    @Override
    public int update2(Integer id) {
        return access_control_deviceMapper.update2(id);
    }

    @Override
    public int add(Access_control_device access_control_device) {
        return access_control_deviceMapper.add(access_control_device);
    }
}
