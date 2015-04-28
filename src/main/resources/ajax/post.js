/**
 * post page Controller
 */
$(document).ready(function() {
//	alert(new Date().toLocaleString());
	$('#post #btnpost').on("click", function() {
		alert($('#post #empno').val() + " : "+ $('#post #ename').val());
		
		$.ajax({
			type: "POST",
			url : "emp",
			data: {
				empno : $('#post #empno').val(),
				ename : $('#post #ename').val()
			},
			success : function(result, status) {
				alert(status+" : " + JSON.stringify(result));
				if (result.status==true){
					alert("emp 추가 성공");
				} else{
					alert("emp 추가 실패");
				}
			},
			error : function(xhr, status) {
				alert(status);
			}
		});

	});
	
});
