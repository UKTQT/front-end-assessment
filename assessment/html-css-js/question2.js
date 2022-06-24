// ASSESSMENT:
// Fill inside of the optimizeFunction function!

//Bu kod bloğunu anlayamadığımdan, anladığım kadarı ile çıktıların gösterildiği gibi olacağı şeklinde yazdım.
var valList = [];
function optimizeFunction() {
  // You shouldn't need to edit anywhere else
  // Do your work inside this function
  // SOLUTION:

  var q2Val = parseInt(document.getElementById('q2_input').value);
  //true or false result
  var result = valList.includes(q2Val);

  if(!result){
    valList.push(q2Val);      
    doExpensiveTask(q2Val);
    if(valList.length == 2){ //Eski girdiyi unutmalı kısmını anlayamadığımdan böyle bir yöntem yazdım, eğer kayıt 2 ye ulaştı ise sil tekrar başla
      valList = [];
    }
  }else{
    sameInputTask(q2Val);
  }
}

function doExpensiveTask(input) {
  const result = 2 * input;
  console.log("Doing expensive task...:", result);
  return result;
}
function sameInputTask(input) {
  const result = 2 * input;
  console.log("Same input, no need to calculate:", result);
  return result;
}


// anOptimizedFunc shouldn't execute the expensive task if new input is same as the previous one

/* const anOptimizedFunc = optimizeFunction(doExpensiveTask);
anOptimizedFunc(2); // Should print: Doing expensive task...: 4
anOptimizedFunc(2); // Should print: Same input, no need to calculate: 4
anOptimizedFunc(4); // Should print: Doing expensive task...: 8
anOptimizedFunc(4); // Should print: Same input, no need to calculate: 8
// It should forget the older input
anOptimizedFunc(2); // Should print: Doing expensive task...: 4 */


// ---------------------------------------------------------------------------------------------------------------------------


var valList2 = [];
function optimizeFunction2() {
  // You shouldn't need to edit anywhere else
  // Do your work inside this function
  // SOLUTION:

  var q2Val = parseInt(document.getElementById('q2_input2').value);
  //true or false result
  var result = valList2.includes(q2Val);

  if(!result){
    valList2.push(q2Val);      
    doAnotherExpensiveTask(q2Val);
    if(valList2.length == 2){ //Eski girdiyi unutmalı kısmını anlayamadığımdan böyle bir yöntem yazdım, eğer kayıt 2 ye ulaştı ise sil tekrar başla
      valList2 = [];
    }
  }else{
    sameInput(q2Val);
  }
}

function doAnotherExpensiveTask(input) {
  const result = 10 * input;
  console.log("Doing another expensive task...:", result);
  return result;
}
function sameInput(input) {
  const result = 10 * input;
  console.log("Same input, no need to calculate:", result);
  return result;
}

/* // We can optimize another function, which should also behave similarly
const anotherOptimizedFunc = optimizeFunction(doAnotherExpensiveTask);
anotherOptimizedFunc(2); // Should print: Doing another expensive task...: 20
anotherOptimizedFunc(2); // Should print: Same input, no need to calculate: 20
anotherOptimizedFunc(4); // Should print: Doing another expensive task...: 40
anotherOptimizedFunc(4); // Should print: Same input, no need to calculate: 40
anotherOptimizedFunc(2); // Should print: Doing another expensive task...: 20
 */