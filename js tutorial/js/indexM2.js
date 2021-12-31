//expresiions for getting the replace value
let reg = /^BYTE/i //should start with this
let reg2 = /{/i //should have this in between
let reg3 = /}/i //should have this at the end
let reg7 = /};$/
let reg8 = /BYTE............{/g

//expressions for getting the offsets
//let reg4 = /^VALUESINJECT\(/i //should start with this
let reg4 = /^VALUESINJECT\(/i //should start with this
let reg5 = /0x/g //should have this one time
let reg6 = /libue4header/g // should have this too

let upload = document.getElementById('file')
let outputBx = document.getElementById('outputBx')
let msg = document.getElementById('msg')
var decodedString = ""
var count=0
localStorage.clear()
var replace=[]
var offsets=[]
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

              count+=1


                 // console.log('line  ',line);
                  if(reg.test(line)){

                    
                   // console.log(line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'').replace(reg8,''))
                    replace.push(line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'').replace(reg8,''))
                     decodedString+=`<tr><td>${line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'').replace(reg8,'')}</td>`
             
                 

                }else{
                 // console.log('failedfirst')
                  
                }
                
               
                if(reg4.test(line)){
                  // console.log(line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,''))
                   offsets.push(line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,''))
                   decodedString+=`<td>${line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,'')}</td></tr>`
                }else{
                 // console.log('failed second')
                  
                }
              


               
    
            });

            outputBx.innerHTML=decodedString
           // localStorage.setItem('replace',replace)
            //localStorage.setItem('offsets',offsets)
            msg.innerText=count

            alert('done')

            var lusString=""

            if(replace.length == offsets.length){

                for (let index = 0; index < replace.length; index++) {
                    let rep=replace[index]
                    let off=offsets[index]
                   // lusString+='\ngg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) \nname("libUE4.so") \noffset = '+off+' \noriginal("7F 45 4C 46 01 01 01 00") \nreplaced("'+rep.replace(/0 0/g,'00').replace(/^ /,'').replace(/ $/,'').toString().toUpperCase()+'") \ngg.clearResults()'+"\n\n"
                   lusString+=`\nawait ReplaceBytes(LIBUE4, "${off}", "${rep.replace(/0 0/g,'00').replace(/^ /,'').replace(/ $/,'').toString().toUpperCase()}");`
                    
                    
                    
                    
                    
                }
                

            }else{
                //console.log(offsets)
                //console.log(replaceval)
                console.log('not matched the lenght of two arrays')
              
            }
            msg.innerText=lusString
            console.log(lusString)

      


        
}


})





