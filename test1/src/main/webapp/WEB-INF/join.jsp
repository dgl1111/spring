<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
        <div>
            아이디  <input type="text" v-model="userId" placeholder="영어+숫자+5글자 이상">
            <button v-model="chUserId" @click="fnUserId">중복체크</button>
        </div>
        <div>
            비밀번호 <input type="text" v-model="pwd" placeholder="영어+숫자+특수문자 포함 + 8글자 이상">
        </div>
        <div>
            비밀번호 확인 <input type="text" v-model="chPwd">
        </div>
        <div>
            핸드폰번호 <input type="text" v-model="phone">
        </div>
        <div>
            <button @click="fnSignUp">등록</button>
        </div>
        <div>
            주소 <input type="text">
            <button @click="fnSearchAddr">검색</button>
        </div>
        
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                roadFullAddr : "",
                roadAddrPart1 : "",
                addrDetail : "",
                userId : "",
                pwd : "",
                chPwd : "",
                phone : "",
                list : []
				
            };
        },
        methods: {

            validate(){
                var self = this;

                const idText  =/^[a-zA-Z0-9]{5,}$/
                const pwdText = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
                const phoneText = /^\d{3}-\d{3,4}-\d{4}$/;

                if(self.userId ==''){//value가 입력한 값을 의미한다
                    alert('아이디를 입력하세요');
                    return false;
                }

                if(!idText.test(self.userId)){
                    alert('아이디는 영어+숫자+5글자 이상');
                    return false;
                }

                if(self.pwd ==''){
                    alert('비밀번호를 입력하세요');
                    return false;
                }

                if(!pwdText.test(self.pwd)){
                    alert('영어+숫자+특수문자 포함 + 8글자 이상');
                    return false;
                }
                if(self.pwd != self.chPwd){
                    alert('비밀번호가 동일한지 확인하세요')
                    return false;
                }

                if(!phoneText.test(self.phone)){
                    alert('전화번호 형식을 확인하세요')
                    return false;
                }

            },
            fnUserId(){
                var self = this;
                var nparmap = {};
                if(self.userId == list.userId){
                    alert('중복된 아이디');
                    return false;
                }
				$.ajax({
					url:"join.dox", // controller로 url:"ok.dox"호출
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { // 결과가 데이터로 담긴다
						console.log(data);
						self.list = data.list;
					}
				});
            },
            fnSearchAddr(){
                var self = this;
                var option = "width = 500, height = 500, top = 100, left = 200, location = no";
                window.open("jusoPopup.do", "addr", option);
            },

            fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                var self = this;
                self.roadFullAddr = roadFullAddr; //<- 위에 넣은 값
                self.roadAddrPart1 = roadAddrPart1;
                self.addrDetail = addrDetail;
                // 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
                console.log(roadFullAddr);
                console.log(roadAddrPart1);
                console.log(addrDetail);
                
            },
            fnSignUp(){
                var self = this;
                self.validate();
            }
        },
        mounted() {
            var self = this;
	        window.vueAppInstance = this;
        },

    });
    app.mount('#app');

   
    



    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
	if (window.vueAppInstance) {
		window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
	} else {
		console.error("Vue app instance is not available.");
	}
}
</script>