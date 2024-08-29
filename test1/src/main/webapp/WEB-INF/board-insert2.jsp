<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
<body>
	<div id="app">
		<div>
			제목 : <input type="text" placeholder="제목" v-model="title">
		</div>
		<br>
		<div>
			내용 : <textarea cols="30" rows="5" v-model="contents"></textarea>
		</div>
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
				contents : ""
            };
        },
        methods: {
            // fnSave 생성 후 board-add.dox 호출해서 저장
			fnSave(){
				var self = this;
				var nparam = {title : self.title, contents : self.contents};
				$.ajax({
					url:"board-add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						alert(data.message);
						if(data.result == "success"){
							location.href = "board-list.do"
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
	        app.contents = quill.root.innerHTML;
        });
        }
    });
    app.mount('#app');
</script>