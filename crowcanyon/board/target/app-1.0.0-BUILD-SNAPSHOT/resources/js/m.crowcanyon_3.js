/*let cateNo = get_info_from_url("cateNo")
let itemNo = get_info_from_url("itemNo") - 1

let item = `
    <img src="./img/crowcanyon/page2/${EL_ARR[cateNo]}/${ITEM[cateNo][itemNo].img}" alt="">
    <img src="./img/crowcanyon/page2/ex/${ITEM[cateNo][itemNo].ex}/1.jpg"alt="">
    <img src="./img/crowcanyon/page2/ex/${ITEM[cateNo][itemNo].ex}/2.jpg"alt="">
    <img src="./img/crowcanyon/page2/ex/${ITEM[cateNo][itemNo].ex}/3.jpg"alt="">
    <img src="./img/crowcanyon/page2/ex/${ITEM[cateNo][itemNo].ex}/4.jpg"alt="">
    <img src="./img/crowcanyon/page2/ex/${ITEM[cateNo][itemNo].ex}/5.jpg"alt="">
`
$('.content_L').append(item)

let detail = `
    <h3 class="name">${ITEM[cateNo][itemNo].name}</h3>
    <div class="dec">${ITEM[cateNo][itemNo].dec}</div>
    <div class="price">
        <div class="o_price">￦${comma(ITEM[cateNo][itemNo].o_price)}</div>
        <div class="s_price">(￦${comma(ITEM[cateNo][itemNo].s_price)})</div>
    </div>
    <div class="delivery">택배 ￦3,000 (￦50,000 이상 구매 시 무료)</div>
    <div class="item_no_box">
        <div class="name_s">${ITEM[cateNo][itemNo].name}</div>
        <div class="si_2">
            <input type="button" value="▲" class="btn_qty_plus btn">
            <input type="text" class="txt_qty" value="1">
            <input type="button" value="▼" class="btn_qty_minus btn">
        </div>
    </div>
    <div class="each_price">TOTAL : ￦<span class="f_price">0</span> (<span class="f_count">0</span>개)</div>
    <div class="buy long_btn"><a href="#">구매하기</a></div>
    <div class="cart long_btn"><a href="#">장바구니</a></div>
`
$('.content_R').append(detail)*/

total_price();

$(document).on('click', '.btn_qty_plus' ,function(){
    $('.txt_qty').val( +$('.txt_qty').val() +1 )
    total_price();
})
$(document).on('click', '.btn_qty_minus' ,function(){
    if($('.txt_qty').val() > 1 ){
        $('.txt_qty').val( +$('.txt_qty').val() - 1 )
    }
    else {
        alert("최소 주문수량은 1개 입니다.")
    }
    total_price();
})


function total_price() {
    let total_price=0;
    let total_qty = 0;

    let o_price = $('.o_price').text().substring(1);
    o_price = parseFloat(o_price);


    total_price += $('.txt_qty').val() * o_price;

    total_qty += +$('.txt_qty').val();


    $('.f_price').text(comma(total_price))

    $('.f_count').text(total_qty)
}




