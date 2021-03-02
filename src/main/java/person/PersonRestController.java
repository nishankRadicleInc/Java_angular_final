package person;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class PersonRestController {

    @Autowired
    private CustomerRepository repo;

    @RequestMapping(value = "/r", method = RequestMethod.GET)
    public ModelAndView hello() {
        return new ModelAndView("angular.html");
    }

    @CrossOrigin
    @RequestMapping(value = "/r/getAll", method = RequestMethod.GET)
    public List<Person> getAll() {
        return repo.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/r/getOne/{id}", method = RequestMethod.GET)
    public Person getOne(@PathVariable Integer id) {
        return repo.findOne(id);
    }

    @RequestMapping(value = "/r/add", method = RequestMethod.POST)
    public boolean additem(@RequestBody Person p) {
        return (repo.saveAndFlush(p) != null);
    }

    @RequestMapping(value = "/r/update", method = RequestMethod.POST)
    public boolean update(@RequestBody Person p) {
        return (p.getName() != null && p.getAge() != 0 && p.getId() != 0 && repo.saveAndFlush(p) != null);
    }

    @RequestMapping(value = "/r/delete/{id}", method = RequestMethod.GET)
    public boolean delete(@PathVariable Integer id) {
        repo.delete(id);
        return !repo.exists(id);
    }
}