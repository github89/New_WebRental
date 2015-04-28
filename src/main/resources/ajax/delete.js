/**
 * delete page Controller
 */
$(document).ready(function() {
//	alert(new Date().toLocaleString());
	$('#delete #btndelete').on('click', function() {
		alert($('#delete #empno').val());
		
		var options={
				type : "DELETE",
				url : "emp/" + $('#delete #empno').val(),
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
				complete : function(xhr, status) {
					alert( "complete : " + status );
				}
		};
		
		$.ajax(options);
	});
	
});
