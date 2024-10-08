<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Quill CDN -->
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table {
		margin : 20px;
	}
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
	#editor{
		height : 300px;
	}
	
	#title{
		width : 500px;
	}
</style>
<body>
	
	<div id="app">
		<table>
			<tr>
				<th>제목</th>
				<td> <input id="title" type="text" placeholder="제목" v-model="title"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input id="file" type="file" @change="fnFileChange"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div id="editor"></div></td>
			</tr>
		</table>
		<button @click="fnSave">저장</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				title : "",
				contents : "",
				sessionId : '${sessionId}',
				file : null
            };
        },
        methods: {
			fnFileChange(event) {
				this.file = event.target.files[0];	//1개일떄 0번째 
			},
            // fnSave 생성 후 board-add.dox 호출해서 저장
			fnSave(){
				var self = this;
				var nparam = {
					title : self.title,
					contents : self.contents,
					userId : self.sessionId
				};
				$.ajax({
					url:"board-add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						var idx = data.idx;
						console.log(idx);
						//파일등록
						if (self.file) {	//file이라는 값이 있을때만 실행
							const formData = new FormData();
							formData.append('file1', self.file);
							formData.append('idx', idx);
							console.log(idx);

						$.ajax({
							url: '/fileUpload.dox',
							type: 'POST',
							data: formData,
							processData: false,  
							contentType: false,  
							success: function() {
								console.log('업로드 성공!');
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.error('업로드 실패!', textStatus, errorThrown);
							}
						});
			}
		}
	});
}
        },
        mounted() {
            var self = this;
			// Quill 에디터 초기화
	        var quill = new Quill('#editor', {
	            theme: 'snow',
	            modules: {
	                toolbar: [
	                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                    ['bold', 'italic', 'underline'],
	                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	                    ['link', 'image'],
	                    ['clean']
	                ]
	            }
	        });

	        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
	        quill.on('text-change', function() {
	        self.contents = quill.root.innerHTML;
        });
        }
    });
    app.mount('#app');
</script>