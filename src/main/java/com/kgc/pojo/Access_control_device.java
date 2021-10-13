package com.kgc.pojo;

import lombok.Data;

@Data
public class Access_control_device {
    private Integer id;
    private String principal;
    private String supplier;
    private String brand;
    private Integer hospital_id;
    private Integer staus;
    private String add_time;
    private String budName;
}
