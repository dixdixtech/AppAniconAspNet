const menuBtn = document.querySelector(".menu-icon span");
const searchBtn = document.querySelector(".search-icon");
const cancelBtn = document.querySelector(".cancel-icon");
const items = document.querySelector(".nav-items");
const form = document.querySelector("form");
menuBtn.onclick = () => {
    items.classList.add("active");
    menuBtn.classList.add("hide");
    searchBtn.classList.add("hide");
    cancelBtn.classList.add("show");
}
cancelBtn.onclick = () => {
    items.classList.remove("active");
    menuBtn.classList.remove("hide");
    searchBtn.classList.remove("hide");
    cancelBtn.classList.remove("show");
    form.classList.remove("active");
    cancelBtn.style.color = "#ff3d00";
}
searchBtn.onclick = () => {
    form.classList.add("active");
    searchBtn.classList.add("hide");
    cancelBtn.classList.add("show");
}

/* SCRIPT DO BANNER PRINCIPAL DA HOME */
$('.container-banner').slick({
    slidesToShow: 1,
    arrows: false,
    dots: false,
    infinite: true,
    autoplay: true,
    autoplaySpeed: 3000,
    responsive: [
        {
            breakpoint: 765,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
                autoplay: true,
                autoplaySpeed: 2000,
                arrows: false,
                dots: true
            }
        }
    ]
});

$('.container-img-slider').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.img-slider-nav',
    draggable: false,
    responsive: [
        {
            breakpoint: 450,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: false,
                autoplay: false,
                arrows: false,
                dots: true,
                draggable: true,
            }
        }
    ]
});

$('.img-slider-nav').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.container-img-slider',
    dots: false,
    centerMode: true,
    focusOnSelect: true,
    draggable: false
});

$('.mask-cpf').mask('000.000.000-00');
$('.mask-data').mask('00/00/0000');
$('.mask-num').mask('(00)00000-0000');
$('.mask-cep').mask('00000-000');
$('.mask-cidade').mask('AA');