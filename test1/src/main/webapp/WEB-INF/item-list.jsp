<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table{
		margin : 10px;
	}
	table, tr, th, td{
		padding : 10px;
		border : 1px solid black;
		border-collapse : collapse;
		text-align : center;
	}
</style>
<body>
	<div id="app">
		<div style="margin: 10px;">   
            <label v-for="item in codeList" >
                <input type="checkbox" v-model="selectItem" :value="item.code" @change="fnGetList">{{item.codeName}}
            </label>
        </div>
		<table>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.itemNo}}</td>
				<td>{{item.itemName}}</td>
				<td>{{item.price}}</td>
				<td>{{item.codeName}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                codeList : [],
				list : [],
                selectItem : []
            };
        },
        methods: {
            fnCodeList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"code-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.codeList = data.codeList;
					}
				});
            },

            fnGetList(){
				var self = this;
				var nparmap = {};
                if(self.selectItem.length > 0){
					var fList = JSON.stringify(self.selectItem);
					nparmap = {selectItem : fList};
				}
				$.ajax({
					url:"item-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            }
        },
        mounted() {
            var self = this;
            self.fnCodeList();
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>