console.log('working')
const text = document.getElementById('text')
var offsets=["0x10705ea",
"0x12b6a70",
"0x12bfd2c",
"0x12c01ac",
"0x12c0fd4",
"0x12c1308",
"0x12c35fc",
"0x12c38a8",
"0x13451c0",
"0x13559c0",
"0x13bd570",
"0x14053a8",
"0x1406080",
"0x1484382",
"0x14ea014",
"0x159de4c",
"0x159eb74",
"0x15ca13c",
"0x15cb2e4",
"0x15cbbe8",
"0x15cc3b4",
"0x15cf1f0",
"0x15d0248",
"0x15d03c0",
"0x15d0758",
"0x15d0964",
"0x15d0cfc",
"0x15d1370",
"0x15d1cd8",
"0x15d1f6c",
"0x15eac74",
"0x15eaf6c",
"0x1616d58",
"0x16176f8",
"0x167f44c",
"0x167fca8",
"0x1685c54",
"0x168863c",
"0x1688f14",
"0x1688fe4",
"0x168936c",
"0x1690c0c",
"0x169200c",
"0x1698028",
"0x16a0640",
"0x16bd520",
"0x16cd794",
"0x16ddd08",
"0x1709ff4",
"0x1730e50",
"0x17318d0"]



var replaceval=["a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 1e ff 2f e1",
"0 0 a0 e3 0 0 a0 e3 1e ff 2f e1"]



var lusString=""

if(replaceval.length == offsets.length){

    for (let index = 0; index < replaceval.length; index++) {
        let rep=replaceval[index]
        let off=offsets[index]
        lusString+='\ngg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) \nname("libUE4.so") \noffset = '+off+' \noriginal("7F 45 4C 46 01 01 01 00") \nreplaced("'+rep+'") \ngg.clearResults()'+"\n\n"
        
        
        
        
        
    }
    

}else{
    console.log('length of the arrays are not same')
   
}
console.log(lusString)
text.innerText=lusString