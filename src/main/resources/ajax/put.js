
$(document).ready(function() {
//	alert(new Date().toLocaleString());
	$('#put #btnput').on('click', function() {
		alert($('#put #empno').val()+ ", " + $('#put #ename').val());
		
		var options={
				type : "PUT",
				url : "emp/" + $('#put #empno').val(),
				data : JSON.stringify({
					empno : $('#put #empno').val(),
					ename : $('#put #ename').val()
				}),
				dataType : "application/json",
				success : function(result, status) {
					alert(JSON.stringify(result) + " : " + status );
					if (result.status==true){
						alert("성공");
					} else {
						alert("실패" + result.statusText);
					}
				},
				error : function(xhr, status) {
					alert(xhr.responseText + " : " + status );
				},
//				모두 완료되고 마지막에 호출
				complete : function(xhr, status) {fi
					alert( "complete : " + status );
				}
		};
		
		$.ajax(options);
	});
	
});
