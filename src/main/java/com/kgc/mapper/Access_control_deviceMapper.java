package com.kgc.mapper;

import com.kgc.pojo.Access_control_device;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface Access_control_deviceMapper {
    List<Access_control_device> getAll(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize, @Param("hospital_id") Integer hospital_id);
    Integer getCount(@Param("hospital_id") Integer hospital_id);
    int update(Integer id);
    int update2(Integer id);
    int add(Access_control_device access_control_device);

}
