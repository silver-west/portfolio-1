$("document").ready(function() {
        //bootStrap
		$("form").addClass("mt-3 w-100");
		$("textarea").addClass("form-control w-100");
		$(".miniheader").css("margin", "0");
		$("#formSt td").addClass("m-2 p-2");
		$(".noneLine").css("border-bottom", "none");
		$("#sumitBtn").addClass("btn myBtn");

        //check
        $("input[name='title'], textarea[name='content']").on("input", function() {
			$("#nullMent").html("");
		})
        
        $("#sumitBtn").click(function(e) {
            e.preventDefault();

            if (formCheck()) {
                $("form").submit();
            }
        });
	});

    function nullCheck(obj) {
        if (obj.val()) {
            return true;
        } else {
            return false;
        }
    }

    function formCheck() {
        let $title = $("input[name='title']");
        let $content = $("textarea[name='content']");
        let $p = $("#nullMent");
        
        if (nullCheck($title)) {
            
            if (nullCheck($content)) {
                return true;
            } else {
                $p.addClass("text-danger text-center");
                $content.focus();
                $p.text("내용을 입력하세요");

                return false;
            }

        } else {
            $p.addClass("text-danger text-center");
            $title.focus();
            $p.text("제목을 입력하세요");

            return false;
        }
    }