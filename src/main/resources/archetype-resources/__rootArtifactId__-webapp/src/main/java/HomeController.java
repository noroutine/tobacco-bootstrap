#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value = "/home")
	public String home(@RequestParam(required = false) final Integer a, @RequestParam(required = false) final Integer b, Model model) {
        return "view.home";
	}
}
