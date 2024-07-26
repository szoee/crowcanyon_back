

    ////////////sec 휠이벤트 + 보러가기 버튼
    $('.more').eq(0).animate({
        bottom: '6%',
        opacity: 1
    }, 600)

    let chk_scroll = true;
    $('.sec').on('mousewheel DOMMouseScroll', function(event){
        event.preventDefault();

        // 스크롤 움찔거리는거 방지
        if(chk_scroll) {
            chk_scroll = false;

            setTimeout(()=>{
                chk_scroll = true;
            }, 500)


            let dir = event.originalEvent.wheelDelta;
            let o_top;
            if(dir < 0) {

                if($(this).next().length > 0) {
                    o_top = $(this).next().offset().top
                    setTimeout(() => {
                        $(this).next().find('.more').animate({
                            bottom: '6%',
                            opacity: 1
                        }, 1000);
                    }, 500);
                }
            }
            else if(dir > 0) {

                if($(this).prev().length > 0) {
                    o_top = $(this).prev().offset().top

                }
            }

            $('html, body').stop(true).animate({
                scrollTop: o_top
            }, 500)
        }
    });

        //휠 인디케이터
        let sec_length = $('.sec').length;
        let arr_o_top = [];
        let arr_o_bot = [];
        for(let i=0; i<sec_length; i++) {
            let tmp_o_top = $('.sec').eq(i).offset().top
            arr_o_top.push(  tmp_o_top )

            arr_o_bot.push(  tmp_o_top + $(`#sec${i+1}`).outerHeight() )
        }

        $(window).scroll(function(){
            let s_top = $(window).scrollTop() + 500;

            for(let i=0; i<sec_length; i++) {
                if(arr_o_top[i] <= s_top && s_top < arr_o_bot[i]) {
                    $('.move span').removeClass('move_active').eq(i).addClass('move_active')
                    break;
                }
            }
        });

            $(document).on('click', '.move li a', function(event){
            event.preventDefault();

            let href = $(this).attr('href');
            let o_top = $(href).offset().top

            $('html, body').animate({
                scrollTop: o_top
            }, 1000)
        });

