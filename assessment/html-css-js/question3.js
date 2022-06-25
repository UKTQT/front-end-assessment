// ASSESSMENT:
// There is a text input in index.html which you will use
// Write a program such that:
// When we start typing inside the input,
// it will console.log the text only if we didn't type anything in the last 500ms
// You can find an example of the solution working in question3.gif
// Don't forget to add this file with script tag into index.html

// Hint: google 'debouncing'

// SOLUTION:

// timer, ms ve inputu idsi ile dinlediğimiz değişkenlerimiz var.
// inputun, karakter girildiği (keydown) ve karakter girilmesi bırakıldığı (keyup) anlarının tetiklenmelerini dinliyoruz.
// Eğer inputa karakter girilip bırakıldıysa (keyup), timer sıfırlanır ve o an bir setTimeOut başlatılır.
// 500 ms, giriş olmadığı sürece işler ve sonunda fonksiyon çalışır.
// Eğer setTimeOuta verilen ms devam ederken yeni bir karakter girişi olursa,
// keydown tetiklenme dinlemesi çalışır ve timeri sıfırlar, hemen ardından keyup tekrar çalışır ve üstteki işlemler devam eder.

var timer;
var ms = 500;
const inputVal = document.querySelector('#a_text');

inputVal.addEventListener('keyup',function (e){
    clearTimeout(timer);
    timer = setTimeout(() => {console.log(e.target.value);}, ms);
});

inputVal.addEventListener('keydown',function () {
    clearTimeout(timer);
});