package com.hand.yq.service.serviceimpl;

import com.hand.yq.bean.City;
import com.hand.yq.dao.CityMapper;
import com.hand.yq.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {


    @Autowired
    private CityMapper cityMapper;

    @Override
    public int addCity(City city) {
        return cityMapper.insert(city);
    }

    @Override
    public List allCity() {
        return cityMapper.selectAll();
    }

    @Override
    public int deleteCity(int id) {
        return cityMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateCity(City city) {
        return cityMapper.updateByPrimaryKeySelective(city);
    }

    @Override
    public City selectCityById(int id) {
        return cityMapper.selectByPrimaryKey(id);
    }


}
