// //함수로 넘어가서 cate 번호 뽑아오기
// let cateNo = get_info_from_url("cateNo");
//
// //안에 cate이름 바꿔주고 처음 6개 실행
// $('.contents h2').text(`${PAGENAME_ARR[cateNo]}`);
// load_item(cateNo , 4);

//li transform하는 함수
function li_move() {
    let li_b = $('.item_li').offset().top + $('.item_li').height();
    let d_t = $(window).scrollTop() + $(window).height();
    
    if (d_t > li_b) {
        $('.img_box').addClass('img_box_active');
    } else {
        $('.img_box').removeClass('img_box_active');
    }
}
li_move();

//처음 li갯수에 맞춰서 배열 넣어주기 (하트)
let chk2 = new Array(0) ;
function heart_chk(ttt) {
    for(let i=0; i<ttt; i++) {
        // chk2[i]=true;
        chk2.push(true)
    }
}
heart_chk($('.item_li').length);


// 스크롤이벤트
$(window).scroll(function(){
    //푸터에 닿으면 4개씩
    let f_t = $('.footer').offset().top;
    let d_t = $(window).scrollTop() + $(window).height();
    if(d_t >= f_t + 200) {
        load_item(cateNo, 2);
        heart_chk(4) //하트 배열도 추가
    }

    //새로 생기는 li함수 transform
    li_move();

});

// 하트 체크 + 클릭
$(document).on('mouseenter','.heart_2',function(){
    $(this).css({opacity: 1});
    
});
$(document).on('mouseleave','.heart_2',function(){
    if(chk2[$(this).parents('.item_li').index()])
        $(this).css({opacity: 0});
    
});

$(document).on('click','.heart_2', function(){
    if(!chk2[$(this).parents('.item_li').index()]) {
        $(this).css({opacity: 0});
    }
    else if(chk2[$(this).parents('.item_li').index()]) {
        $(this).css({opacity: 1});
    }
    chk2[$(this).parents('.item_li').index()] = !chk2[$(this).parents('.item_li').index()];
    
});


