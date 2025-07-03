$("document").ready(function() {
        //bootStrap
		$("form").addClass("mt-3 w-100");
		$("textarea").addClass("form-control w-100");
		$(".miniheader").css("margin", "0");
        $("#formSt td").addClass("m-2 p-2");
		$(".noneLine").css("border-bottom", "none");
        $("#sumitBtn").addClass("btn myBtn");
        $("##nullMent").addClass("text-danger");

        //check
        $("#sumitBtn").click(function(e) {
            e.preventDefault();

            if (formCheck()) {
                $("form").submit();
            } else {
                return;
            }
        });
	});

    function nullCheck() {
        if ($(this).val() || $(this).val() == "") {
            return true;
        } else {
            return false;
        }
    }

    function formCheck() {
        let $editSubject = $("input[name='editSubject']");
        let $editContent = $("textarea[name='editContent']");
        let $p = $("#nullMent");
        
        if ($editSubject.nullCheck()) {
            $p.text("제목을 입력하세요");
            $editSubject.focus();
            return false;  
        }

        if ($editContent.nullCheck()) {
            $p.text("내용을 입력하세요");
            $editContent.focus();
            return false;  
        }

        return true;
    }