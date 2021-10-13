package com.kgc.service;

import com.kgc.pojo.Access_control_device;
import com.kgc.util.PageUtil;

public interface Access_control_deviceService {
    PageUtil<Access_control_device> getPage(Integer pageIndex, Integer pageSize, Integer hospital_id);
    int update(Integer id);
    int update2(Integer id);
    int add(Access_control_device access_control_device);
}
