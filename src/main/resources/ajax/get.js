//ajax example
//get page
$(document).ready(function() {
		$('section[id=get] button:first').on('click', function() {
// 			alert("fdsfsfsdfdsa");
			var xhr = new XMLHttpRequest();
			
// 			xhr.open("GET","get?xx=1"+new Date(), false);
			xhr.open("GET","emp", false);
			xhr.setRequestHeader("Accept", "application/json");
			xhr.send();
			var emps = JSON.parse(xhr.responseText);
			var msgs = "";
			for(var i =0;i<emps.length;i++){
				var msg = "empno=" + emps[i].empno + "<br>"
						+ "ename=" + emps[i].ename + "<br>"
						+ "hiredate=" + new Date(emps[i].hiredate).toLocaleString()+"<br>";
				msgs += msg;
//				alert(msg);
			}
// 			result.innerHTML=xhr.responseText;
//			alert(xhr.responseText);
			$('section[id=get] div[id=result]').html(msgs);
		});
		
		$('section[id=get] button').eq(1).on('click', function() {
// 			alert(new Date().getTime());
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function() {
			if(xhr.readyState==4){
				if(xhr.status>=200 && xhr.status<=300){
					alert("성공 : " + xhr.status+" : " + xhr.statusText);
					$('section[id=get] div[id=result]').html('<p>'+ xhr.responseText+'</p>');
				}
				else{
					alert("에러 : " + xhr.status + " : " + xhr.statusText);
				}
			}
			};
			xhr.open("GET", "emp?_=" +new Date().getTime());
			xhr.setRequestHeader("Accept", "application/json");
			xhr.send();
		});
		
		$('#getbtn3').on("click", function() {
			//JSON (javascript object notation)
			var empno = $('#get #empno').val();
			alert(empno);
			
			$.ajax({
				type: "GET", 
				url: "emp/"+empno,
				success : function(emp, status, xhr) {
					alert(this.url + " : " + JSON.stringify(emp));
					var msg = "empno = " + emp.empno + "<br>" + 
							  "ename = " + emp.ename + "<br>" + 
							  "hiredate = " + new Date(emp.hiredate).toLocaleString(); 
					$('#get #result').html(msg);
				},
				error: function(xhr, status, error) {
					alert(status);
				}
			});
		});
	});