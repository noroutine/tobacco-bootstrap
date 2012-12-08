#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author Oleksii Khilkevych
 * @since 07.12.12
 */

@Controller
@RequestMapping("/")
public class DemoController {

    @RequestMapping(value = "/demo")
    public String home(@RequestParam(required = false) final Integer a, @RequestParam(required = false) final Integer b, Model model) {

        if (a != null && b != null) {
            model.addAttribute("a", a);
            model.addAttribute("b", b);
            model.addAttribute("result", add(a, b));
        }

        return "view.demo";
    }

    @RequestMapping(value = "/api/add", method = RequestMethod.GET)
    @ResponseBody
    public int addAjax(@RequestParam("a") int a, @RequestParam("b") int b) {
        return a + b;
    }

    @RequestMapping({"/template/{template}.dust.js", "/template/{template}.dust"})
    public String getAddTemplate(@PathVariable String template) {
        return "template." + template;
    }

    // service method
    private int add(int a, int b) {
        return a + b;
    }

}
