package com.hand.yq.service;

import com.hand.yq.bean.City;

import java.util.List;

public interface CityService {
    int addCity(City city);

    List allCity();

    int deleteCity(int id);

    int updateCity(City city);

    City selectCityById(int id);
}
