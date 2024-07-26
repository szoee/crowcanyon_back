 ///////////헤더 메뉴판
 let timeout;
 $('.menu_li').hover(function() {
     clearTimeout(timeout); 
     $('.pan').stop().fadeOut(300);
     $('.pan').eq($(this).index()).stop().fadeIn(300); 

 }, function() {
     timeout = setTimeout(function() {
         $('.pan').fadeOut(300);
     }, 300);
 });
 
    ////////////탑배너 
    $('.tb').eq(0).css({
        top: 0
    })

    function auto (){
        let bang = 0;
        let interval = setInterval(function(){
            let tb_length = $('.tb').length;
            $('.tb').eq(bang % tb_length).animate({
                top: '-100%'
            }, 1000 , 'linear')

            $('.tb').eq((bang+1) % tb_length).css({
                top: '100%'
            }).animate({
                top: 0
            }, 1000 , 'linear')

            bang = bang+1 % tb_length;

        }, 2000)
    }
    auto();
    
    $('.close_btn').click(function() {
        $('.top_banner').hide();

        if($('.top_banner').hide) {
            $('.header').css({
                top: "0"
            })
        }
    });



 /////////햄버거 버튼
 $('.ham').click(function(){ 
      event.preventDefault();  //맨 위로 올라가는 것 방지
     ham( '-100%', 0);
 });
 $('.ham_close_btn').click(function(){ 
     ham( 0, '-100%');
 });
 
 function ham(right1, right2) {
     $('.ham_pan').css({
         right: right1,
         position: 'fixed'
     }).animate({
         right: right2,
         position: 'absolute'
     }, 0)
 }
 
 ////////////search버튼
 let chk = false;
 $('.search').click(function(){
     if(!chk) {
         $('.search_pan').css({
             display: 'block'
         })
     }
     chk = !chk
 })
 $('.search_close').click(function(){
     if(chk) {
         $('.search_pan').css({
             display: 'none'
         })
     }
     chk = !chk
 })


 $('.ham_li2').each(function(index) {
    $(this).click(function() {
        $('.ham_ul_inner').eq(index).stop().slideToggle(500);
    });
});

 
 //검색창
 $(document).on('click','.search_btn',function() {
     let content = $('.input_search').val().trim();
     if(content == "") {
         alert("검색단어를 입력하세요")
     }
     else {
         let frm = $("#search");
         frm.attr("action", "/list/m.search?"+content)
         frm.attr("method", "get");
         frm.submit();
     }
 });
