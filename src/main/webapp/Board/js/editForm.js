$("document").ready(function() {
        //bootStrap
		$("form").addClass("mt-3 w-100");
		$("textarea").addClass("form-control w-100");
		$(".miniheader").css("margin", "0");
        $("#formSt td").addClass("m-2 p-2");
		$(".noneLine").css("border-bottom", "none");
        $("#submitBtn").addClass("btn myBtn");
        $("#nullMent").addClass("text-danger");

        //check
        $("input[name='editSubject'], textarea[name='editContent']").on("input", function(){
			$("#nullMent").text("");
		});
		
        $("#submitBtn").click(function(e) {
            e.preventDefault();

            if (formCheck()) {
                $("form").submit();
            } else {
                return;
            }
        });
        
	    function nullCheck($target) {
	        if (!$target.val() || $target.val() == "") {
	            return true;
	        } else {
	            return false;
	        }
	    }
	
	    function formCheck() {
	        let $editSubject = $("input[name='editSubject']");
	        let $editContent = $("textarea[name='editContent']");
	        let $p = $("#nullMent");
	        
	        if (nullCheck($editSubject)) {
	            $p.text("제목을 입력하세요");
	            $editSubject.focus();
	            return false;  
	        }
	
	        if (nullCheck($editContent)) {
	            $p.text("내용을 입력하세요");
	            $editContent.focus();
	            return false;  
	        }
	
	        return true;
	    }
	});
