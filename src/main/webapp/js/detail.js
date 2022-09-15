$(function(){
	const num = $("input[name='qna_num']").val().trim();
	
	loadComment(num);
	
	$("#btn_comment").click(function(){
		const content = $("input_comment").val().trim();
		
		if(!content){
			alert("댓글을 입력하세요.");
			return;
		}
		
		const data = {
			"qna_num" : qna_num,
			"user_num" : user_num,
			"qna_content" : qna_content,
		};
		
		$.ajax({
			url: conPath + "/comment/write",
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
		url: conPath + "/comment/list?num=" + qna_num,
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
        let regdate = comment.qc_regdate;

        let user_num = parseInt(comment.user_num.user_num);
        let user_id = comment.user_num.user_id;
        let user_name = comment.user_num.user_name;
        
        const delBtn = (logged_id !== user_num) ? '' : `
                <i class="btn fa-solid fa-delete-left text-danger" data-bs-toggle="tooltip"
                    data-cmtdel-id="${qc_num}" title="삭제"></i>
            `;
            
        const row = `
	        <tr>
	        <td><span><strong>${user_name}</strong><br><small class="text-secondary">(${user_name})</small></span></td>
	        <td>
	            <span>${qc_content}</span>${delBtn}            
	        </td>
	        <td><span><small class="text-secondary">${qc_regdate}</small></span></td>
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
			url: conPath + "/comment/delete",
			type: "POST",
			cache: false,
			data: {"id": comment_num},
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