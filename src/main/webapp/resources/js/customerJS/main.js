// 3-3.1

const toggleBtn = document.querySelector('.navbar_toggleBtn');
// 문서 중에서 쿼리인 .navbar_toggleBtn를 찾아서 const toggleBtn에 저장
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');

//=>는 에러 function 혹은 익명함수라고 불린다.

// addEventListener API를 통해 클릭이 될 때마다 지정한 함수를 호출
// 햄버거 버튼이 클릭되면 menu, icon을 활성화시킨다.
toggleBtn.addEventListener('click', () => {
/*	alert('굳');*/
	menu.classList.toggle('active');
	icons.classList.toggle('active');
	
});