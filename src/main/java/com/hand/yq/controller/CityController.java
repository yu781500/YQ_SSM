package com.hand.yq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hand.yq.bean.City;
import com.hand.yq.service.CityService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.event.MailEvent;
import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {

    @Autowired
    private CityService cityService;

/*    @RequestMapping("/allCity")
    public String list(Model model) {
        List cities = cityService.allCity();
        model.addAttribute("list", cities);
        return "allCity";
    }*/

//    分页处理
    @RequestMapping("/allCity")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model) {
        PageHelper.startPage(pageNum, 10);

        List cities = cityService.allCity();

        PageInfo page = new PageInfo(cities, 9);
        List list = page.getList();
        System.out.println(list);
        model.addAttribute("list", cities);
        model.addAttribute("page", page);
        return "allCity";
    }

    @RequestMapping("toInsertCity")
    public String toInsertCity() {
        return "insertCity";
    }

    @RequestMapping("/insertCity")
    public String insertCity(City city) {
        cityService.addCity(city);
        return "redirect:/city/allCity";
    }

    @RequestMapping("/delete/{id}")
    public String deleteCityById(@PathVariable("id") int id) {
        cityService.deleteCity(id);
        return "redirect:/city/allCity";
    }

    @RequestMapping("toUpdateCity")
    public String toUpdateCity(Model model, int id) {
        model.addAttribute("city", cityService.selectCityById(id));
        return "updateCity";
    }

    @RequestMapping("updateCity")
    public String UpdateCity(Model model, City city) {
        cityService.updateCity(city);
        city = cityService.selectCityById(city.getId());
        model.addAttribute("city", city);
        return "redirect:/city/allCity";
    }
}
