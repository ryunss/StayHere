$(function(){
	const num = $("input[name='num']").val().trim();
	
	loadComment(num);
	
	$("#btn_comment").click(function(){
		const content = $("#input_comment").val().trim();
		
		if(!content){
			alert("댓글을 입력하세요");
			return;
		}
		
		const data = {
			"room_num": num,
			"user_num": logged_id,
			"rc_content": content,
		};
		
		$.ajax({
			url: conPath + "/room/comment/write",
			type: "POST",
			data: data,
			cache: false,
			success : function(data, stauts, xhr){
				if(status == "success"){
					if(data.status !== "OK"){
						alert(data.status);
						return;
					}
				}
				
				loadComment(num);
				$("#input_comment").val('');
			}
		});
	});
});

function loadComment(room_num){
	$.ajax({
		url: conPath + "/room/comment/list?num=" + room_num,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status !== "OK"){
					alert(data.status);
					return;
				}
				
				buildComment(data); // 댓글 목록
				addDelete();
			}
		},
	});
}

function buildComment(result){
	$("#cmt_cnt").text(result.count);
	
	const out = [];
	
	result.data.forEach(comment => {
		let num = comment.rc_num;
		let content = comment.rc_content.trim();
		let regdate = comment.regdate;
		
		let user_num = parseInt(comment.user.user_num);
		let id = comment.user.user_id;
		let name = comment.user.user_name;
		
		// 삭제 버튼 여부
		const delBtn = (logged_id !== user_num) ? '' : `
                <i class="btn fa-solid fa-delete-left text-danger" data-bs-toggle="tooltip"
                    data-cmtdel-id="${num}" title="삭제"></i>
            `;
		const row = `
	        <tr>
	        <td><span><strong>${id}</strong><br><small class="text-secondary">(${name})</small></span></td>
	        <td>
	            <span>${content}</span>${delBtn}            
	        </td>
	        <td><span><small class="text-secondary">${regdate}</small></span></td>
	        </tr>      
	        `;
	    out.push(row);
	});
	
	$("#cmt_list").html(out.join("\n"));
}

function addDelete(){
	// 현재 글의 id
	const num = $("input[name='num']").val().trim();
	
	$("[data-cmtdel-id]").click(function(){
		if(!confirm("댓글을 삭제하시겟습니까?")) return;
		
		// 삭제할 댓글의 id
		const comment_num = $(this).attr("data-cmtdel-id");
		
		$.ajax({
			url: conPath + "/room/comment/delete",
			type: "POST",
			cache: false,
			data: {"num": comment_num},
			success: function(data, status){
				if(status == "success"){
					if(data.status !== "OK"){
						alert(data.status);
						return;
					}
					
					// 삭제후에는 다시 목록을 불러와야 한다
					loadComment(num);
				}
			},
		});
	});
}





















