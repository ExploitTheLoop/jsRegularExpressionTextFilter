//expresiions for getting the replace value
let reg = /^B.../i //should start with this
let reg2 = /{/i //should have this in between
let reg3 = /}/i //should have this at the end
let reg7 = /};$/
let reg8 = /BYTE............{/g

//expressions for getting the offsets
let reg4 = /^VALUESINJECT\(/i //should start with this
let reg5 = /0x/g //should have this one time
let reg6 = /libue4header/g // should have this too

let upload = document.getElementById('file')
let outputBx = document.getElementById('outputBx')
let msg = document.getElementById('msg')
var decodedString = ""
upload.addEventListener('change',()=>{
    let fr = new FileReader()
    fr.readAsText(upload.files[0])
    fr.onload=function (e) {
        const fl = e.target.result
        const alllines=fl.split(/\r\n|\n/);

        decodedString+=`<tr><th>replace value</th><th>offsets</th></tr>`

      alert('please wait')
        msg.innerText='please wait'
            alllines.forEach((line) => {


                  // console.log(line);
                  if(reg.test(line)){

                    
                    console.log(line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'').replace(reg8,''))
                     decodedString+=`<tr><td>${line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'').replace(reg8,'')}</td>`
             
                 

                }
                
               
                if(reg4.test(line)){
                   console.log(line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,''))
                   decodedString+=`<td>${line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,'')}</td></tr>`
                }
              


               
    
            });

            outputBx.innerHTML=decodedString
            msg.innerText='result below'
            alert('done')

      


        
}


})





