$(function(){
	const num = $("input[name='num']").val().trim();
	
	loadComment(num);
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























