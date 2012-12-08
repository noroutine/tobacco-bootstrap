/**
 * @author Oleksii Khilkevych
 * @since 02.12.12
 */

(function ($) {

    function add(a, b, callback) {
        $.ajax({
            type: 'get',
            url: '/todo/api/add',
            data: {a: a,b: b},
            success: callback
        })
    }

    $(document).on('ready', function() {

        // setup dust.js demo
        dust.render("template/dustjs_demo",
            {
                a: 2,
                b: 2
            },
            function(err, out) {
                $("#dustjs_demo").append(out);

                $("#dustjs_demo button").on('click', function() {
                    var a = $("#dustjs_demo input[name=a]").val();
                    var b = $("#dustjs_demo input[name=b]").val();

                    add(a, b, function(result) {
                        $("#dustjs_demo p").html(a + ' + ' + b + ' = ' + result);
                    })
                })
            });

        // setup ajax demo
        $("#ajax_demo button").on('click', function() {
            var a = $("#ajax_demo input[name=a]").val();
            var b = $("#ajax_demo input[name=b]").val();

            add(a, b, function(result) {
                $("#ajax_demo p").html(a + ' + ' + b + ' = ' + result);
            })
        })

    })
})(jQuery);