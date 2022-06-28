// ASSESSMENT:
// Fill inside of the optimizeFunction function!

var funcc;
var x = '';
var output = '';

function optimizeFunction(func) {
    // You shouldn't need to edit anywhere else
    // Do your work inside this function
    // SOLUTION:

    if (typeof func === 'function') { 
      // Eğer türü ve değeri eşitse fonksiyona, 
      // funcc değişkenine, func verisini aktar ve tekrar optimizeFunctionu dön
        funcc = func;
        return optimizeFunction;
    } else {
      // Eğer farklı bir tür ise, bu da int oluyor
      // burada önceki değişkeni tutma olayı mevcut,
      // eğer gelen func verisi x değişkeni ile aynı değilse önceki değişkenle aynı değil anlamına geliyor,
      // önce x değişkenine atanıyor daha sonrada üst ifte funcc verisine eşitlenen doexpensivetask fonksiyonuna veriliyor ve çıktı sağlanıyor
      // eğer önceki değerle eşit ise önceki değerle eşit yazısını ekrana bastırıyor.

      if (x != func) {
            x = func;
            output = funcc(func);
        } else {
            console.log("Same input, no need to calculate:", output);
        }
    }
    return optimizeFunction;
}


function doExpensiveTask(input) {
  const result = 2 * input;
  console.log("Doing expensive task...:", result);
  return result;
}

// anOptimizedFunc shouldn't execute the expensive task if new input is same as the previous one
const anOptimizedFunc = optimizeFunction(doExpensiveTask);
anOptimizedFunc(2); // Should print: Doing expensive task...: 4
anOptimizedFunc(2); // Should print: Same input, no need to calculate: 4
anOptimizedFunc(4); // Should print: Doing expensive task...: 8
anOptimizedFunc(4); // Should print: Same input, no need to calculate: 8
// It should forget the older input
anOptimizedFunc(2); // Should print: Doing expensive task...: 4


// ---------------------------------


function doAnotherExpensiveTask(input) {
  const result = 10 * input;
  console.log("Doing another expensive task...:", result);
  return result;
}

// We can optimize another function, which should also behave similarly
const anotherOptimizedFunc = optimizeFunction(doAnotherExpensiveTask);
anotherOptimizedFunc(2); // Should print: Doing another expensive task...: 20
anotherOptimizedFunc(2); // Should print: Same input, no need to calculate: 20
anotherOptimizedFunc(4); // Should print: Doing another expensive task...: 40
anotherOptimizedFunc(4); // Should print: Same input, no need to calculate: 40
anotherOptimizedFunc(2); // Should print: Doing another expensive task...: 20