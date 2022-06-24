// ASSESSMENT:
// There is a text input in index.html which you will use
// Write a program such that:
// When we start typing inside the input,
// it will console.log the text only if we didn't type anything in the last 500ms
// You can find an example of the solution working in question3.gif
// Don't forget to add this file with script tag into index.html

// Hint: google 'debouncing'

// SOLUTION:

// Bir timer, bir ms ve inputu idsi ile seçtiğimiz değişkenimiz var.
// inputun, karakter girildiği (keydown) ve karakter girilmesi bırakıldığı (keyup) anlarının tetiklenmelerini dinliyoruz.
// Eğer inputa karakter girilip bırakıldıysa (keyup), o an timer değişkeni, bir setTimeOut başlatıyor ve herhangi başka bir giriş olasıya kadar ms işliyor ve sonunda fonksiyon çalışıyor.
// Eğer setTimeOuta verilen ms devam ederken bir kere daha karakter girişi olursa, keydown tetiklenme dinlemesi çalışır ve timeri sıfırlar, bu sayede keyup tekrar çalışır ve üstteki işlemler devam eder.

var timer;
var ms = 500;
const inputVal = document.querySelector('#a_text');

inputVal.addEventListener('keyup',function (e){
    clearTimeout(timer);
    timer = setTimeout(() => {
        console.log(e.target.value);
    }, ms);
});

inputVal.addEventListener('keydown',function () {
    clearTimeout(timer);
});