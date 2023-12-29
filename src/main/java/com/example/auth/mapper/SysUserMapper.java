package com.example.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.auth.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author kezhijie@wuhandsj.com
 * @date 2023/12/29 16:58
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
}
