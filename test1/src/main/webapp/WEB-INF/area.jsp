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
	table {
		margin : 20px;
	}
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
	.pagination {
	    justify-content: center;
	    align-items: center;
	    margin: 20px 0;
	}
	.pagination button {
	    background-color: #f8f9fa;
	    border: 1px solid #dee2e6;
	    color: #007bff;
	    padding: 8px 12px;
	    margin: 0 2px;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	    border-radius: 4px;
	}

	.pagination button:hover {
	    background-color: #007bff;
	    color: white;
	}

	.pagination button.active {
	    background-color: #007bff;
	    color: white;
	    cursor: default;
	}

	.pagination button:disabled {
	    background-color: #e9ecef;
	    color: #6c757d;
	    cursor: not-allowed;
	    border: 1px solid #dee2e6;
	}

	.pagination button:not(.active):not(:disabled):hover {
	    background-color: #0056b3;
	    color: white;
	}
</style>
<body>
	<div id="app">
		
		<div style="margin : 20px;"> 
			도/시<select style="margin-right : 5px;" v-model="si" @change="fnArea()">
				<option value="">:: 선택 ::</option>
				<option v-for="item in siList" :value="item.si">{{item.si}}</option>
			</select>
            구/군<select style="margin-right : 5px;" v-model="gu" @change="fnArea()">
				<option value="">:: 선택 ::</option>
                <option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
			</select>
			동<select style="margin-right : 5px;" v-model="dong" @change="fnArea()">
				<option value="">:: 선택 ::</option>
                <option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
			</select>
			
		</div> 
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                si : "",
                siList : [],
                gu : "",
                guList : [],
				dong : "",
				dongList :[]
                
               
			
				
            };
        },
        methods: {
            fnArea(){
				var self = this;
                if(self.si == "" || self.gu == ""){	//gu까지 선택하고 si를 다시 바꿨을때 gu가 초기화 된다.
					self.dongList = [];  
                }else if(self.si == ""){
					self.guList = [];
				}
				
				var nparmap = {si : self.si,
								gu : self.gu,
								dong : self.dong
				};
				$.ajax({
					url:"area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(self.si != "" && self.gu != ""){
                            self.dongList = data.list;
                        }else if(self.si != ""){
                            self.guList = data.list;
                        }else{
                            self.siList = data.list;
                        }
                        
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnArea();
			
        }
    });
    app.mount('#app');
</script>