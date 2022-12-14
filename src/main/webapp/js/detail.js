$(function(){
	const num = $("input[name='qna_num']").val().trim();
	
	loadComment(num);
	
	$("#btn_comment").click(function(){
		const content = $("#input_comment").val().trim();
		
		if(!content){
			alert("댓글을 입력하세요.");
			return;
		}
		
		const data = {
			"qna_num" : num,
			"user_num" : logged_num,
			"qc_content" : content,
		};
		
		$.ajax({
			url: conPath + "/qcomment/write",
			type: "POST",
			data: data,
			cache: false,
			success: function(data, status, xhr){
				if(data.status !== "OK"){
					alert(data.status);
					return;
				}
				loadComment(num);
				$("#input_comment").val('');
			}
		});
	});
});

function loadComment(qna_num) {
	$.ajax({
		url: conPath + "/qcomment/list?num=" + qna_num,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				// 서버측 에러 메세지 있는 경우
				if(data.status !== "OK"){
					alert(data.status);
					return;
				}
				buildComment(data);
				addDelete();
			}
		},
	});
}

function buildComment(result){
	$("#cmt_cnt").text(result.count);   // 댓글 총 개수
	
	const out = [];
	
	result.data.forEach(comment => {
        let qc_num = comment.qc_num;
        let qc_content = comment.qc_content.trim();
        let regdate = comment.regdate;

        let user_num = parseInt(comment.user.user_num);
        let id = comment.user.user_id;
        let name = comment.user.user_name;
        
        const delBtn = (logged_num !== user_num) ? '' : `
                <i class="btn fa-solid fa-delete-left text-danger" data-bs-toggle="tooltip"
                    data-cmtdel-id="${qc_num}" title="삭제"></i>
            `;
            
        const row = `
	        <tr>
	        <td><span><strong>${id}</strong><br><small class="text-secondary">(${name})</small></span></td>
	        <td>
	            <span>${qc_content}</span>${delBtn}            
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
	const num = $("input[name='qna_num']").val().trim();
	
	$("[data-cmtdel-id]").click(function(){
		if(!confirm("댓글을 삭제하시겟습니까?")) return;
		
		// 삭제할 댓글의 id
		const comment_num = $(this).attr("data-cmtdel-id");
		
		$.ajax({
			url: conPath + "/qcomment/delete",
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
