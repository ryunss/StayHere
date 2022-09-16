$(function(){
	const num = $("input[name='room_num']").val().trim();
	
	loadComment(num);
});

function loadComment(num){
	$.ajax({
		url: conPath + "/room/comment/list?num=" + num,
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
	$("#cmt_cnt").text(result.count);   // 댓글 총 개수
	
	const out = [];
	
	result.data.forEach(comment => {
        let rc_num = comment.rc_num;
        let rc_content = comment.rc_content.trim();
        let regDate = comment.regDate;

        let user_num = parseInt(comment.user_num);
        let user_id = comment.user_id;
        let user_name = comment.user_name;
        
        const delBtn = (logged_id !== user_num) ? '' : `
                <i class="btn fa-solid fa-delete-left text-danger" data-bs-toggle="tooltip"
                    data-cmtdel-id="${rc_num}" title="삭제"></i>
            `;
            
        const row = `
	        <tr>
	        <td><span><strong>${user_id}</strong><br><small class="text-secondary">(${user_name})</small></span></td>
	        <td>
	            <span>${rc_content}</span>${delBtn}            
	        </td>
	        <td><span><small class="text-secondary">${regDate}</small></span></td>
	        </tr>      
	        `;
		out.push(row);		
	});
	
	$("#cmt_list").html(out.join("\n"));
}

function addDelete(){
	const num = $("input[name='room_num']").val().trim();
	
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