document.getElementById("waktupengambilan").min = new Date().getFullYear() + "-" +  parseInt(new Date().getMonth() + 1 ) + "-" + new Date().getDate();

function setprice(price){
    document.getElementById("price").innerHTML = price;
} 

